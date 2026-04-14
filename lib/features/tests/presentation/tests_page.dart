import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/constants/permission_keys.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/auth/presentation/auth_provider.dart';
import 'package:may_mobile/features/tests/domain/test_model.dart';
import 'package:may_mobile/features/tests/presentation/test_form_dialog.dart';
import 'package:may_mobile/features/tests/presentation/tests_provider.dart';
import 'package:may_mobile/shared/widgets/confirm_dialog.dart';
import 'package:may_mobile/shared/widgets/empty_state_widget.dart';
import 'package:may_mobile/shared/widgets/status_chip.dart';

class TestsPage extends ConsumerStatefulWidget {
  const TestsPage({super.key});

  @override
  ConsumerState<TestsPage> createState() => _TestsPageState();
}

class _TestsPageState extends ConsumerState<TestsPage> {
  bool _showFilters = false;
  String? _statusFilter;

  void _applyFilters() {
    final filters = <String, String>{};
    if (_statusFilter != null) filters['status'] = _statusFilter!;
    ref.read(testsProvider.notifier).setFilters(filters);
  }

  void _clearFilters() {
    setState(() => _statusFilter = null);
    ref.read(testsProvider.notifier).clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(testsProvider);
    final authNotifier = ref.read(authProvider.notifier);
    final canCreate = authNotifier.hasPermission(PermissionKeys.testCreate);
    final canUpdate = authNotifier.hasPermission(PermissionKeys.testUpdate);
    final canDelete = authNotifier.hasPermission(PermissionKeys.testDelete);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Testler',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  )),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _showFilters ? Icons.filter_list_off : Icons.filter_list,
                      color: AppColors.primary,
                    ),
                    onPressed: () => setState(() => _showFilters = !_showFilters),
                  ),
                  if (canCreate)
                    FilledButton.icon(
                      onPressed: () => _showFormDialog(context),
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Yeni'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),

        if (_showFilters)
          Container(
            margin: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _statusFilter,
                    decoration: const InputDecoration(labelText: 'Durum', isDense: true),
                    items: const [
                      DropdownMenuItem(value: null, child: Text('Tumu')),
                      DropdownMenuItem(value: 'ACTIVE', child: Text('ACTIVE')),
                      DropdownMenuItem(value: 'INACTIVE', child: Text('INACTIVE')),
                    ],
                    onChanged: (v) => setState(() => _statusFilter = v),
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(onPressed: _applyFilters, icon: const Icon(Icons.search, size: 18), label: const Text('Ara')),
                const SizedBox(width: 8),
                OutlinedButton(onPressed: _clearFilters, child: const Text('Temizle')),
              ],
            ),
          ),

        const SizedBox(height: 12),

        Expanded(
          child: state.when(
            data: (pageResponse) {
              if (pageResponse.content.isEmpty) {
                return const EmptyStateWidget(icon: Icons.science_outlined, message: 'Test bulunamadi');
              }
              return RefreshIndicator(
                onRefresh: () => ref.read(testsProvider.notifier).fetchTests(),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: pageResponse.content.length,
                        itemBuilder: (context, index) {
                          final item = pageResponse.content[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: AppColors.info.withValues(alpha: 0.1),
                                child: const Icon(Icons.science, color: AppColors.info, size: 20),
                              ),
                              title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                              subtitle: Text(item.moduleName, style: const TextStyle(fontSize: 12)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  StatusChip(status: item.status),
                                  if (canUpdate || canDelete)
                                    PopupMenuButton<String>(
                                      onSelected: (v) {
                                        if (v == 'edit') _showFormDialog(context, test: item);
                                        if (v == 'delete') _handleDelete(item);
                                      },
                                      itemBuilder: (_) => [
                                        if (canUpdate) const PopupMenuItem(value: 'edit', child: Text('Duzenle')),
                                        if (canDelete) const PopupMenuItem(value: 'delete', child: Text('Sil')),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (pageResponse.totalPages > 1)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: pageResponse.number > 0 ? () => ref.read(testsProvider.notifier).setPage(pageResponse.number - 1) : null,
                              icon: const Icon(Icons.chevron_left),
                            ),
                            Text('${pageResponse.number + 1} / ${pageResponse.totalPages}', style: const TextStyle(fontWeight: FontWeight.w500)),
                            IconButton(
                              onPressed: pageResponse.number < pageResponse.totalPages - 1 ? () => ref.read(testsProvider.notifier).setPage(pageResponse.number + 1) : null,
                              icon: const Icon(Icons.chevron_right),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hata: ${e is ApiException ? e.message : 'Yuklenemedi'}'),
                  const SizedBox(height: 8),
                  FilledButton(onPressed: () => ref.read(testsProvider.notifier).fetchTests(), child: const Text('Tekrar Dene')),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showFormDialog(BuildContext context, {TestItem? test}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => TestFormDialog(
        test: test,
        onSave: (request) async {
          if (test != null) {
            await ref.read(testsProvider.notifier).updateTest(test.id, request as UpdateTestRequest);
          } else {
            await ref.read(testsProvider.notifier).createTest(request as CreateTestRequest);
          }
        },
      ),
    );
  }

  Future<void> _handleDelete(TestItem item) async {
    final confirmed = await showConfirmDialog(context,
        title: 'Testi Sil', message: '${item.name} testini silmek istediginize emin misiniz?');
    if (confirmed) {
      try {
        await ref.read(testsProvider.notifier).deleteTest(item.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Test silindi'), backgroundColor: AppColors.success));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e is ApiException ? e.message : 'Silinemedi'), backgroundColor: AppColors.error));
        }
      }
    }
  }
}

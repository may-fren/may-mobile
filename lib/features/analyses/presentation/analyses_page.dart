import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/constants/permission_keys.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/auth/presentation/auth_provider.dart';
import 'package:may_mobile/features/analyses/domain/analysis_model.dart';
import 'package:may_mobile/features/analyses/presentation/analysis_form_dialog.dart';
import 'package:may_mobile/features/analyses/presentation/analyses_provider.dart';
import 'package:may_mobile/shared/widgets/confirm_dialog.dart';
import 'package:may_mobile/shared/widgets/empty_state_widget.dart';
import 'package:may_mobile/shared/widgets/status_chip.dart';

class AnalysesPage extends ConsumerStatefulWidget {
  const AnalysesPage({super.key});

  @override
  ConsumerState<AnalysesPage> createState() => _AnalysesPageState();
}

class _AnalysesPageState extends ConsumerState<AnalysesPage> {
  bool _showFilters = false;
  String? _statusFilter;

  void _applyFilters() {
    final filters = <String, String>{};
    if (_statusFilter != null) filters['status'] = _statusFilter!;
    ref.read(analysesProvider.notifier).setFilters(filters);
  }

  void _clearFilters() {
    setState(() => _statusFilter = null);
    ref.read(analysesProvider.notifier).clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(analysesProvider);
    final authNotifier = ref.read(authProvider.notifier);
    final canCreate = authNotifier.hasPermission(PermissionKeys.analysisCreate);
    final canUpdate = authNotifier.hasPermission(PermissionKeys.analysisUpdate);
    final canDelete = authNotifier.hasPermission(PermissionKeys.analysisDelete);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Analizler',
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
                return const EmptyStateWidget(icon: Icons.analytics_outlined, message: 'Analiz bulunamadı');
              }
              return RefreshIndicator(
                onRefresh: () => ref.read(analysesProvider.notifier).fetchAnalyses(),
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
                                child: const Icon(Icons.analytics, color: AppColors.info, size: 20),
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
                                        if (v == 'edit') _showFormDialog(context, analysis: item);
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
                              onPressed: pageResponse.number > 0 ? () => ref.read(analysesProvider.notifier).setPage(pageResponse.number - 1) : null,
                              icon: const Icon(Icons.chevron_left),
                            ),
                            Text('${pageResponse.number + 1} / ${pageResponse.totalPages}', style: const TextStyle(fontWeight: FontWeight.w500)),
                            IconButton(
                              onPressed: pageResponse.number < pageResponse.totalPages - 1 ? () => ref.read(analysesProvider.notifier).setPage(pageResponse.number + 1) : null,
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
                  Text('Hata: ${e is ApiException ? e.message : 'Yüklenemedi'}'),
                  const SizedBox(height: 8),
                  FilledButton(onPressed: () => ref.read(analysesProvider.notifier).fetchAnalyses(), child: const Text('Tekrar Dene')),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showFormDialog(BuildContext context, {Analysis? analysis}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => AnalysisFormDialog(
        analysis: analysis,
        onSave: (request) async {
          if (analysis != null) {
            await ref.read(analysesProvider.notifier).updateAnalysis(analysis.id, request as UpdateAnalysisRequest);
          } else {
            await ref.read(analysesProvider.notifier).createAnalysis(request as CreateAnalysisRequest);
          }
        },
      ),
    );
  }

  Future<void> _handleDelete(Analysis item) async {
    final confirmed = await showConfirmDialog(context,
        title: 'Analizi Sil', message: '${item.name} analizini silmek istediginize emin misiniz?');
    if (confirmed) {
      try {
        await ref.read(analysesProvider.notifier).deleteAnalysis(item.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Analiz silindi'), backgroundColor: AppColors.success));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e is ApiException ? e.message : 'Silinemedi'), backgroundColor: AppColors.error));
        }
      }
    }
  }
}

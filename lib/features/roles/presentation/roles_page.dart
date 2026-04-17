import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/constants/permission_keys.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/auth/presentation/auth_provider.dart';
import 'package:may_mobile/features/roles/domain/role_model.dart';
import 'package:may_mobile/features/roles/presentation/role_form_dialog.dart';
import 'package:may_mobile/features/roles/presentation/role_permissions_sheet.dart';
import 'package:may_mobile/features/roles/presentation/roles_provider.dart';
import 'package:may_mobile/shared/widgets/confirm_dialog.dart';
import 'package:may_mobile/shared/widgets/empty_state_widget.dart';
import 'package:may_mobile/shared/widgets/status_chip.dart';

class RolesPage extends ConsumerStatefulWidget {
  const RolesPage({super.key});

  @override
  ConsumerState<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends ConsumerState<RolesPage> {
  bool _showFilters = false;
  String? _statusFilter;

  void _applyFilters() {
    final filters = <String, String>{};
    if (_statusFilter != null) filters['status'] = _statusFilter!;
    ref.read(rolesProvider.notifier).setFilters(filters);
  }

  void _clearFilters() {
    setState(() => _statusFilter = null);
    ref.read(rolesProvider.notifier).clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    final rolesState = ref.watch(rolesProvider);
    final authNotifier = ref.read(authProvider.notifier);
    final canCreate = authNotifier.hasPermission(PermissionKeys.rolesCreate);
    final canUpdate = authNotifier.hasPermission(PermissionKeys.rolesUpdate);
    final canDelete = authNotifier.hasPermission(PermissionKeys.rolesDelete);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Roller',
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

        // Filters
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
                    decoration: const InputDecoration(
                      labelText: 'Durum',
                      isDense: true,
                    ),
                    items: const [
                      DropdownMenuItem(value: null, child: Text('Tumu')),
                      DropdownMenuItem(value: 'ACTIVE', child: Text('ACTIVE')),
                      DropdownMenuItem(value: 'INACTIVE', child: Text('INACTIVE')),
                    ],
                    onChanged: (v) => setState(() => _statusFilter = v),
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(
                  onPressed: _applyFilters,
                  icon: const Icon(Icons.search, size: 18),
                  label: const Text('Ara'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: _clearFilters,
                  child: const Text('Temizle'),
                ),
              ],
            ),
          ),

        const SizedBox(height: 12),

        Expanded(
          child: rolesState.when(
            data: (pageResponse) {
              if (pageResponse.content.isEmpty) {
                return const EmptyStateWidget(icon: Icons.star_outline, message: 'Rol bulunamadı');
              }
              return RefreshIndicator(
                onRefresh: () => ref.read(rolesProvider.notifier).fetchRoles(),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: pageResponse.content.length,
                        itemBuilder: (context, index) {
                          final role = pageResponse.content[index];
                          return _RoleCard(
                            role: role,
                            canUpdate: canUpdate,
                            canDelete: canDelete,
                            onEdit: () => _showFormDialog(context, role: role),
                            onDelete: () => _handleDelete(role),
                            onPermissions: () => _showPermissionsSheet(context, role),
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
                              onPressed: pageResponse.number > 0
                                  ? () => ref.read(rolesProvider.notifier).setPage(pageResponse.number - 1)
                                  : null,
                              icon: const Icon(Icons.chevron_left),
                            ),
                            Text(
                              '${pageResponse.number + 1} / ${pageResponse.totalPages}',
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              onPressed: pageResponse.number < pageResponse.totalPages - 1
                                  ? () => ref.read(rolesProvider.notifier).setPage(pageResponse.number + 1)
                                  : null,
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
                  FilledButton(
                    onPressed: () => ref.read(rolesProvider.notifier).fetchRoles(),
                    child: const Text('Tekrar Dene'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showFormDialog(BuildContext context, {Role? role}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => RoleFormDialog(
        role: role,
        onSave: (request) async {
          if (role != null) {
            await ref.read(rolesProvider.notifier).updateRole(role.id, request as UpdateRoleRequest);
          } else {
            await ref.read(rolesProvider.notifier).createRole(request as CreateRoleRequest);
          }
        },
      ),
    );
  }

  Future<void> _handleDelete(Role role) async {
    final confirmed = await showConfirmDialog(context,
        title: 'Rolu Sil', message: '${role.name} rolunu silmek istediginize emin misiniz?');
    if (confirmed) {
      try {
        await ref.read(rolesProvider.notifier).deleteRole(role.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Rol silindi'), backgroundColor: AppColors.success),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e is ApiException ? e.message : 'Silinemedi'),
            backgroundColor: AppColors.error,
          ));
        }
      }
    }
  }

  void _showPermissionsSheet(BuildContext context, Role role) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => RolePermissionsSheet(role: role),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final Role role;
  final bool canUpdate;
  final bool canDelete;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onPermissions;

  const _RoleCard({
    required this.role,
    required this.canUpdate,
    required this.canDelete,
    required this.onEdit,
    required this.onDelete,
    required this.onPermissions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.warning.withValues(alpha: 0.1),
                  child: const Icon(Icons.star, color: AppColors.warning, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role.name,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      if (role.description != null && role.description!.isNotEmpty)
                        Text(
                          role.description!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                        ),
                    ],
                  ),
                ),
                StatusChip(status: role.status),
              ],
            ),
            if (canUpdate || canDelete) ...[
              const Divider(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (canUpdate) ...[
                    TextButton.icon(
                      onPressed: onPermissions,
                      icon: const Icon(Icons.security_outlined, size: 16),
                      label: const Text('Yetkiler'),
                      style: TextButton.styleFrom(foregroundColor: AppColors.primary),
                    ),
                    TextButton.icon(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit_outlined, size: 16),
                      label: const Text('Duzenle'),
                      style: TextButton.styleFrom(foregroundColor: AppColors.info),
                    ),
                  ],
                  if (canDelete)
                    TextButton.icon(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete_outline, size: 16),
                      label: const Text('Sil'),
                      style: TextButton.styleFrom(foregroundColor: AppColors.error),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

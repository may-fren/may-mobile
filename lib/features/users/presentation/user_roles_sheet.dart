import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/roles/presentation/roles_provider.dart';
import 'package:may_mobile/features/users/domain/user_model.dart';
import 'package:may_mobile/features/users/domain/user_role_model.dart';
import 'package:may_mobile/features/users/presentation/users_provider.dart';
import 'package:may_mobile/shared/widgets/modern_sheet.dart';

class UserRolesSheet extends ConsumerStatefulWidget {
  final User user;

  const UserRolesSheet({super.key, required this.user});

  @override
  ConsumerState<UserRolesSheet> createState() => _UserRolesSheetState();
}

class _UserRolesSheetState extends ConsumerState<UserRolesSheet> {
  int? _selectedRoleId;
  bool _assigning = false;
  List<UserRoleResponse> _userRoles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadRoles();
  }

  Future<void> _loadRoles() async {
    setState(() => _loading = true);
    try {
      final roles = await ref
          .read(userRoleRepositoryProvider)
          .getRolesByUserId(widget.user.id);
      setState(() {
        _userRoles = roles;
        _loading = false;
      });
    } catch (_) {
      setState(() => _loading = false);
    }
  }

  Future<void> _assignRole() async {
    if (_selectedRoleId == null) return;
    setState(() => _assigning = true);
    try {
      await ref.read(userRoleRepositoryProvider).assignRoleToUser(
            UserRoleRequest(userId: widget.user.id, roleId: _selectedRoleId!),
          );
      _selectedRoleId = null;
      await _loadRoles();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Rol atandı'), backgroundColor: AppColors.success),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e is ApiException ? e.message : 'Rol atanamadı'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _assigning = false);
    }
  }

  Future<void> _removeRole(int urId) async {
    try {
      await ref.read(userRoleRepositoryProvider).removeUserRole(urId);
      await _loadRoles();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Rol kaldırıldı'), backgroundColor: AppColors.success),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e is ApiException ? e.message : 'Rol kaldırılamadı'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final allRolesState = ref.watch(allRolesProvider);
    final assignedRoleIds = _userRoles.map((ur) => ur.roleId).toSet();

    return ModernSheet(
      title: '${widget.user.username} — Roller',
      icon: Icons.star_outline,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Assign role
            allRolesState.when(
              data: (roles) {
                final available =
                    roles.where((r) => !assignedRoleIds.contains(r.id)).toList();
                return Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        value: _selectedRoleId,
                        decoration: modernInputDecoration(label: 'Rol seçin...'),
                        items: available
                            .map((r) =>
                                DropdownMenuItem(value: r.id, child: Text(r.name)))
                            .toList(),
                        onChanged: (v) => setState(() => _selectedRoleId = v),
                      ),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.icon(
                      onPressed: (_selectedRoleId != null && !_assigning)
                          ? _assignRole
                          : null,
                      icon: _assigning
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : const Icon(Icons.add, size: 18),
                      label: const Text('Ata'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        minimumSize: const Size(0, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (_, __) => const Text('Roller yüklenemedi'),
            ),

            const SizedBox(height: 20),

            // Assigned roles list
            Flexible(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : _userRoles.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star_border, size: 48, color: AppColors.textSecondary.withValues(alpha: 0.4)),
                              const SizedBox(height: 8),
                              const Text(
                                'Atanmış rol yok',
                                style: TextStyle(color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemCount: _userRoles.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final ur = _userRoles[index];
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.warning.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.star, color: AppColors.warning, size: 18),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      ur.roleName,
                                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline, color: AppColors.error, size: 22),
                                    onPressed: () => _removeRole(ur.id),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

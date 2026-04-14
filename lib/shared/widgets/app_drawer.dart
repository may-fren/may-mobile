import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/constants/permission_keys.dart';
import 'package:may_mobile/features/auth/presentation/auth_provider.dart';

class _MenuItem {
  final String path;
  final IconData icon;
  final String label;
  final String group;
  final String? requiredPermission;

  const _MenuItem({
    required this.path,
    required this.icon,
    required this.label,
    required this.group,
    this.requiredPermission,
  });
}

const _allMenuItems = [
  _MenuItem(path: '/dashboard', icon: Icons.dashboard_outlined, label: 'Dashboard', group: 'GENEL'),
  _MenuItem(path: '/users', icon: Icons.person_outline, label: 'Kullanıcılar', group: 'YÖNETİM', requiredPermission: PermissionKeys.userRead),
  _MenuItem(path: '/roles', icon: Icons.star_outline, label: 'Roller', group: 'YÖNETİM', requiredPermission: PermissionKeys.rolesRead),
  _MenuItem(path: '/permissions', icon: Icons.security_outlined, label: 'Yetkiler', group: 'YÖNETİM', requiredPermission: PermissionKeys.permissionRead),
  _MenuItem(path: '/modules', icon: Icons.widgets_outlined, label: 'Modüller', group: 'OPERASYON', requiredPermission: PermissionKeys.moduleRead),
  _MenuItem(path: '/analyses', icon: Icons.analytics_outlined, label: 'Analizler', group: 'OPERASYON', requiredPermission: PermissionKeys.analysisRead),
  _MenuItem(path: '/tests', icon: Icons.science_outlined, label: 'Testler', group: 'OPERASYON', requiredPermission: PermissionKeys.testRead),
  _MenuItem(path: '/settings', icon: Icons.settings_outlined, label: 'Ayarlar', group: 'GENEL'),
];

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);
    final user = authState.valueOrNull;
    final currentPath = GoRouterState.of(context).matchedLocation;

    final visibleItems = _allMenuItems.where((item) {
      if (item.requiredPermission == null) return true;
      return authNotifier.hasPermission(item.requiredPermission!);
    }).toList();

    // Group items
    final groups = <String, List<_MenuItem>>{};
    for (final item in visibleItems) {
      groups.putIfAbsent(item.group, () => []).add(item);
    }

    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryDarkest,
              AppColors.primaryDarker,
              AppColors.primaryDark,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'M',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'MAY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(color: Colors.white24, height: 1),

              // Grouped menu
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: groups.entries.expand((entry) {
                    return [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
                        child: Text(
                          entry.key,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.5),
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      ...entry.value.map((item) {
                        final isSelected = currentPath == item.path;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: ListTile(
                            leading: Icon(
                              item.icon,
                              color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
                              size: 22,
                            ),
                            title: Text(
                              item.label,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            selected: isSelected,
                            selectedTileColor: Colors.white.withValues(alpha: 0.15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              context.go(item.path);
                            },
                          ),
                        );
                      }),
                    ];
                  }).toList(),
                ),
              ),

              // User info + logout
              const Divider(color: Colors.white24, height: 1),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                      child: Text(
                        (user?.username ?? '').substring(0, (user?.username ?? '').length >= 2 ? 2 : (user?.username ?? '').length).toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        user?.username ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.logout, color: Colors.white70, size: 20),
                      onPressed: () async {
                        Navigator.of(context).pop();
                        await ref.read(authProvider.notifier).logout();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/utils/date_utils.dart';
import 'package:may_mobile/features/auth/presentation/auth_provider.dart';
import 'package:may_mobile/features/dashboard/presentation/dashboard_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(authProvider.select((s) => s.valueOrNull?.username));
    final dashboardAsync = ref.watch(dashboardProvider);

    return dashboardAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: AppColors.textSecondary),
            const SizedBox(height: 12),
            const Text('Veriler yuklenemedi', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => ref.invalidate(dashboardProvider),
              child: const Text('Tekrar Dene'),
            ),
          ],
        ),
      ),
      data: (stats) => RefreshIndicator(
        onRefresh: () async => ref.invalidate(dashboardProvider),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Hos geldiniz, ${username ?? ''}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'MAY yonetim paneline genel bakis',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 20),

              // Stat Cards - horizontal scroll
              _StatCardsStrip(stats: stats),
              const SizedBox(height: 20),

              // User Status Distribution
              _SectionCard(
                title: 'Kullanici Durumlari',
                child: _UserStatusDist(stats: stats),
              ),
              const SizedBox(height: 12),

              // Service City Distribution
              _SectionCard(
                title: 'Servislerin Sehir Dagilimi',
                child: _BarDist(
                  entries: _buildDist(stats.allServices, (s) => s.city ?? 'Bilinmiyor'),
                  color: AppColors.success,
                  gradientEnd: const Color(0xFF3CB371),
                ),
              ),
              const SizedBox(height: 12),

              // Module Brand Distribution
              _SectionCard(
                title: 'Modul Marka Dagilimi',
                child: _BarDist(
                  entries: _buildDist(stats.allModules, (m) => m.brand),
                  color: const Color(0xFFE67E22),
                  gradientEnd: const Color(0xFFF39C12),
                ),
              ),
              const SizedBox(height: 12),

              // Recent Modules
              _SectionCard(
                title: 'Son Eklenen Moduller',
                child: Column(
                  children: stats.recentModules.map((m) => _RecentItemTile(
                    title: m.name,
                    subtitle: '${m.brand} / ${m.model}',
                    status: m.status,
                    date: formatDate(m.createdDate),
                  )).toList(),
                ),
              ),
              const SizedBox(height: 12),

              // Recent Analyses
              _SectionCard(
                title: 'Son Eklenen Analizler',
                child: Column(
                  children: stats.recentAnalyses.map((a) => _RecentItemTile(
                    title: a.name,
                    subtitle: a.moduleName,
                    status: a.status,
                    date: formatDate(a.createdDate),
                  )).toList(),
                ),
              ),
              const SizedBox(height: 12),

              // Recent Tests
              _SectionCard(
                title: 'Son Eklenen Testler',
                child: Column(
                  children: stats.recentTests.map((t) => _RecentItemTile(
                    title: t.name,
                    subtitle: t.moduleName,
                    status: t.status,
                    date: formatDate(t.createdDate),
                  )).toList(),
                ),
              ),
              const SizedBox(height: 12),

              // Recent Logins
              _SectionCard(
                title: 'Son Giris Yapan Kullanicilar',
                icon: Icons.access_time,
                child: Column(
                  children: stats.recentLogins.map((u) => _RecentItemTile(
                    title: u.username,
                    subtitle: '${u.firstName} ${u.lastName}',
                    status: u.status,
                    date: formatDateTime(u.lastLoginDate),
                  )).toList(),
                ),
              ),
              const SizedBox(height: 20),

              Center(
                child: Text(
                  'Veriler anlik olarak API\'den cekilmektedir.',
                  style: TextStyle(fontSize: 11, color: AppColors.textSecondary.withValues(alpha: 0.5)),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  static List<MapEntry<String, int>> _buildDist<T>(List<T> items, String Function(T) keyFn) {
    final map = <String, int>{};
    for (final item in items) {
      final key = keyFn(item);
      map[key] = (map[key] ?? 0) + 1;
    }
    final entries = map.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    return entries.take(8).toList();
  }
}

// ─── Stat Cards Horizontal Strip ───

class _StatCardsStrip extends StatelessWidget {
  final DashboardStats stats;
  const _StatCardsStrip({required this.stats});

  @override
  Widget build(BuildContext context) {
    final cards = [
      _StatInfo('Kullanicilar', stats.users, Icons.person_outline, const Color(0xFF1A2744), const Color(0xFFEEF1F8)),
      _StatInfo('Moduller', stats.modules, Icons.apps, const Color(0xFFE67E22), const Color(0xFFFFF3E0)),
      _StatInfo('Analizler', stats.analyses, Icons.search, const Color(0xFF2563EB), const Color(0xFFE8F0FE)),
      _StatInfo('Testler', stats.tests, Icons.science_outlined, const Color(0xFF7C3AED), const Color(0xFFF3E8FF)),
      _StatInfo('Servisler', stats.services, Icons.build_outlined, const Color(0xFF2E8B57), const Color(0xFFE8F5EE)),
      _StatInfo('Roller', stats.roles, Icons.star_outline, const Color(0xFFD41920), const Color(0xFFFDEDEF)),
      _StatInfo('Yetkiler', stats.permissions, Icons.security_outlined, const Color(0xFFD4A017), const Color(0xFFFEF9E7)),
    ];

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final c = cards[i];
          return Container(
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Container(height: 3, color: c.accent),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 30, height: 30,
                              decoration: BoxDecoration(
                                color: c.iconBg,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(c.icon, size: 16, color: c.accent),
                            ),
                            const Spacer(),
                            Text(
                              '${c.value}',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: c.accent,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          c.title,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StatInfo {
  final String title;
  final int value;
  final IconData icon;
  final Color accent;
  final Color iconBg;
  const _StatInfo(this.title, this.value, this.icon, this.accent, this.iconBg);
}

// ─── Section Card ───

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget child;

  const _SectionCard({required this.title, this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 16, color: AppColors.textPrimary),
                  const SizedBox(width: 6),
                ],
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.border),
          Padding(
            padding: const EdgeInsets.all(12),
            child: child,
          ),
        ],
      ),
    );
  }
}

// ─── User Status Distribution ───

class _UserStatusDist extends StatelessWidget {
  final DashboardStats stats;
  const _UserStatusDist({required this.stats});

  @override
  Widget build(BuildContext context) {
    final dist = <String, int>{};
    for (final u in stats.allUsers) {
      dist[u.status] = (dist[u.status] ?? 0) + 1;
    }
    if (dist.isEmpty) {
      return const Text('Veri yok', style: TextStyle(color: AppColors.textSecondary));
    }

    const labelMap = {'ACTIVE': 'Aktif', 'INACTIVE': 'Pasif', 'BLOCKED': 'Bloklu'};
    const colorMap = {'ACTIVE': AppColors.success, 'INACTIVE': AppColors.primary, 'BLOCKED': AppColors.warning};

    return Column(
      children: dist.entries.map((e) {
        final pct = stats.users > 0 ? e.value / stats.users : 0.0;
        final color = colorMap[e.key] ?? AppColors.textSecondary;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      labelMap[e.key] ?? e.key,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color),
                    ),
                  ),
                  Text(
                    '${e.value}',
                    style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: pct,
                  minHeight: 6,
                  backgroundColor: AppColors.border,
                  valueColor: AlwaysStoppedAnimation(color),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ─── Bar Distribution ───

class _BarDist extends StatelessWidget {
  final List<MapEntry<String, int>> entries;
  final Color color;
  final Color gradientEnd;

  const _BarDist({required this.entries, required this.color, required this.gradientEnd});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const Text('Veri yok', style: TextStyle(color: AppColors.textSecondary));
    }
    final max = entries.first.value;
    return Column(
      children: entries.map((e) {
        final pct = max > 0 ? e.value / max : 0.0;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(e.key, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary), overflow: TextOverflow.ellipsis),
                  ),
                  Text('${e.value}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color)),
                ],
              ),
              const SizedBox(height: 4),
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: pct,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [color, gradientEnd]),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ─── Recent Item Tile ───

class _RecentItemTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;
  final String date;

  const _RecentItemTile({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    const statusColors = {
      'ACTIVE': AppColors.success,
      'INACTIVE': AppColors.primary,
      'BLOCKED': AppColors.warning,
    };
    final statusColor = statusColors[status] ?? AppColors.textSecondary;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  status,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: statusColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  subtitle,
                  style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

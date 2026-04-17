import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/features/auth/presentation/auth_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(authProvider.select((s) => s.valueOrNull?.username));

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hos geldiniz, ${username ?? ''}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'MAY yonetim paneline genel bakis',
            style: TextStyle(fontSize: 15, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 24),
          _buildStatsGrid(),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    const cards = [
      _StatCard(
        title: 'Kullanıcılar',
        description: 'Sistem kullanıcı sayısı',
        icon: Icons.person_outline,
        accentColor: Color(0xFF6A8AC4),
        iconBackground: Color(0xFFE8F0FD),
      ),
      _StatCard(
        title: 'Roller',
        description: 'Tanımlı rol sayısı',
        icon: Icons.star_outline,
        accentColor: Color(0xFF9C6AC4),
        iconBackground: Color(0xFFF5EAFE),
      ),
      _StatCard(
        title: 'Yetkiler',
        description: 'Tanımlı yetki sayısı',
        icon: Icons.security_outlined,
        accentColor: Color(0xFFC4789A),
        iconBackground: Color(0xFFFDE8F0),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: cards.length,
      itemBuilder: (_, i) => cards[i],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;
  final Color iconBackground;

  const _StatCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
    required this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4,
            color: accentColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: iconBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: accentColor, size: 22),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

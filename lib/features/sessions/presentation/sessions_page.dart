import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/features/sessions/domain/user_session.dart';
import 'package:may_mobile/features/sessions/presentation/sessions_provider.dart';

class SessionsPage extends ConsumerWidget {
  const SessionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsState = ref.watch(sessionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktif Oturumlar'),
      ),
      body: sessionsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hata: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(sessionsProvider.notifier).load(),
                child: const Text('Tekrar Dene'),
              ),
            ],
          ),
        ),
        data: (sessions) => sessions.isEmpty
            ? const Center(child: Text('Aktif oturum bulunamadı'))
            : RefreshIndicator(
                onRefresh: () => ref.read(sessionsProvider.notifier).load(),
                child: ListView.builder(
                  itemCount: sessions.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final session = sessions[index];
                    return _SessionCard(session: session);
                  },
                ),
              ),
      ),
    );
  }
}

class _SessionCard extends ConsumerWidget {
  final UserSession session;

  const _SessionCard({required this.session});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWeb = session.platform == 'WEB';
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          isWeb ? Icons.computer : Icons.phone_android,
          color: isWeb ? Colors.blue : Colors.green,
          size: 32,
        ),
        title: Row(
          children: [
            Text(session.platform, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (session.currentSession) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Bu oturum',
                  style: TextStyle(fontSize: 11, color: theme.colorScheme.primary),
                ),
              ),
            ],
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('IP: ${session.ipAddress}', style: const TextStyle(fontSize: 12)),
            if (session.deviceInfo != null)
              Text(
                session.deviceInfo!,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
        trailing: session.currentSession
            ? null
            : IconButton(
                icon: const Icon(Icons.logout, color: Colors.red),
                onPressed: () => _confirmTerminate(context, ref),
              ),
        isThreeLine: true,
      ),
    );
  }

  void _confirmTerminate(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Oturumu Sonlandır'),
        content: const Text('Bu oturumu sonlandırmak istediğinize emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Vazgeç'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(sessionsProvider.notifier).terminateSession(session.id);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Sonlandır'),
          ),
        ],
      ),
    );
  }
}

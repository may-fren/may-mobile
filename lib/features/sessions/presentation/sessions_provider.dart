import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/features/sessions/data/session_repository.dart';
import 'package:may_mobile/features/sessions/domain/user_session.dart';

final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  return SessionRepository(
    dio: ref.watch(dioProvider),
    storage: ref.watch(secureStorageProvider),
  );
});

final sessionsProvider =
    StateNotifierProvider<SessionsNotifier, AsyncValue<List<UserSession>>>((ref) {
  return SessionsNotifier(ref.watch(sessionRepositoryProvider));
});

class SessionsNotifier extends StateNotifier<AsyncValue<List<UserSession>>> {
  final SessionRepository _repository;

  SessionsNotifier(this._repository) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    try {
      final sessions = await _repository.getMySessions();
      state = AsyncValue.data(sessions);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> terminateSession(int sessionId) async {
    try {
      await _repository.terminateSession(sessionId);
      await load();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

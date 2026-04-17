import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/core/network/session_limit_exception.dart';
import 'package:may_mobile/features/auth/data/auth_repository.dart';
import 'package:may_mobile/features/auth/domain/auth_user.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    dio: ref.watch(dioProvider),
    storage: ref.watch(secureStorageProvider),
  );
});

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<AuthUser?>>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AsyncValue<AuthUser?>> {
  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final user = await _repository.getCurrentUser();
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> login(String username, String password, {bool forceLogin = false}) async {
    try {
      final user = await _repository.login(username, password, forceLogin: forceLogin);
      state = AsyncValue.data(user);
    } on SessionLimitException {
      rethrow;
    } catch (e, st) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    state = const AsyncValue.data(null);
  }

  bool hasPermission(String permission) {
    return state.valueOrNull?.permissions.contains(permission) ?? false;
  }

  bool hasAnyPermission(List<String> permissions) {
    final userPermissions = state.valueOrNull?.permissions ?? [];
    return permissions.any((p) => userPermissions.contains(p));
  }
}

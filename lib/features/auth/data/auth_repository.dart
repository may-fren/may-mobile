import 'package:dio/dio.dart';
import 'package:may_mobile/core/constants/api_constants.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/core/network/session_limit_exception.dart';
import 'package:may_mobile/core/storage/secure_storage_service.dart';
import 'package:may_mobile/core/utils/jwt_utils.dart';
import 'package:may_mobile/features/auth/domain/auth_user.dart';

class AuthRepository {
  final Dio _dio;
  final SecureStorageService _storage;

  AuthRepository({required Dio dio, required SecureStorageService storage})
      : _dio = dio,
        _storage = storage;

  Future<AuthUser> login(String username, String password, {bool forceLogin = false}) async {
    try {
      final response = await _dio.post(
        ApiConstants.login,
        data: {
          'username': username,
          'password': password,
          if (forceLogin) 'forceLogin': true,
        },
        options: Options(headers: {'X-Platform': 'MOBILE'}),
      );
      final accessToken = response.data['accessToken'] as String;
      await _storage.setToken(accessToken);

      final refreshToken = response.data['refreshToken'] as String?;
      if (refreshToken != null) {
        await _storage.setRefreshToken(refreshToken);
      }

      return JwtUtils.parseUser(accessToken);
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        final data = e.response?.data;
        if (data is Map && data['code'] == 1007) {
          final sessions = (data['activeSessions'] as List?)
                  ?.map((s) => ActiveSessionInfo.fromJson(s as Map<String, dynamic>))
                  .toList() ??
              [];
          throw SessionLimitException(
            message: data['detail'] ?? 'Oturum limiti asildi',
            statusCode: 409,
            activeSessions: sessions,
          );
        }
      }
      throw DioClient.handleError(e);
    }
  }

  Future<void> logout() async {
    try {
      final refreshToken = await _storage.getRefreshToken();
      await _dio.post(
        ApiConstants.logout,
        data: refreshToken != null ? {'refreshToken': refreshToken} : null,
      );
    } catch (_) {
      // Sessizce devam et
    } finally {
      await _storage.clearAll();
    }
  }

  Future<AuthUser?> getCurrentUser() async {
    final token = await _storage.getToken();
    if (token == null) return null;
    try {
      if (JwtUtils.isExpired(token)) return null;
      return JwtUtils.parseUser(token);
    } catch (_) {
      return null;
    }
  }
}

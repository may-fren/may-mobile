import 'package:dio/dio.dart';
import 'package:may_mobile/core/constants/api_constants.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/core/storage/secure_storage_service.dart';
import 'package:may_mobile/features/sessions/domain/user_session.dart';

class SessionRepository {
  final Dio _dio;
  final SecureStorageService _storage;

  SessionRepository({required Dio dio, required SecureStorageService storage})
      : _dio = dio,
        _storage = storage;

  Future<List<UserSession>> getMySessions() async {
    try {
      final refreshToken = await _storage.getRefreshToken();
      final response = await _dio.get(
        ApiConstants.mySessions,
        data: refreshToken != null ? {'refreshToken': refreshToken} : null,
      );
      final list = response.data as List;
      return list.map((e) => UserSession.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<void> terminateSession(int sessionId) async {
    try {
      await _dio.delete('${ApiConstants.sessions}/$sessionId');
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }
}

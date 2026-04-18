import 'package:dio/dio.dart';
import 'package:may_mobile/core/constants/api_constants.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/features/sessions/domain/user_session.dart';

class SessionRepository {
  final Dio _dio;

  SessionRepository({required Dio dio}) : _dio = dio;

  Future<List<UserSession>> getMySessions() async {
    try {
      final response = await _dio.get(
        ApiConstants.mySessions,
        queryParameters: {'page': 0, 'size': 1000},
      );
      final content = response.data['content'] as List;
      return content.map((e) => UserSession.fromJson(e as Map<String, dynamic>)).toList();
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

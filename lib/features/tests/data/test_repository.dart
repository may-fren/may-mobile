import 'package:dio/dio.dart';
import 'package:may_mobile/core/constants/api_constants.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/features/tests/domain/test_model.dart';
import 'package:may_mobile/shared/models/page_response.dart';

class TestRepository {
  final Dio _dio;

  TestRepository({required Dio dio}) : _dio = dio;

  Future<PageResponse<TestItem>> getTests({
    int page = 0,
    int size = 10,
    String? sort,
    String? name,
    String? status,
  }) async {
    try {
      final params = <String, dynamic>{'page': page, 'size': size};
      if (sort != null) params['sort'] = sort;
      if (name != null && name.isNotEmpty) params['name'] = name;
      if (status != null && status.isNotEmpty) params['status'] = status;

      final response =
          await _dio.get(ApiConstants.tests, queryParameters: params);
      return PageResponse.fromJson(response.data, TestItem.fromJson);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<TestItem> createTest(CreateTestRequest request) async {
    try {
      final response =
          await _dio.post(ApiConstants.tests, data: request.toJson());
      return TestItem.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<TestItem> updateTest(int id, UpdateTestRequest request) async {
    try {
      final response = await _dio.put('${ApiConstants.tests}/$id',
          data: request.toJson());
      return TestItem.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<void> deleteTest(int id) async {
    try {
      await _dio.delete('${ApiConstants.tests}/$id');
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }
}

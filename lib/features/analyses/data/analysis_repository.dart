import 'package:dio/dio.dart';
import 'package:may_mobile/core/constants/api_constants.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/features/analyses/domain/analysis_model.dart';
import 'package:may_mobile/shared/models/page_response.dart';

class AnalysisRepository {
  final Dio _dio;

  AnalysisRepository({required Dio dio}) : _dio = dio;

  Future<PageResponse<Analysis>> getAnalyses({
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
          await _dio.get(ApiConstants.analyses, queryParameters: params);
      return PageResponse.fromJson(response.data, Analysis.fromJson);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Analysis> createAnalysis(CreateAnalysisRequest request) async {
    try {
      final response =
          await _dio.post(ApiConstants.analyses, data: request.toJson());
      return Analysis.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Analysis> updateAnalysis(int id, UpdateAnalysisRequest request) async {
    try {
      final response = await _dio.put('${ApiConstants.analyses}/$id',
          data: request.toJson());
      return Analysis.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<void> deleteAnalysis(int id) async {
    try {
      await _dio.delete('${ApiConstants.analyses}/$id');
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }
}

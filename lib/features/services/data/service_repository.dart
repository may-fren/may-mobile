import 'package:dio/dio.dart';
import 'package:may_mobile/core/constants/api_constants.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/features/services/domain/service_model.dart';
import 'package:may_mobile/shared/models/page_response.dart';

class ServiceRepository {
  final Dio _dio;

  ServiceRepository({required Dio dio}) : _dio = dio;

  Future<PageResponse<ServiceItem>> getServices({
    int page = 0,
    int size = 10,
    String? sort,
    String? name,
    String? city,
    String? status,
  }) async {
    try {
      final params = <String, dynamic>{'page': page, 'size': size};
      if (sort != null) params['sort'] = sort;
      if (name != null && name.isNotEmpty) params['name'] = name;
      if (city != null && city.isNotEmpty) params['city'] = city;
      if (status != null && status.isNotEmpty) params['status'] = status;

      final response =
          await _dio.get(ApiConstants.services, queryParameters: params);
      return PageResponse.fromJson(response.data, ServiceItem.fromJson);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<ServiceItem> createService(CreateServiceRequest request) async {
    try {
      final response =
          await _dio.post(ApiConstants.services, data: request.toJson());
      return ServiceItem.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<ServiceItem> updateService(int id, UpdateServiceRequest request) async {
    try {
      final response = await _dio.put('${ApiConstants.services}/$id',
          data: request.toJson());
      return ServiceItem.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<void> deleteService(int id) async {
    try {
      await _dio.delete('${ApiConstants.services}/$id');
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }
}

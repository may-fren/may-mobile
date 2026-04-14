import 'package:dio/dio.dart';
import 'package:may_mobile/core/constants/api_constants.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/features/modules/domain/module_model.dart';
import 'package:may_mobile/shared/models/page_response.dart';

class ModuleRepository {
  final Dio _dio;

  ModuleRepository({required Dio dio}) : _dio = dio;

  Future<PageResponse<Module>> getModules({
    int page = 0,
    int size = 10,
    String? sort,
    String? name,
    String? brand,
    String? status,
  }) async {
    try {
      final params = <String, dynamic>{'page': page, 'size': size};
      if (sort != null) params['sort'] = sort;
      if (name != null && name.isNotEmpty) params['name'] = name;
      if (brand != null && brand.isNotEmpty) params['brand'] = brand;
      if (status != null && status.isNotEmpty) params['status'] = status;

      final response =
          await _dio.get(ApiConstants.modules, queryParameters: params);
      return PageResponse.fromJson(response.data, Module.fromJson);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Module> createModule(CreateModuleRequest request) async {
    try {
      final response =
          await _dio.post(ApiConstants.modules, data: request.toJson());
      return Module.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Module> updateModule(int id, UpdateModuleRequest request) async {
    try {
      final response = await _dio.put('${ApiConstants.modules}/$id',
          data: request.toJson());
      return Module.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<void> deleteModule(int id) async {
    try {
      await _dio.delete('${ApiConstants.modules}/$id');
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }
}

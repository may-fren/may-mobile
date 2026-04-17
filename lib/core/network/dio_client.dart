import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/api_constants.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/core/storage/secure_storage_service.dart';

final dioProvider = Provider<Dio>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return DioClient.create(storage);
});

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});

class DioClient {
  DioClient._();

  static Dio create(SecureStorageService storage) {
    final dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ));

    final cookieJar = CookieJar();
    if (!kIsWeb) {
      dio.interceptors.add(CookieManager(cookieJar));
    }

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await storage.getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401 &&
            !error.requestOptions.extra.containsKey('_retry')) {
          error.requestOptions.extra['_retry'] = true;
          try {
            final refreshDio = Dio(BaseOptions(
              baseUrl: ApiConstants.baseUrl,
              contentType: 'application/json',
            ));
            if (!kIsWeb) refreshDio.interceptors.add(CookieManager(cookieJar));

            final refreshToken = await storage.getRefreshToken();
            final response = await refreshDio.post(
              ApiConstants.refresh,
              data: refreshToken != null ? {'refreshToken': refreshToken} : null,
              options: Options(headers: {'X-Platform': 'MOBILE'}),
            );

            final newToken = response.data['accessToken'] as String;
            await storage.setToken(newToken);

            final newRefreshToken = response.data['refreshToken'] as String?;
            if (newRefreshToken != null) {
              await storage.setRefreshToken(newRefreshToken);
            }

            error.requestOptions.headers['Authorization'] = 'Bearer $newToken';
            final retryResponse = await dio.fetch(error.requestOptions);
            return handler.resolve(retryResponse);
          } catch (_) {
            await storage.clearAll();
            return handler.reject(error);
          }
        }
        handler.next(error);
      },
    ));

    return dio;
  }

  static ApiException handleError(DioException e) {
    final data = e.response?.data;
    final message = data is Map ? (data['detail'] ?? data['message']) : null;
    return ApiException(
      message: message ?? 'Bir hata oluştu',
      statusCode: e.response?.statusCode,
    );
  }
}

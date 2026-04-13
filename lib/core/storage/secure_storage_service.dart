import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _tokenKey = 'access_token';
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    webOptions: WebOptions.defaultOptions,
  );

  Future<String?> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  Future<void> setToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }
}

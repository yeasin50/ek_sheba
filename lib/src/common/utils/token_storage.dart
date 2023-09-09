import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static const _storage = FlutterSecureStorage();

  static String? _token;

  static Future<void> setUp() async {
    _token = await _storage.read(key: "access_token");
  }

  static Future<String?> getToken() async {
    return _token;
  }

  static Future<void> deleteSecureToken() async {
    try {
      _token = null;
      await _storage.delete(key: "access_token");
    } catch (e) {}
  }

  static Future<void> setToken(String token, {required bool save}) async {
    _token = token;
    if (save) {
      await deleteSecureToken();
      await _storage.write(key: "access_token", value: token);
    }
  }
}

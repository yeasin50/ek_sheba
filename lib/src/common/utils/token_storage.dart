import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static const _storage = FlutterSecureStorage();
 
  static Future<String?> getToken() async {
    return await _storage.read(key: "access_token");
  }

  static Future<void> deleteSecureToken() async {
    try {
      await _storage.delete(key: "access_token");
    } catch (e) {}
  }

  static Future<void> setToken(String token) async {
    await deleteSecureToken();
    await _storage.write(key: "access_token", value: token);
  }
}

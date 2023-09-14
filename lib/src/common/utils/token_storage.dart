import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static const _storage = FlutterSecureStorage();

  static String? _token;

  static Future<void> setUp() async {
    _token = await _storage.read(key: "access_token");
  }

  static Future<String?> getToken() async {
    if (_token == null) {
      await setUp();
    }
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

  static Future<void> setSession({
    required String sessionId,
    required String doptorToken,
  }) async {
    try {
      await _storage.delete(key: "session_id");
      await _storage.delete(key: "doptor_token");
    } catch (e) {}
    await _storage.write(key: "session_id", value: sessionId);
    await _storage.write(key: "doptor_token", value: doptorToken);
  }

  static Future<(String sessionID, String doptorToken)> getSession() async {
    final se = await _storage.read(key: "session_id");
    final doptorToken = await _storage.read(key: "doptor_token");
    if (se == null) {
      logger.e("Session id is null");
      return ("b886f8dc-5282-4a67-816c-bf95272d3265", "");
    }

    return (se, doptorToken ?? "");
  }
}

import 'package:ek_sheba/src/common/utils/token_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_utils/my_utils.dart';

import '../domain/entities/session_param.dart';
import '../domain/entities/session_response.dart';

abstract class IPDfHandler {
  Future<SessionResponse?> createSession(SeasonParams params);

  Future<String?> getPDFUrl(SessionResponse sessionResponse, String pdfId);

  Future<String?> getPDFUrl2(String pdfId);
}

class PDfHandler implements IPDfHandler {
  @override
  Future<SessionResponse?> createSession(SeasonParams params) async {
    try {
      final uri = Uri.parse('https://gwtraining.plandiv.gov.bd/api/create-session');

      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: params.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return SessionResponse.fromJson(response.body);
      } else {
        logger.e('createSession: ${response.statusCode}');
        // throw Exception('createSession: ${response.statusCode}');
      }
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<String?> getPDFUrl(SessionResponse sessionResponse, String pdfId) async {
    try {
      return "https://ppstraining.plandiv.gov.bd/dpp-tapp/public-dashboard?id=$pdfId&p=${sessionResponse.sessionId}}";
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<String?> getPDFUrl2(String pdfId) async {
    try {
      final sessionId = await TokenManager.getSession();

      return "https://ppstraining.plandiv.gov.bd/dpp-tapp/public-dashboard?id=$pdfId&p=${sessionId.$1}";
    } catch (e) {
      logger.e(e);
    }
  }
}

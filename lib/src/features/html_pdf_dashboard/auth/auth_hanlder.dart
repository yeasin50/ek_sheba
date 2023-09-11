import 'package:http/http.dart' as http;
import 'package:my_utils/my_utils.dart';

import '../domain/entities/session_param.dart';
import '../domain/entities/session_response.dart';

abstract class IPDfHandler {
  Future<SessionResponse?> createSession(SeasonParams params);

  Future<String?> getPDFUrl(SessionResponse sessionResponse, String pdfId);
}

class PDfHandler implements IPDfHandler {
  @override
  Future<SessionResponse?> createSession(SeasonParams params) async {
    try {
      final uri = Uri.parse('https://gwtraining.plandiv.gov.bd/api/create-session');

      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: params.toJson(),
      );

      if (response.statusCode == 200) {
        return SessionResponse.fromJson(response.body);
      } else {
        logger.e('createSession: ${response.statusCode}');
        throw Exception('createSession: ${response.statusCode}');
      }
    } catch (e) {
      logger.e(e);
       
    }
  }

  @override
  Future<String?> getPDFUrl(SessionResponse sessionResponse, String pdfId) async {
    try {
      const sessionId = '3ced8919-18e1-4a5e-adfd-8e99da94c781';
      return "https://ppstraining.plandiv.gov.bd/dpp-tapp/public-dashboard?id=$pdfId&p=$sessionId";
    } catch (e) {
      logger.e(e);
       
    }
  }
}

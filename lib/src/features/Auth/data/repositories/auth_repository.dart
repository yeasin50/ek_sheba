import 'dart:convert';

import '../../../../common/utils/random_uuid.dart';
import '../../../html_pdf_dashboard/auth/auth_hanlder.dart';
import '../../../html_pdf_dashboard/domain/entities/session_param.dart';
import '../../../../locator.dart';

import '../../../../common/utils/api_config.dart';
import '../../../../common/utils/logger.dart';
import '../../../../common/utils/token_storage.dart';
import '../../domain/entities/system_user.dart';

import '../../domain/entities/ek_sheba_user.dart';
import 'package:fpdart/fpdart.dart';

import 'package:http/http.dart' as http;

import '../../domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, EkShebaUser>> ekShebaLogin({
    required String email,
    required String password,
  }) async {
    try {
      final body = {
        "userId": email,
        "password": password,
      };
      final response = await http.post(
        Uri.parse(APIInfo.ekShebaLogin),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      EkShebaUser ekShebaUser = EkShebaUser.fromJson(response.body);
      final employeeID = ekShebaUser.user.employeeRecordId;
      if (response.statusCode == 200) {
        final data = {
          "userId": employeeID,
          "userType": "NOTHI",
          'password': password,
        };

        final isUser = await _checkEkShebaUser(data);

        if (!isUser) {
          logger.e("User is not registered");
          return left(AuthFailure());
        } else {
          final verifyData = {
            "userId": employeeID,
            'password': password,
            'token': ekShebaUser.token,
          };
          final f = await _ekShebaVerify(verifyData);
          if (f == null) {
            logger.e("_ekShebaVerify User not found");
            return left(AuthFailure());
          }
          //! pdf handler
          try {
            String doptorToken = ekShebaUser.token;
            final sessionId = generateRandomUUID();
            final String pdfToken = f['access_token'];

            final param = SeasonParams(
              sessionId: sessionId,
              accessToken: pdfToken,
              doptorToken: doptorToken,
            );

            final result = await locator.get<PDfHandler>().createSession(param);

            if (result != null) {
              ///save session id
              await TokenManager.setSession(sessionId: sessionId, doptorToken: doptorToken);
            } else {
              logger.e("Session not created");
            }
          } catch (e) {
            logger.e(e);
          }
          logger.d("_ekShebaVerify f ${f.toString()}");

          EkShebaUser result = ekShebaUser.copyWith(
            token: f['access_token'],
            refreshToken: f['refresh_token'],
          );
          return right(result);
        }
      } else {
        logger.e(response.body);
        return left(AuthFailure());
      }
    } catch (e) {
      logger.e(e);
      return left(AuthFailure());
    }
  }

  Future<bool> _checkEkShebaUser(Map<String, dynamic> body) async {
    try {
      final url = Uri.parse("${APIInfo.baseUrl}api/users/userByUserIdAndUserType");

      final result = await http.post(
        url,
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final msg = jsonDecode(result.body)?["message"];
      logger.d("$msg  ${result.body.toString()}");
      return msg == "User Found";
    } catch (e) {
      logger.e(e);
      logger.e("User not found ${e.toString()}}");
      return false;
    }
  }

  Future<Map?> _ekShebaVerify(Map<String, dynamic> data) async {
    try {
      // https://gwtraining.plandiv.gov.bd/sso/sso-user-verify
      final url = Uri.parse("${APIInfo.baseUrl}sso/sso-user-verify");
      final response = await http.post(
        url,
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": data['token'],
        },
      );

      logger.d("_ekShebaVerify ${response.body}");
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      logger.e("_ekShebaVerify ${e.toString()}");
      return null;
    }
  }

  @override
  Future<Either<Failure, SystemUser>> systemLogin({
    required String email,
    required String password,
  }) async {
    try {
      final body = {
        "grant_type": "password",
        "username": email,
        "password": password,
      };

      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic aWJjc3BsYW5uaW5naWRzZHA6cGxhbm5pbmdJZHNkcHNoYSRAIzkyOSU=',
      };
      final response = await http.post(
        Uri.parse(APIInfo.systemLogin),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        final user = SystemUser.fromJson(response.body);
        final sessionId = generateRandomUUID();
        final param = SeasonParams(
          sessionId: sessionId,
          accessToken: user.accessToken,
          doptorToken: '',
        );

        final result = await locator.get<PDfHandler>().createSession(param);

        if (result != null) {
          ///save session id
          await TokenManager.setSession(sessionId: sessionId, doptorToken: '');
        } else {
          logger.e("Session not created");
        }
        return right(user);
      } else {
        logger.e(response.body);
        return left(AuthFailure());
      }
    } catch (e) {
      logger.e(e);
      return left(AuthFailure());
    }
  }
}

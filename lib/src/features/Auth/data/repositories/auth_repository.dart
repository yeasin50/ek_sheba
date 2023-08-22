import 'dart:convert';

import '../../../../common/utils/api_config.dart';
import '../../../../common/utils/logger.dart';
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
        "username": email,
        "password": password,
        "grant_type": "password",
      };

      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Transfer-Encoding': 'chunked',
        'Authorization': 'Basic aWJjc3BsYW5uaW5naWRzZHA6cGxhbm5pbmdJZHNkcHNoYSRAIzkyOSU=',
      };
      final response = await http.post(
        Uri.parse(APIInfo.systemLogin),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        return right(SystemUser.fromJson(response.body));
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

import 'dart:convert';

import '../../../../common/utils/api_config.dart';
import '../../../../common/utils/logger.dart';
import '../../domain/entities/system_user.dart';

import '../../domain/entities/ek_sheba_user.dart';
import 'package:fpdart/fpdart.dart';

import 'package:http/http.dart' as http;

import '../../../../common/utils/failures.dart';
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
          'Content-Type': 'text/plain',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return right(EkShebaUser.fromJson(response.body));
      } else {
        logger.e(response.body);
        return left(AuthFailure());
      }
    } catch (e) {
      logger.e(e);
      return left(AuthFailure());
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

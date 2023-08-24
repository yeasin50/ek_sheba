import 'dart:convert';

import 'package:ek_sheba/src/common/utils/api_config.dart';
import 'package:ek_sheba/src/common/utils/logger.dart';

import 'package:fpdart/src/either.dart';

import 'package:fpdart/src/unit.dart';

import '../../domain/repositories/helpline_repository.dart';

import 'package:http/http.dart' as http;

class HelplineRepositoryImpl implements IHelplineRepository {
  @override
  Future<Either<Failure, Unit>> sendMessage(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse("${APIInfo.baseUrl}api/help/create"),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return right(unit);
      } else {
        logger.e(response.body);
        return left(ServerFailure());
      }
    } catch (e) {
      logger.e(e);
      return left(ServerFailure());
    }
  }
}

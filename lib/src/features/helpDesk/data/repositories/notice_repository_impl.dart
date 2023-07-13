import 'dart:convert';

import 'package:ek_sheba/src/common/utils/failures.dart';
import 'package:ek_sheba/src/common/utils/logger.dart';

import 'package:ek_sheba/src/features/helpDesk/domain/entities/notice_info.dart';

import 'package:fpdart/src/either.dart';

import '../../../../common/utils/api_config.dart';
import '../../domain/repositories/notice_plan_repository.dart';

import 'package:http/http.dart' as http;

class NoticeRepositoryImpl implements INoticePlanRepository {
  @override
  Future<Either<Failure, List<NoticeInfo>>> search({
    DateTime? fromDate,
    DateTime? toDate,
    String? query,
  }) async {
    logger.i("NoticeRepositoryImpl  search $fromDate $toDate $query");
    try {
      _body() {
        final Map<String, dynamic> body = {};
        if (fromDate != null) {
          body['fromDate'] = fromDate.toIso8601String();
        }
        if (toDate != null) {
          body['toDate'] = toDate.toIso8601String();
        }
        if (query != null) {
          body['title'] = query;
        }
        logger.i(body);
        return jsonEncode(body);
      }

      final response = await http.post(
        Uri.parse("${APIInfo.baseUrl}api/notice/search-by-notice"),
        body: _body(),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) ?? [];
        final List<NoticeInfo> noticeList = List.from(data.map((e) => NoticeInfo.fromMap(e)));
        return right(noticeList);
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

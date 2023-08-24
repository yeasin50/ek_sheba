import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

import '../entities/notice_info.dart';

abstract interface class INoticePlanRepository {
  Future<Either<Failure, List<NoticeInfo>>> search({
    DateTime? fromDate,
    DateTime? toDate,
    String? query,
  });
}

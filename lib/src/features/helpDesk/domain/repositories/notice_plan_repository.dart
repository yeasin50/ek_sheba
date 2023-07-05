import 'package:fpdart/fpdart.dart';

import '../../../../common/utils/failures.dart';
import '../entities/notice_info.dart';

abstract interface class INoticePlanRepository {
  Future<Either<Failure, List<NoticeInfo>>> search({
    DateTime? fromDate,
    DateTime? toDate,
    String? query,
  });
}

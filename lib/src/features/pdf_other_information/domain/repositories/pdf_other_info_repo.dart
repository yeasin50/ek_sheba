import 'package:fpdart/fpdart.dart';

import '../../../../common/utils/logger.dart';
import '../entities/entities.dart';

abstract interface class PdfOtherInfoRepo {
  /// Get pdf other information attachment
  /// Other Information : অন্যান্য তথ্য
  ///
  Future<Either<Failure, PaginatedProjectAttachments>> otherInfo({
    required String id,
    required String projectType,
    int page = 0,
    int size = 1000,
  });

  /// Get pdf other information attachment
  /// Related Meeting Attachments : সংশ্লিষ্ট মিটিং এর সংযুক্তি সমূহ
  ///
  Future<Either<Failure, PaginatedProjectAttachments>> getPdfRelatedMeetingAttachments({
    required String projectMovementStageId,
    int page = 0,
    int size = 1000,
  });
}

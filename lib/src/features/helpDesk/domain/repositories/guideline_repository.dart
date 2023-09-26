import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

import '../entities/guideline_info.dart';

abstract interface class IGuidelineRepository {
  Future<Either<Failure, List<GuideLineInfo>>> getGuidelines();
  Future<Either<Failure, List<GuideLineInfo>>> getGuidelinesByModule(
      {String? imsModuleId});
}

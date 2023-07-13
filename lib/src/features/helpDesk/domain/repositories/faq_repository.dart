import 'package:fpdart/fpdart.dart';

import '../../../../common/utils/failures.dart';
import '../entities/faq_info.dart';

abstract interface class IFaqRepository {
  Future<Either<Failure, List<FAQModule>>> getFaq();
  Future<Either<Failure, List<FAQModule>>> searchFaq(
    String query, {
    String? imsModuleId,
  });
}

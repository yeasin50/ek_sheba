import 'package:fpdart/fpdart.dart';

import '../../../../common/utils/failures.dart';

abstract interface class IHelplineRepository {
  Future<Either<Failure, Unit>> sendMessage(Map<String, dynamic> data);
} 

import 'package:ek_sheba/src/common/utils/failures.dart';
import 'package:fpdart/fpdart.dart';

/// return int from [key] or [NullFailure] for dashboard project count
Future<Either<Failure,int>> counterFromKey(String? key) async {
  final count = int.tryParse('$key');
  if (count != null) {
    return Future.value(Right(count));
  }
  return Future.value(Left(NullFailure()));
}
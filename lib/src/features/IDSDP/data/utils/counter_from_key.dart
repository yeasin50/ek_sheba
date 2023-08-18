
import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

/// return int from [key] or [NullFailure] for dashboard project count
Future<Either<Failure,int>> counterFromKey(String? key) async {
  final count = int.tryParse('$key');
  if (count != null) {
    return Future.value(Right(count));
  }
  return Future.value(Left(NullFailure()));
}
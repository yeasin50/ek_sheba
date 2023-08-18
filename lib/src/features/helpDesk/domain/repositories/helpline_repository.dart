import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';


abstract interface class IHelplineRepository {
  Future<Either<Failure, Unit>> sendMessage(Map<String, dynamic> data);
} 
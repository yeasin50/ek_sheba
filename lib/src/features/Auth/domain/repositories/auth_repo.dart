import 'package:ek_sheba/src/features/Auth/domain/entities/system_user.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../common/utils/failures.dart';
import '../entities/ek_sheba_user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, EkShebaUser>> ekShebaLogin({
    required String email,
    required String password,
  });
  Future<Either<Failure, SystemUser>> systemLogin({
    required String email,
    required String password,
  });
}

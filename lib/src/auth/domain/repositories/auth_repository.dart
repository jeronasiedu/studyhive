import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';

import '../../../profile/domain/entities/profile.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> continueWithGoogle(Profile profile);

  Future<Either<Failure, bool>> continueWithApple(Profile profile);

  Future<Either<Failure, bool>> continueWithPhone(Profile profile);
}

import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';

import '../../../profile/domain/entities/profile.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> continueWithGoogle(Profile profile);

  Future<Either<Failure, Profile>> continueWithApple(Profile profile);

  Future<Either<Failure, Profile>> continueWithPhone(Profile profile);
}

import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';

import '../../../profile/domain/entities/profile.dart';

abstract class AuthRepository {
  /// Authenticates the user using google
  Future<Either<Failure, bool>> continueWithGoogle(Profile profile);

  /// Authenticates the user using
  Future<Either<Failure, bool>> continueWithApple(Profile profile);

  Future<Either<Failure, bool>> continueWithPhone(Profile profile);

  Future<Either<Failure, void>> signOut();
}

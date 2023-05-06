import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/src/profile/domain/entities/profile.dart';

abstract class ProfileRepository {
  /// Returns the [Profile] of the current user if connected to the internet else returns the [Profile] from the local database
  Future<Either<Failure, Profile>> retrieve(String userId);

  /// Saves the [Profile] to the local and remote database
  Future<Either<Failure, void>> save(Profile profile);

  /// Deletes the [Profile] from the local and remote database
  Future<Either<Failure, void>> delete(String userId);
}

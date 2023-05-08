import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:studyhive/shared/network/network.dart';

import '../../../../shared/error/failure.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../local/data_sources/profile_local_database.dart';
import '../remote/data_sources/profile_remote_database.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDatabase localDatabase;
  final ProfileRemoteDatabase remoteDatabase;
  final NetworkInfo networkInfo;

  const ProfileRepositoryImpl({
    required this.localDatabase,
    required this.remoteDatabase,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Profile>> retrieve(String userId) async {
    try {
      if (!await networkInfo.hasInternet()) {
        final localProfile = await localDatabase.retrieve();
        if (localProfile != Profile.empty()) {
          return Right(localProfile);
        }
        return Left(Failure("no_internet".tr));
      }
      final remoteProfile = await remoteDatabase.retrieve(userId);
      await localDatabase.save(remoteProfile);
      return Right(remoteProfile);
    } on Exception {
      return const Left(Failure('Error retrieving profile'));
    }
  }

  @override
  Future<Either<Failure, void>> save(Profile profile) async {
    try {
      await localDatabase.save(profile);
      await remoteDatabase.save(profile);
      return const Right(null);
    } on Exception {
      return const Left(Failure('Error saving profile'));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String userId) async {
    try {
      if (!await networkInfo.hasInternet()) {
        return Left(Failure("no_internet".tr));
      }
      await localDatabase.delete();
      await remoteDatabase.delete(userId);
      return const Right(null);
    } on Exception {
      return const Left(Failure('Error deleting profile'));
    }
  }

  @override
  Future<Either<Failure, Profile>> update(Profile profile) async {
    try {
      if (!await networkInfo.hasInternet()) {
        return Left(Failure('no_internet'.tr));
      }
      await localDatabase.save(profile);
      final results = await remoteDatabase.update(profile);
      return Right(results);
    } on Exception {
      return const Left(Failure('Error updating profile'));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/shared/network/network.dart';
import 'package:studyhive/src/hive/data/local/data_sources/hive_local_database.dart';
import 'package:studyhive/src/hive/data/remote/data_sources/hive_remote_database.dart';
import 'package:studyhive/src/hive/domain/entities/hive.dart';
import 'package:studyhive/src/hive/domain/repositories/hive_repository.dart';

class HiveRepositoryImpl implements HiveRepository {
  final HiveRemoteDatabase remoteDatabase;
  final HiveLocalDatabase localDatabase;
  final NetworkInfo networkInfo;

  const HiveRepositoryImpl({
    required this.remoteDatabase,
    required this.localDatabase,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> create(Hive hive) async {
    try {
      final connected = await networkInfo.hasInternet();
      if (!connected) {
        return const Left(Failure("No internet connection"));
      }
      final result = await remoteDatabase.create(hive);
      return Right(result);
    } catch (e) {
      return const Left(Failure("Error creating hive"));
    }
  }

  @override
  Future<Either<Failure, String>> delete(String hiveId) async {
    try {
      final connected = await networkInfo.hasInternet();
      if (!connected) {
        return const Left(Failure("No internet connection"));
      }
      final result = await remoteDatabase.delete(hiveId);
      return Right(result);
    } catch (e) {
      return const Left(Failure("Error deleting hive"));
    }
  }

  @override
  Future<Either<Failure, String>> join({required String hiveId, required String userId}) async {
    try {
      final connected = await networkInfo.hasInternet();
      if (!connected) {
        return const Left(Failure("No internet connection"));
      }
      final result = await remoteDatabase.join(hiveId: hiveId, userId: userId);
      return Right(result);
    } catch (e) {
      return const Left(Failure("Error joining hive"));
    }
  }

  @override
  Future<Either<Failure, Stream<List<Hive>>>> list(String userId) async {
    try {
      final connected = await networkInfo.hasInternet();
      if (!connected) {
        return const Left(Failure("No internet connection"));
      }
      final result = remoteDatabase.list(userId);
      result.listen((hives) {
        localDatabase.save(hives);
      });
      return Right(result);
    } catch (e) {
      return const Left(Failure("Error listing hives"));
    }
  }

  @override
  Future<Either<Failure, String>> update(Hive hive) async {
    try {
      final connected = await networkInfo.hasInternet();
      if (!connected) {
        return const Left(Failure("No internet connection"));
      }
      final result = await remoteDatabase.update(hive);
      return Right(result);
    } catch (e) {
      return const Left(Failure("Error updating hive"));
    }
  }
}

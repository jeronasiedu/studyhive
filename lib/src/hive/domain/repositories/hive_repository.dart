import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/src/hive/domain/entities/hive.dart';
import 'package:studyhive/src/hive/domain/entities/message.dart';

abstract class HiveRepository {
  /// Returns a list of all the [Hive]s
  Future<Either<Failure, Stream<List<Hive>>>> list(String userId);

  /// Creates a new [Hive]
  Future<Either<Failure, String>> create(Hive hive);

  /// Updates an existing [Hive]
  Future<Either<Failure, String>> update(Hive hive);

  /// Deletes an existing [Hive]
  Future<Either<Failure, String>> delete(String hiveId);

  /// Joins an existing [Hive]
  Future<Either<Failure, String>> join({required String hiveId, required String userId});

  /// Leaves an existing [Hive]
  Future<Either<Failure, String>> leave({required String hiveId, required String userId});

  /// Returns details of a [Hive]
  Future<Either<Failure, Stream<Hive>>> details(String hiveId);

  /// Post a message to a [Hive]
  Future<Either<Failure, String>> postMessage({required String hiveId, required Message message});
}

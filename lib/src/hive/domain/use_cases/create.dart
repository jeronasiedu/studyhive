import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/shared/usecase/usecase.dart';
import 'package:studyhive/src/hive/domain/entities/hive.dart';
import 'package:studyhive/src/hive/domain/repositories/hive_repository.dart';

class CreateHive implements UseCase<String, Params<Hive>> {
  final HiveRepository repository;

  CreateHive(this.repository);

  @override
  Future<Either<Failure, String>> call(Params<Hive> params) {
    return repository.create(params.data);
  }
}

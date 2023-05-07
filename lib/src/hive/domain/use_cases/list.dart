import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/shared/usecase/usecase.dart';
import 'package:studyhive/src/hive/domain/entities/hive.dart';
import 'package:studyhive/src/hive/domain/repositories/hive_repository.dart';

class ListHives implements UseCase<Stream<List<Hive>>, Params<String>> {
  final HiveRepository repository;

  ListHives(this.repository);

  @override
  Future<Either<Failure, Stream<List<Hive>>>> call(Params<String> params) {
    return repository.list(params.data);
  }
}

import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/src/hive/domain/entities/hive.dart';

import '../../../../shared/usecase/usecase.dart';
import '../repositories/hive_repository.dart';

class HiveDetails implements UseCase<Stream<Hive>, Params<String>> {
  final HiveRepository repository;

  HiveDetails(this.repository);

  @override
  Future<Either<Failure, Stream<Hive>>> call(Params<String> params) {
    return repository.details(params.data);
  }
}

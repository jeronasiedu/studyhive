import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/shared/usecase/usecase.dart';
import 'package:studyhive/src/hive/domain/entities/hive.dart';

class CreateHive implements UseCase<String, Params<Hive>> {
  @override
  Future<Either<Failure, String>> call(Params<Hive> params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

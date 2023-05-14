import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/src/hive/domain/entities/message.dart';

import '../../../../shared/usecase/usecase.dart';
import '../repositories/hive_repository.dart';

class PostMessage implements UseCase<String, Params<PostMessageParams>> {
  final HiveRepository repository;

  PostMessage(this.repository);

  @override
  Future<Either<Failure, String>> call(Params<PostMessageParams> params) {
    return repository.postMessage(hiveId: params.data.hiveId, message: params.data.message);
  }
}

class PostMessageParams {
  final String hiveId;
  final Message message;

  PostMessageParams(this.hiveId, this.message);
}

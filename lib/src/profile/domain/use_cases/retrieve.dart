import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/src/profile/domain/entities/profile.dart';
import 'package:studyhive/src/profile/domain/repositories/profile_repository.dart';

import '../../../../shared/usecase/usecase.dart';

class RetrieveProfile implements UseCase<Profile, Params<String>> {
  final ProfileRepository repository;

  RetrieveProfile(this.repository);

  @override
  Future<Either<Failure, Profile>> call(Params<String> params) async {
    return await repository.retrieve(params.data);
  }
}

import 'package:dartz/dartz.dart';
import 'package:studyhive/shared/error/failure.dart';
import 'package:studyhive/shared/usecase/usecase.dart';

import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class UpdateProfile implements UseCase<Profile, Params<Profile>> {
  final ProfileRepository repository;

  UpdateProfile(this.repository);

  @override
  Future<Either<Failure, Profile>> call(Params params) {
    return repository.update(params.data);
  }
}

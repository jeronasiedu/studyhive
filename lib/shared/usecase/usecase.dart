import 'package:dartz/dartz.dart';

import '../error/failure.dart';

/// Blue print for all useCases in the app
/// Mainly for usecases uses [Either]
abstract class UseCase<Type, Params> {
  /// Contract call method
  Future<Either<Failure, Type>> call(Params params);
}

/// create a generic params for usecases
class Params<T> {
  const Params(this.data);

  final T data;
}

class NoParams {
  const NoParams();
}

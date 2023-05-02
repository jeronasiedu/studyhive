import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

/// Blue print for all useCases in the app
/// Mainly for usecases uses [Either]
abstract class UseCase<Type, Params> {
  /// Contract call method
  Future<Either<Failure, Type>> call(Params params);
}

/// Used when useCases doesn't take any parameters
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

/// Used for token/string value required useCases
class StringParams extends Equatable {
  /// Constructor
  const StringParams(this.value);

  /// Authorization token
  /// OR
  /// A single value parameter
  final String value;

  @override
  List<Object> get props => [value];
}

/// Used for list of strings value required usecase
class ListStringParams extends Equatable {
  /// Constructor
  const ListStringParams(this.values);

  /// Document ids for firestore
  /// OR
  /// List of String value parameter
  final List<String> values;

  @override
  List<Object> get props => [values];
}

// create a generic params for usecases
class Params<T> {
  const Params(this.value);
  final T value;
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/errors/failure/failure.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract interface class UseCaseWatchable<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class CacheParams extends Equatable {
  final bool isCache;

  const CacheParams({
    required this.isCache,
  });

  @override
  List<Object?> get props => [isCache];
}

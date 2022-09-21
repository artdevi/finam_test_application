import 'package:dartz/dartz.dart';
import 'package:finam_test_app/core/error/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}

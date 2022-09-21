import 'package:dartz/dartz.dart';
import 'package:finam_test_app/core/error/failure.dart';
import 'package:finam_test_app/feature/domain/entities/home_data_entity.dart';

abstract class HomeDataRepository {
  Future<Either<Failure, HomeDataEntity>> getHomeData();
}

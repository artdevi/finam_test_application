import 'package:finam_test_app/core/error/exception.dart';
import 'package:finam_test_app/core/platform/network_info.dart';
import 'package:finam_test_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:finam_test_app/feature/data/datasources/home_local_datasource.dart';
import 'package:finam_test_app/feature/data/datasources/home_remote_datasource.dart';
import 'package:finam_test_app/feature/domain/entities/home_data_entity.dart';
import 'package:finam_test_app/feature/domain/repositories/home_data_repository.dart';

class HomeDataRepositoryImpl extends HomeDataRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  final NetworkInfo networkInfo;

  HomeDataRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, HomeDataEntity>> getHomeData() async {
    if (await networkInfo.isConnected) {
      try {
        final data = await homeRemoteDataSource.getHomeData();
        homeLocalDataSource.homeDataToCache(data);
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final data = await homeLocalDataSource.getHomeDataFromCache();
        return Right(data);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}

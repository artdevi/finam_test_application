import 'package:dartz/dartz.dart';
import 'package:finam_test_app/core/error/failure.dart';
import 'package:finam_test_app/core/usecases/usecase.dart';
import 'package:finam_test_app/feature/domain/entities/home_data_entity.dart';
import 'package:finam_test_app/feature/domain/repositories/home_data_repository.dart';

class GetHomeData extends UseCase {
  final HomeDataRepository homeDataRepository;

  GetHomeData(this.homeDataRepository);

  @override
  Future<Either<Failure, HomeDataEntity>> call() async {
    return await homeDataRepository.getHomeData();
  }
}

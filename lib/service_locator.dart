import 'package:finam_test_app/core/platform/network_info.dart';
import 'package:finam_test_app/feature/data/datasources/home_local_datasource.dart';
import 'package:finam_test_app/feature/data/datasources/home_remote_datasource.dart';
import 'package:finam_test_app/feature/domain/repositories/home_data_repository.dart';
import 'package:finam_test_app/feature/domain/usecases/get_home_data.dart';
import 'package:finam_test_app/feature/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/data/repositories/home_data_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => HomeBloc(sl()));

  // UseCases
  sl.registerLazySingleton(() => GetHomeData(sl()));

  // Repository
  sl.registerLazySingleton<HomeDataRepository>(() => HomeDataRepositoryImpl(
        homeRemoteDataSource: sl(),
        homeLocalDataSource: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: http.Client()),
  );

  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

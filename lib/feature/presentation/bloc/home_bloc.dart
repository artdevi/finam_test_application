import 'package:finam_test_app/feature/domain/usecases/get_home_data.dart';
import 'package:finam_test_app/feature/presentation/bloc/home_event.dart';
import 'package:finam_test_app/feature/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData getData;

  HomeBloc(this.getData) : super(HomeDataEmpty()) {
    on<LoadHomeDataEvent>((event, emit) async {
      emit(HomeDataLoading());
      final failureOrData = await getData();
      failureOrData.fold((failure) => emit(HomeDataError(message: '')),
          (data) => emit(HomeDataLoaded(data: data)));
    });
  }
}

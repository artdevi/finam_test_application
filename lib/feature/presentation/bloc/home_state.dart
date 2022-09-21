import 'package:equatable/equatable.dart';
import 'package:finam_test_app/feature/domain/entities/home_data_entity.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeDataEmpty extends HomeState {}

class HomeDataLoading extends HomeState {}

class HomeDataLoaded extends HomeState {
  final HomeDataEntity data;

  HomeDataLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class HomeDataError extends HomeState {
  final String message;

  HomeDataError({required this.message});

  @override
  List<Object?> get props => [message];
}

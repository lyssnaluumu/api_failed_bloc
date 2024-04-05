part of 'api_bloc.dart';

abstract class ApiBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ApiInitialState extends ApiBlocState {}

class ApiLoadingState extends ApiBlocState {}

class ApiLoadedState extends ApiBlocState {
  final List<ResponseModel> data;

  ApiLoadedState({required this.data});

  @override
  List<Object?> get props => [data];
}

class ApiErrorState extends ApiBlocState {
  final String errorMessage;

  ApiErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

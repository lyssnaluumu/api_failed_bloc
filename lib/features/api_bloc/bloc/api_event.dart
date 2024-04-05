part of 'api_bloc.dart';

abstract class ApiBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthRequestEvent extends ApiBlocEvent {}

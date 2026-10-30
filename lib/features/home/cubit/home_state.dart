part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Map<String, dynamic>> cars;

  HomeSuccess(this.cars);
}

class HomeError extends HomeState {
  final String error;

  HomeError(this.error);
}
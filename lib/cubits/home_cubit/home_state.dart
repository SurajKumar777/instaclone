part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {
  final int count;

  HomeInitial(this.count);
}

final class HomeSuccessState extends HomeState {}

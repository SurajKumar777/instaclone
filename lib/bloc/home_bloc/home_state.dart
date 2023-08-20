part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeBarIndex extends HomeState {
  final int index;

  HomeBarIndex({this.index = 0});
}

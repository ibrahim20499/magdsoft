part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ProductsDataLodaing extends HomeState {}

class ProductsDataLoaded extends HomeState {}

class ProductsDataError extends HomeState {
  String message;
  ProductsDataError({required this.message});
}

class HelpDataLodaing extends HomeState {}

class HelpDataLoaded extends HomeState {}
class ChangeTabBarState extends HomeState {}

class HelpDataError extends HomeState {
  String message;
  HelpDataError({required this.message});
}
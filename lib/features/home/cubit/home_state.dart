part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final List images;
  HomeSuccessState(this.images);
}

final class HomeFailedState extends HomeState {}

/// ********************************************

final class BestSellerLoadingState extends HomeState {}

final class BestSellerSuccessState extends HomeState {
  final List<Product> books;
  BestSellerSuccessState({required this.books});
}

final class BestSellerFailedState extends HomeState {}

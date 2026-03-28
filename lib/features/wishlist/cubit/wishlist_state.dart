part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistLoaded extends WishlistState {
  final List<WishlistBook> books;
  WishlistLoaded({required this.books});
}

final class WishlistUpdated extends WishlistState {}

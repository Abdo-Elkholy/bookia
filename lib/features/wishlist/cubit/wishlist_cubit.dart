import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/models/product_model.dart';
import 'package:bookia/features/wishlist/data/models/wishlist_book_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  Box<WishlistBook> get _box => Hive.box<WishlistBook>('wishlistBox');

  void getBooks() {
    final books = _box.values.toList();
    emit(WishlistLoaded(books: books));
  }

  void addBook(Product product) {
    final book = WishlistBook.fromProduct(product);
    _box.put(book.id, book);
    emit(WishlistUpdated());
    getBooks();
  }

  void removeBook(int id) {
    _box.delete(id);
    emit(WishlistUpdated());
    getBooks();
  }

  bool isInWishlist(int id) {
    return _box.containsKey(id);
  }
}

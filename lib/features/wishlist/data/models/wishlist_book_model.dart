import 'package:hive/hive.dart';

import '../../../home/data/models/product_model.dart';

part 'wishlist_book_model.g.dart';

@HiveType(typeId: 0)
class WishlistBook extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String price;

  @HiveField(3)
  final String image;

  WishlistBook({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory WishlistBook.fromProduct(Product product) {
    return WishlistBook(
      id: product.id ?? 0,
      name: product.name ?? 'Unknown',
      price: product.price ?? '0',
      image: product.image ?? '',
    );
  }
}

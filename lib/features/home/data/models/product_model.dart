class ProductsResponse {
  final ProductData? data;
  final String? message;
  final int? status;

  ProductsResponse({this.data, this.message, this.status});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      data: json['data'] != null ? ProductData.fromJson(json['data']) : null,
      message: json['message'],
      status: json['status'],
    );
  }
}

class ProductData {
  final List<Product>? products;

  ProductData({this.products});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      products: json['products'] != null
          ? (json['products'] as List).map((i) => Product.fromJson(i)).toList()
          : null,
    );
  }
}

class Product {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final int? discount;
  final num? priceAfterDiscount;
  final int? stock;
  final int? bestSeller;
  final String? image;
  final String? category;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'],
      priceAfterDiscount: json['price_after_discount'],
      stock: json['stock'],
      bestSeller: json['best_seller'],
      image: json['image'],
      category: json['category'],
    );
  }
}

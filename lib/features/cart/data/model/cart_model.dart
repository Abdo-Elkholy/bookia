class CartResponse {
  CartData? data;
  String? message;
  List<dynamic>? error;
  int? status;

  CartResponse({this.data, this.message, this.error, this.status});

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      data: json['data'] != null ? CartData.fromJson(json['data']) : null,
      message: json['message'],
      error: json['error'] != null ? List<dynamic>.from(json['error']) : [],
      status: json['status'],
    );
  }
}

class CartData {
  int? id;
  CartUser? user;
  String? total;
  List<CartItem>? cartItems;

  CartData({this.id, this.user, this.total, this.cartItems});

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json['id'],
      user: json['user'] != null ? CartUser.fromJson(json['user']) : null,
      total: json['total'].toString(),
      cartItems: json['cart_items'] != null
          ? (json['cart_items'] as List)
                .map((i) => CartItem.fromJson(i))
                .toList()
          : [],
    );
  }
}

class CartUser {
  int? userId;
  String? userName;

  CartUser({this.userId, this.userName});

  factory CartUser.fromJson(Map<String, dynamic> json) {
    return CartUser(userId: json['user_id'], userName: json['user_name']);
  }
}

class CartItem {
  int? itemId;
  int? itemProductId;
  String? itemProductName;
  String? itemProductImage;
  String? itemProductPrice;
  num? itemProductDiscount;
  num? itemProductPriceAfterDiscount;
  int? itemProductStock;
  int? itemQuantity;
  num? itemTotal;

  CartItem({
    this.itemId,
    this.itemProductId,
    this.itemProductName,
    this.itemProductImage,
    this.itemProductPrice,
    this.itemProductDiscount,
    this.itemProductPriceAfterDiscount,
    this.itemProductStock,
    this.itemQuantity,
    this.itemTotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      itemId: json['item_id'],
      itemProductId: json['item_product_id'],
      itemProductName: json['item_product_name'],
      itemProductImage: json['item_product_image'],
      itemProductPrice: json['item_product_price'].toString(),
      itemProductDiscount: json['item_product_discount'],
      itemProductPriceAfterDiscount: json['item_product_price_after_discount'],
      itemProductStock: json['item_product_stock'],
      itemQuantity: json['item_quantity'],
      itemTotal: json['item_total'],
    );
  }
}

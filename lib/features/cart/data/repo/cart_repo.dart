import 'package:bookia/core/networking/dio_factory.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../model/cart_model.dart';

class CartRepo {
  static Future<void> addToCart(int id) async {
    try {
      await DioFactory.dio?.post(
        ApiConstants.addToCart,
        data: {"product_id": id},
      );
    } catch (error) {
      rethrow;
    }
  }

  static Future<CartResponse> showCart() async {
    try {
      Response<dynamic>? response = await DioFactory.dio?.get(
        ApiConstants.showCart,
      );
      return CartResponse.fromJson(response?.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> removeFromCart(int id) async {
    try {
      await DioFactory.dio?.post(
        ApiConstants.removeItem,
        data: {"cart_item_id": id},
      );
    } catch (error) {
      rethrow;
    }
  }
}

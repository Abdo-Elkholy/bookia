import 'package:bookia/core/networking/dio_factory.dart';

import '../../../../core/networking/api_constants.dart';

class CartRepo {
  Future<void> addToCart(int id) async {
    try {
      await DioFactory.dio?.post(
        ApiConstants.addToCart,
        data: {"product_id": id},
      );
    } catch (error) {
      rethrow;
    }
  }
}

import 'package:bookia/core/networking/dio_factory.dart';

import '../../../../core/networking/api_constants.dart';

class CartRepo {
  void cartRepo(int id) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiConstants.addToCart,
        data: {"product_id": id},
      );
    } catch (error) {}
    ;
  }
}

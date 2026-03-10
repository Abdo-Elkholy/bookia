import 'package:bookia/core/networking/api_constants.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:dio/dio.dart';

import '../models/product_model.dart';

class HomeRepo {
  static Future getSliderData() async {
    try {
      Response<dynamic>? response = await DioFactory.dio?.get(
        ApiConstants.sliderUrl,
      );
      return response?.data;
    } catch (e) {
      throw ("oops there was an error ");
    }
  }

  static Future<ProductsResponse> getBooks() async {
    try {
      Response<dynamic>? response = await DioFactory.dio?.get(
        ApiConstants.bestSellerUrl,
      );

      return ProductsResponse.fromJson(response?.data);
    } catch (error) {
      throw Exception(error);
    }
  }
}

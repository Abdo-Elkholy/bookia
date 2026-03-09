import 'package:dio/dio.dart';

import '../models/product_model.dart';

class HomeRepo {
  static final Dio _dio = Dio();

  static Future getSliderData() async {
    try {
      Response response = await _dio.get(
        "https://codingarabic.online/api/sliders",
      );
      return response.data;
    } catch (e) {
      throw ("oops there was an error ");
    }
  }

  static Future<ProductsResponse> getBooks() async {
    try {
      Response response = await _dio.get(
        "https://codingarabic.online/api/products-bestseller",
      );

      return ProductsResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }
}

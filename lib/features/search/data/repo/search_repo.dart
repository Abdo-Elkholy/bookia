import 'package:bookia/core/networking/api_constants.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/home/data/models/product_model.dart';
import 'package:dio/dio.dart';

class SearchRepo {
  static Future<Object> search(String name) async {
    try {
      final Response<dynamic>? response = await DioFactory.dio?.get(
        ApiConstants.searchUrl,
        queryParameters: {"name": name},
      );
      if (response?.statusCode == 200) {
        return ProductsResponse.fromJson(response?.data);
      } else {
        return response?.data["message"];
      }
    } catch (e) {
      return e.toString();
    }
  }
}

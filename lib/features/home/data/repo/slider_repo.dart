import 'package:bookia/features/home/data/models/slider_item_model.dart';
import 'package:dio/dio.dart';

class SliderRepo {
  final Dio _dio = Dio();

  Future<SliderItemModel> getData() async {
    try {
      Response response = await _dio.get(
        "https://codingarabic.online/api/sliders",
      );
      return SliderItemModel.fromJson(response.data);
    } catch (e) {
      throw ("oops there was an error");
    }
  }
}

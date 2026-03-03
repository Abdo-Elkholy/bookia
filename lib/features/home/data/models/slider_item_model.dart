class SliderItemModel {
  int statusCode;
  List<Map<String, String>>? imgUrl;

  SliderItemModel({required this.statusCode, required this.imgUrl});

  factory SliderItemModel.fromJson(Map json) {
    return SliderItemModel(
      statusCode: json["status"],
      imgUrl: json["data"]["sliders"],
    );
  }
}

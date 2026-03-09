class SliderItemModel {
  List imgUrl = [];

  SliderItemModel({required this.imgUrl});

  factory SliderItemModel.fromJson(Map json) {
    return SliderItemModel(imgUrl: json["data"]["sliders"]);
  }
}

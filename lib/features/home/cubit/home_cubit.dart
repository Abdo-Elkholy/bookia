import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/models/product_model.dart';
import 'package:bookia/features/home/data/models/slider_item_model.dart';
import 'package:flutter/material.dart';

import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getSliders() async {
    emit(HomeLoadingState());
    List<String> images = [];
    try {
      final data = await HomeRepo.getSliderData();
      SliderItemModel sliderItem = SliderItemModel.fromJson(data);
      if (sliderItem.imgUrl.isNotEmpty) {
        for (var item in sliderItem.imgUrl) {
          final image = item["image"];
          if (image != null) images.add(image.toString());
        }
        emit(HomeSuccessState(images));
      }
    } catch (e) {
      emit(HomeFailedState());
      throw ("oops there was an error2");
    }
  }

  void getBestSellerData() async {
    emit(BestSellerLoadingState());
    try {
      ProductsResponse product = await HomeRepo.getBooks();
      if (product.data != null && product.data!.products != null) {
        emit(BestSellerSuccessState(books: product.data?.products ?? []));
      } else {
        return null;
      }
    } catch (error) {
      emit(BestSellerFailedState());
      throw "error cubit";
    }
  }
}

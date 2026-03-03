import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/models/slider_item_model.dart';
import 'package:bookia/features/home/data/repo/slider_repo.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future x() async {
    emit(HomeLoadingState());
    List<String> s = [];
    try {
      SliderItemModel sliderItem = await SliderRepo().getData();
      if (sliderItem.imgUrl != null) {
        sliderItem.imgUrl?.forEach((item) {
          s.add(item["image"]!);
        });
        emit(HomeSuccessState());
      }
      return s;
    } catch (e) {
      emit(HomeFailedState());
      throw ("oops there was an error");
    }
  }
}

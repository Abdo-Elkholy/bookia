import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:meta/meta.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootInitial());
  int selectedIndex = 0;

  void onTap(int i) {
    selectedIndex = i;
    emit(ChangeScreen());
  }

  Color select(int index) {
    if (selectedIndex == index) {
      return AppColors.primaryColor;
    } else {
      return AppColors.darkGray;
    }
  }
}

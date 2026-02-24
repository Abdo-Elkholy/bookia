import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int long = 0;
  int active = -1;
  Color a = Color(0xfffff545);
  IconData b = Icons.check;

  void add() {
    long++;
    emit(IncrementState());
  }

  void minas() {
    long--;
    long < 0 ? long = 0 : null;
    emit(DecrementState());
  }

  void ontap(int i) {
    active = i;
    emit(Choos());
  }

  Color check(int i) {
    if (active == i) {
      return Colors.red;
    } else {
      return Colors.black12;
    }
  }
}

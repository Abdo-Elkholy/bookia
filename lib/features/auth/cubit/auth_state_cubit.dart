import 'package:bloc/bloc.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/cupertino.dart';

part 'auth_state_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());

  void login(String email, String passWord) async {
    emit(AuthLoadingState());

    final response = await AuthRepo.getData(email, passWord);

    if (response) {
      emit(AuthSuccessState());
    } else {
      emit(AuthFailedState());
    }
  }
}

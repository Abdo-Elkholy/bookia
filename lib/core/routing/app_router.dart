import 'package:bookia/core/routing/routs.dart';
import 'package:bookia/features/auth/cubit/auth_state_cubit.dart';
import 'package:bookia/features/auth/ui/login_screen.dart';
import 'package:bookia/features/auth/ui/register_screen.dart';
import 'package:bookia/features/home/ui/screens/home_screen.dart';
import 'package:bookia/features/on_boarding/ui/on_boarding_screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/new_password/ui/screens/finish_screen.dart';
import '../../features/new_password/ui/screens/forget_password_screen.dart';
import '../../features/new_password/ui/screens/new_password_screen.dart';
import '../../features/new_password/ui/screens/obt_screen.dart';

class AppRouter {
  static Route? generateRout(RouteSettings setting) {
    switch (setting.name) {
      case Routs.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginScreen(),
          ),
        );
      case Routs.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: RegisterScreen(),
          ),
        );
      case Routs.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routs.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routs.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case Routs.obtScreen:
        return MaterialPageRoute(builder: (_) => ObtScreen());
      case Routs.setNewPasswordScreen:
        return MaterialPageRoute(builder: (_) => NewPasswordScreen());
      case Routs.finishScreen:
        return MaterialPageRoute(builder: (_) => FinishScreen());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text("page not found")));
          },
        );
    }
  }
}

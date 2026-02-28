import 'package:bookia/core/routing/routs.dart';
import 'package:bookia/features/auth/cubit/auth_state_cubit.dart';
import 'package:bookia/features/auth/ui/login_screen.dart';
import 'package:bookia/features/auth/ui/register_screen.dart';
import 'package:bookia/features/home/ui/screens/home_screen.dart';
import 'package:bookia/features/on_boarding/ui/on_boarding_screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routs.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routs.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text("page not found")));
          },
        );
    }
  }
}

import 'package:bookia/core/routing/app_router.dart';
import 'package:bookia/core/routing/routs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookiaApp extends StatelessWidget {
  final String? token;
  const BookiaApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: AppRouter.generateRout,
        initialRoute: startScreen(),
      ),
    );
  }

  String startScreen() {
    if (token == null) {
      return Routs.onBoardingScreen;
    } else {
      return Routs.root;
    }
  }
}

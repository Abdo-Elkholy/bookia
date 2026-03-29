import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routs.dart';
import '../../../../core/widgets/main_app_button.dart';
import '../../../../gen/assets.gen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: ResizeImage(
              AssetImage(Assets.images.splashBackground.path),
              width: 1080,
              height: 2340,
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 35.h),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (context.locale.languageCode == 'ar') {
                      context.setLocale(Locale('en'));
                    } else {
                      context.setLocale(Locale('ar'));
                    }
                  },
                  icon: Icon(Icons.language),
                ),
              ],
            ),
            SizedBox(height: 100.h),
            Image(image: AssetImage(Assets.images.logo.path)),
            SizedBox(height: 28.h),

            Text("on_boarding_screen".tr(), style: AppTextStyle.text20Regular),
            Spacer(),
            MainAppButton(
              title: 'Login'.tr(),
              onTap: () {
                context.pushNamed(Routs.loginScreen);
              },
            ),
            SizedBox(height: 15.h),
            MainAppButton(
              title: 'Register'.tr(),
              color: Colors.white,
              onTap: () {
                context.pushNamed(Routs.registerScreen);
              },
            ),
            SizedBox(height: 90.h),
          ],
        ),
      ),
    );
  }
}

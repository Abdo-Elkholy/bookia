import 'package:bookia/features/auth/ui/register_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/main_app_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/ui/login_screen.dart';

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
            image: AssetImage(Assets.images.splashBackground.path),
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

            Text("on_boarding_screen".tr()),
            Spacer(),
            MainAppButton(
              title: 'Login'.tr(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            SizedBox(height: 15.h),
            MainAppButton(
              title: 'Register'.tr(),
              color: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
            ),
            SizedBox(height: 90.h),
          ],
        ),
      ),
    );
  }
}

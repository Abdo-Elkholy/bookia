import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/widgets/app_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routs.dart';
import '../../../../core/widgets/FooterWidget.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/main_app_button.dart';
import '../widgets/header_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SubScreensAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                mainTitle: "Forgot Password?".tr(),
                subTitle:
                    "Don't worry! It occurs. Please enter the email address linked with your account."
                        .tr(),
              ),
              AppTextFormField(
                title: "Enter your email".tr(),
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30.h),
              MainAppButton(
                title: "Send Code".tr(),
                onTap: () {
                  context.pushNamedAndRemove(Routs.obtScreen);
                },
              ),
              SizedBox(height: 360.h),
              FooterWidget(
                title: 'Remember Password? ',
                action: 'Login',
                target: Routs.loginScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

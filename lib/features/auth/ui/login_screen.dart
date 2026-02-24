import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/main_app_button.dart';
import 'package:bookia/features/auth/ui/register_screen.dart';
import 'package:bookia/features/auth/ui/widgets/auth_footer_widget.dart';
import 'package:bookia/features/auth/ui/widgets/login_options.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SubScreensAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 29.h),
          child: Column(
            children: [
              SizedBox(
                width: 300.w,
                child: Text(
                  "Welcome back! Glad to see you, Again!".tr(),
                  style: AppTextStyle.text30Regular,
                ),
              ),
              AppTextFormField(
                title: "email",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 40.h),
              AppTextFormField(
                title: "password",
                textInputType: TextInputType.visiblePassword,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?".tr(),
                      style: AppTextStyle.text14Regular.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                  ),
                ],
              ),
              MainAppButton(
                title: "log in".tr(),
                onTap: () {
                  login();
                },
              ),

              LoginOptions(),
              AuthFooterWidget(
                title: "Don’t have an account?".tr(),
                action: "Register Now".tr(),
                target: RegisterScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    Dio dio = Dio();
    final response = await dio.post(
      "https://codingarabic.online/api/login",
      data: {"email": "ahmed12@gmail.com", "password": "12345678"},
    );

    print(response.data);
  }
}

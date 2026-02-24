import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/features/auth/ui/widgets/auth_footer_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../../core/widgets/main_app_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              Text(
                "Hello! Register to get started".tr(),
                style: AppTextStyle.text30Regular,
              ),
              AppTextFormField(title: "Username"),

              AppTextFormField(
                title: "Email",
                textInputType: TextInputType.emailAddress,
              ),
              AppTextFormField(
                title: "password",
                textInputType: TextInputType.visiblePassword,
              ),
              AppTextFormField(
                title: "Confirm password",
                textInputType: TextInputType.visiblePassword,
                hide: false,
              ),
              MainAppButton(title: "Register".tr(), onTap: () {}),
              AuthFooterWidget(
                title: "Already have an account?".tr(),
                action: "Login Now".tr(),
                target: RegisterScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

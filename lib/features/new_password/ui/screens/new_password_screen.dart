import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routs.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/main_app_button.dart';
import '../widgets/header_widget.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
                mainTitle: "Create new password",
                subTitle:
                    "Your new password must be unique from those previously used.",
              ),
              AppTextFormField(
                title: "New Password",
                textInputType: TextInputType.visiblePassword,
                hide: true,
              ),
              SizedBox(height: 15.h),
              AppTextFormField(
                title: "Confirm Password",
                textInputType: TextInputType.visiblePassword,
                hide: false,
              ),
              SizedBox(height: 30.h),
              MainAppButton(
                title: "Reset Password",
                onTap: () {
                  context.pushNamedAndRemove(Routs.finishScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/features/new_password/ui/widgets/header_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';

import '../../../../core/routing/routs.dart';
import '../../../../core/widgets/FooterWidget.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/main_app_button.dart';
import '../widgets/otp_verification_widget.dart';

class ObtScreen extends StatelessWidget {
  ObtScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SubScreensAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  mainTitle: "OTP Verification".tr(),
                  subTitle:
                      "Enter the verification code we just sent on your email address.",
                ),
                OtpVerificationWidget(
                  validator: ValidationBuilder()
                      .required("This field is required".tr())
                      .maxLength(6)
                      .minLength(6)
                      .build(),
                ),

                SizedBox(height: 30.h),
                MainAppButton(
                  title: "Verify".tr(),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.pushNamedAndRemove(Routs.setNewPasswordScreen);
                    }
                  },
                ),
                SizedBox(height: 360.h),
                FooterWidget(
                  title: 'Didn’t received code? ',
                  action: 'Resend'.tr(),
                  target: Routs.forgetPasswordScreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

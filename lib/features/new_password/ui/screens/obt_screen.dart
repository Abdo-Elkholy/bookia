import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/features/new_password/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routs.dart';
import '../../../../core/widgets/FooterWidget.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/main_app_button.dart';
import '../widgets/otp_verification_widget.dart';

class ObtScreen extends StatelessWidget {
  const ObtScreen({super.key});

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
                mainTitle: "OTP Verification",
                subTitle:
                    "Enter the verification code we just sent on your email address.",
              ),
              OtpVerificationWidget(),

              SizedBox(height: 30.h),
              MainAppButton(
                title: "Verify",
                onTap: () {
                  context.pushNamedAndRemove(Routs.setNewPasswordScreen);
                },
              ),
              SizedBox(height: 360.h),
              FooterWidget(
                title: 'Didn’t received code? ',
                action: 'Resend',
                target: Routs.forgetPasswordScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

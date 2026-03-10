import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/helper/validation.dart';
import 'package:bookia/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/routing/routs.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/main_app_button.dart';
import '../widgets/header_widget.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                  mainTitle: "Create new password".tr(),
                  subTitle:
                      "Your new password must be unique from those previously used.",
                ),
                AppTextFormField(
                  controller: passwordController,
                  title: "New Password".tr(),
                  textInputType: TextInputType.visiblePassword,
                  hide: true,
                  validator: Validation.newPasswordValidator(),
                ),
                SizedBox(height: 15.h),
                AppTextFormField(
                  controller: confirmPasswordController,
                  title: "Confirm Password".tr(),
                  textInputType: TextInputType.visiblePassword,
                  hide: false,
                  validator: Validation.confirmPasswordValidator(
                    passwordController,
                  ),
                ),
                SizedBox(height: 30.h),
                MainAppButton(
                  title: "Reset Password".tr(),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.pushNamedAndRemove(Routs.finishScreen);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

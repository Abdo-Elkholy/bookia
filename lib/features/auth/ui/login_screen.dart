import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/FooterWidget.dart';
import 'package:bookia/core/widgets/main_app_button.dart';
import 'package:bookia/features/auth/ui/widgets/login_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/validation.dart';
import '../../../core/routing/routs.dart';
import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../cubit/auth_state_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SubScreensAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                SizedBox(height: 32.h),
                AppTextFormField(
                  title: "email".tr(),
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: Validation.emailValidator(),
                ),
                SizedBox(height: 15.h),
                AppTextFormField(
                  title: "password".tr(),
                  textInputType: TextInputType.visiblePassword,
                  controller: passWordController,
                  validator: Validation.passwordValidator(),
                ),
                SizedBox(height: 13.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pushNamedAndRemove(Routs.forgetPasswordScreen);
                      },
                      child: Text(
                        "Forgot Password?".tr(),
                        style: AppTextStyle.text14Regular.copyWith(
                          color: AppColors.darkGray,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoadingState) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) =>
                            Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is AuthFailedState) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(title: Text("Error".tr())),
                      );
                    } else if (state is AuthSuccessState) {
                      context.pushNamedAndRemoveAll(Routs.root);
                    }
                  },
                  child: MainAppButton(
                    title: "log in".tr(),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          emailController.text,
                          passWordController.text,
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 34.h),
                LoginOptions(),
                SizedBox(height: 40.h),
                FooterWidget(
                  title: "Don’t have an account?".tr(),
                  action: "Register Now".tr(),
                  target: Routs.registerScreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

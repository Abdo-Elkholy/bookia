import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/helper/validation.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/FooterWidget.dart';
import 'package:bookia/features/auth/cubit/auth_state_cubit.dart';
import 'package:bookia/features/auth/data/models/new_user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';

import '../../../core/routing/routs.dart';
import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../../core/widgets/main_app_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late NewUserModel newUser;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
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
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 29.h),
            child: Column(
              children: [
                SizedBox(height: 28.h),
                Text(
                  "Hello! Register to get started".tr(),
                  style: AppTextStyle.text30Regular,
                ),
                SizedBox(height: 32.h),
                AppTextFormField(
                  title: "Username".tr(),
                  controller: nameController,
                  validator: ValidationBuilder(
                    optional: false,
                  ).required("This field is required".tr()).build(),
                ),
                SizedBox(height: 11.h),
                AppTextFormField(
                  title: "Email".tr(),
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: Validation.emailValidator(),
                ),
                SizedBox(height: 11.h),
                AppTextFormField(
                  title: "password".tr(),
                  textInputType: TextInputType.visiblePassword,
                  controller: passwordController,
                  validator: Validation.newPasswordValidator(),
                ),
                SizedBox(height: 11.h),
                AppTextFormField(
                  title: "Confirm password".tr(),
                  textInputType: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
                  hide: false,
                  validator: Validation.confirmPasswordValidator(
                    passwordController,
                  ),
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
                    } else if (state is AuthSuccessState) {
                      context.pushNamedAndRemoveAll(Routs.root);
                    } else {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Error".tr()),
                          content: Text("data".tr()),
                        ),
                      );
                    }
                  },
                  child: MainAppButton(
                    title: "Register".tr(),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        newUser = NewUserModel(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          passwordConfirmation: confirmPasswordController.text,
                        );
                        context.read<AuthCubit>().register(newUser);
                      }
                    },
                  ),
                ),
                SizedBox(height: 150.h),
                FooterWidget(
                  title: "Already have an account?".tr(),
                  action: "Login Now".tr(),
                  target: Routs.loginScreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

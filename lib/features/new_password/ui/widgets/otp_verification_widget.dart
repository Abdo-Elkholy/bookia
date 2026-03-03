import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationWidget extends StatelessWidget {
  final String? Function(String?) validator;
  OtpVerificationWidget({super.key, required this.validator});
  final PinTheme _defaultPinTheme = PinTheme(
    textStyle: AppTextStyle.text20Regular,
    width: 48.w,
    height: 60.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.borderColor),
      color: AppColors.textFormFieldColor,
    ),
  );
  late final PinTheme _focusedPinTheme = _defaultPinTheme.copyWith(
    decoration: _defaultPinTheme.decoration!.copyWith(
      border: Border.all(color: AppColors.primaryColor),
      color: AppColors.appWhite,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pinput(
          validator: validator,
          showCursor: false,
          separatorBuilder: (int i) => SizedBox(width: 7.w),
          length: 6,
          onCompleted: (pin) {},
          defaultPinTheme: _defaultPinTheme,
          focusedPinTheme: _focusedPinTheme,
        ),
      ],
    );
  }
}

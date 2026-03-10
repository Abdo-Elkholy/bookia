import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.borderColor,
            ),
            Container(
              width: 100.w,
              color: Colors.white,
              alignment: AlignmentGeometry.center,
              child: Text(
                "or".tr(),
                style: AppTextStyle.text14Regular.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        LoginOption(
          title: 'Sign in with Google'.tr(),
          iconPath: Assets.icons.googleIc,
        ),
        SizedBox(height: 15.h),
        LoginOption(
          title: 'Sign in with Apple'.tr(),
          iconPath: Assets.icons.cibApple,
        ),
      ],
    );
  }
}

class LoginOption extends StatelessWidget {
  final String title;
  final String iconPath;
  const LoginOption({super.key, required this.title, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: AlignmentGeometry.xy(0, 0),
        width: 331.w,
        padding: EdgeInsetsDirectional.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.appWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath, width: 20.w, height: 20.h),
            SizedBox(width: 10.w),
            Text(
              title,
              style: AppTextStyle.text14Regular.copyWith(
                color: AppColors.darkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

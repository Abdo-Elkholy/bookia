import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class MainAppButton extends StatelessWidget {
  final String title;
  final Color? color;
  final void Function() onTap;
  const MainAppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: AlignmentGeometry.xy(0, 0),
        width: 331.w,
        padding: EdgeInsetsDirectional.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
          border: color == Colors.white
              ? Border.all(color: Color(0xff2F2F2F))
              : null,
        ),
        child: Text(
          title,
          style: color == null
              ? AppTextStyle.text15Regular.copyWith(color: Colors.white)
              : AppTextStyle.text15Regular,
        ),
      ),
    );
  }
}

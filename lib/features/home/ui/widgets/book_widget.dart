import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class BookWidget extends StatelessWidget {
  final String price;
  const BookWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(price, style: AppTextStyle.text15Regular),
        Container(
          alignment: AlignmentGeometry.center,
          width: 71.w,
          height: 28.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: AppColors.black,
          ),
          child: Text(
            "Buy",
            style: AppTextStyle.text14Regular.copyWith(
              color: AppColors.appWhite,
            ),
          ),
        ),
      ],
    );
  }
}

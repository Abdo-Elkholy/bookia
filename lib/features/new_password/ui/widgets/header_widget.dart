import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_style.dart';

class Header extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final CrossAxisAlignment alignment;

  const Header({
    super.key,
    required this.mainTitle,
    required this.subTitle,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,

      children: [
        SizedBox(height: 30.h),
        Text(mainTitle, style: AppTextStyle.text30Regular),
        SizedBox(height: 10.h),
        Text(
          subTitle,
          style: AppTextStyle.text14Regular,
          textAlign: alignment == CrossAxisAlignment.start
              ? TextAlign.start
              : TextAlign.center,
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}

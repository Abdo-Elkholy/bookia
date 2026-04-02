import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/main_app_button.dart';

class PriceWidget extends StatelessWidget {
  final String action;
  final String total;
  final void Function() onTap;

  const PriceWidget({
    super.key,
    required this.action,
    required this.onTap,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total:".tr(),
                style: AppTextStyle.text20Regular.copyWith(
                  color: AppColors.textGray,
                ),
              ),
              Text(
                total,
                style: AppTextStyle.text24Regular.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        MainAppButton(title: action.tr(), onTap: onTap),
      ],
    );
  }
}

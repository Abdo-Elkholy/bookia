import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class BookWidget extends StatelessWidget {
  final String price;
  final String action;
  final double height;
  final void Function() onTap;
  final TextStyle priceStyle;
  final TextStyle actionStyle;
  final int flex;

  const BookWidget({
    super.key,
    required this.price,
    required this.onTap,
    required this.action,
    required this.height,
    required this.priceStyle,
    required this.actionStyle,
    required this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex: 2, child: Text(price, style: priceStyle)),

        Expanded(
          flex: flex,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(vertical: height.h),
              alignment: AlignmentGeometry.center,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.black,
              ),
              child: Text(action, style: actionStyle),
            ),
          ),
        ),
      ],
    );
  }
}

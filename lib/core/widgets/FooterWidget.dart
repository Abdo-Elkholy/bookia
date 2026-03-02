import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  final String title;
  final String action;
  final String target;
  const FooterWidget({
    super.key,
    required this.title,
    required this.action,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: AppTextStyle.text14Regular),
        GestureDetector(
          onTap: () {
            context.pushNamedAndRemove(target);
          },
          child: Text(
            action,
            style: AppTextStyle.text14Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

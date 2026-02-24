import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AuthFooterWidget extends StatelessWidget {
  final String title;
  final String action;
  final Widget target;
  const AuthFooterWidget({
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => target),
            );
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

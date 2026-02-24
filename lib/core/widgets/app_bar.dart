import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubScreensAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconButton? icon;
  const SubScreensAppBar({super.key, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 10.h),
        child: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: Back_Button(),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: title == null
              ? null
              : Text(title!, style: AppTextStyle.text24Regular),
          actions: icon == null ? null : [?icon],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/widgets/main_app_button.dart';

class FailedStateWidget extends StatelessWidget {
  final void Function() onTap;
  const FailedStateWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("oops there was an error".tr())),
        SizedBox(
          width: 100.w,
          height: 55.h,
          child: MainAppButton(title: "try".tr(), onTap: onTap),
        ),
      ],
    );
  }
}

import 'package:bookia/core/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderItem extends StatelessWidget {
  SliderItem({super.key, this.src});
  String? src;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 150.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: NetworkImageWidget(
          url: src!,
          width: 350,
          height: 150,
          memCacheWidth: 498,
          memCacheHeight: 403,
        ),
      ),
    );
  }
}

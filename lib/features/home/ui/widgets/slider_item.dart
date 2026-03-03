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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
        image: src == null
            ? null
            : DecorationImage(image: Image.network(src!).image),
      ),
      child: src == null
          ? null
          : Center(child: CircularProgressIndicator(color: Colors.red)),
    );
  }
}

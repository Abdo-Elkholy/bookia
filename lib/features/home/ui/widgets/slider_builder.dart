import 'package:bookia/core/theme/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderBuilder extends StatefulWidget {
  final List<Widget> items;

  const SliderBuilder({super.key, required this.items});

  @override
  State<SliderBuilder> createState() => _SliderBuilderState();
}

class _SliderBuilderState extends State<SliderBuilder> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 170.h,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, i) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          items: widget.items,
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.items.length, (i) {
            return Row(
              children: [
                Container(
                  width: _selectedIndex == i ? 30.w : 10.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: _selectedIndex == i
                        ? AppColors.primaryColor
                        : AppColors.darkGray,
                  ),
                ),
                SizedBox(width: 5.w),
              ],
            );
          }),
        ),
      ],
    );
  }
}

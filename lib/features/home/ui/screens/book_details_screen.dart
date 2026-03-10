import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/app_bar.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/book_widget.dart';

class BookDetailsScreen extends StatelessWidget {
  //final Product book;
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      appBar: SubScreensAppBar(icon: SvgPicture.asset(Assets.icons.bookmark)),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image(
                image: AssetImage(Assets.images.book1.path),
                width: 185.w,
              ),
            ),
            SizedBox(height: 20.h),
            Text("Black Heart", style: AppTextStyle.text30Regular),
            SizedBox(height: 15.h),
            Text(
              "Broché",
              style: AppTextStyle.text15Regular.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              style: AppTextStyle.text12Regular,
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",
            ),
            SizedBox(height: 30.h),
            BookWidget(
              price: "200",
              onTap: () {},
              action: 'Add To Cart',
              height: 15.h,
              priceStyle: AppTextStyle.text24Regular,
              actionStyle: AppTextStyle.text20Regular.copyWith(
                color: AppColors.appWhite,
              ),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}

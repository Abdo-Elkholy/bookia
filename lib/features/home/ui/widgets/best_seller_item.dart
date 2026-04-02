import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/features/home/data/models/product_model.dart';
import 'package:bookia/features/cart/cubit/cart_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routs.dart';
import '../../../../core/widgets/network_image.dart';
import 'book_widget.dart';

class BestSellerItem extends StatelessWidget {
  final Product book;

  const BestSellerItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.books,
      ),
      width: 158.w,
      child: Padding(
        padding: EdgeInsets.only(left: 11.w, right: 11.w, top: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: NetworkImageWidget(
                url: book.image ?? "null",
                width: 140.w,
                height: 173.h,
                memCacheWidth: 498,
                memCacheHeight: 403,
              ),
            ),
            Expanded(
              child: Text(
                book.name ?? "Error".tr(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.text18Regular,
              ),
            ),

            BookWidget(
              price: book.price ?? "error",
              onTap: () {
                context.pushNamed(Routs.bookDetailsScreen, arguments: {
                  'book': book,
                  'cartCubit': context.read<CartCubit>(),
                });
              },
              action: "Buy".tr(),
              height: 4.h,
              priceStyle: AppTextStyle.text15Regular,
              actionStyle: AppTextStyle.text14Regular.copyWith(
                color: AppColors.appWhite,
              ),
              flex: 2,
            ),
            SizedBox(height: 11.h),
          ],
        ),
      ),
    );
  }
}

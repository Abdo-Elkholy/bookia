import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/network_image.dart';
import 'package:bookia/features/wishlist/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_bar.dart';
import '../../data/models/product_model.dart';
import '../widgets/book_widget.dart';

class BookDetailsScreen extends StatelessWidget {
  final Product book;
  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      appBar: SubScreensAppBar(
        icon: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            final isSaved = context.read<WishlistCubit>().isInWishlist(book.id ?? 0);
            return GestureDetector(
              onTap: () {
                if (isSaved) {
                  context.read<WishlistCubit>().removeBook(book.id ?? 0);
                } else {
                  context.read<WishlistCubit>().addBook(book);
                }
              },
              child: Icon(
                isSaved ? Icons.bookmark : Icons.bookmark_border,
                color: AppColors.primaryColor,
                size: 28.r,
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: NetworkImageWidget(
                        url: book.image!,
                        width: 170.w,
                        height: 220.h,
                        memCacheWidth: 180,
                        memCacheHeight: 210,
                      ),
                    ),

                    SizedBox(height: 20.h),
                    Text(
                      book.name ?? "Unknown",
                      style: AppTextStyle.text30Regular,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      book.name ?? "Unknown",
                      style: AppTextStyle.text15Regular.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(style: AppTextStyle.text12Regular, book.description!),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),

            Column(
              children: [
                BookWidget(
                  price: book.price!,
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
          ],
        ),
      ),
    );
  }
}


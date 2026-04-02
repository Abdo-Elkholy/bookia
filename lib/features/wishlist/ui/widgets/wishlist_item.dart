import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/network_image.dart';
import 'package:bookia/features/wishlist/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routs.dart';
import '../../../home/data/models/product_model.dart';
import '../../data/models/wishlist_book_model.dart';

class WishlistItem extends StatelessWidget {
  final WishlistBook book;
  final VoidCallback onRemove;

  const WishlistItem({super.key, required this.book, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routs.bookDetailsScreen,
          arguments: {
            'book': Product(
              id: book.id,
              name: book.name,
              price: book.price,
              image: book.image,
              description: book.description,
            ),
            'wishlistCubit': context.read<WishlistCubit>(),
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.books,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 11.w, right: 11.w, top: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: NetworkImageWidget(
                  url: book.image,
                  width: 140.w,
                  height: 173.h,
                  memCacheWidth: 498,
                  memCacheHeight: 403,
                ),
              ),
              SizedBox(height: 6.h),
              Expanded(
                child: Text(
                  book.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.text18Regular,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '₹${book.price}',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.text15Regular,
                    ),
                  ),
                  GestureDetector(
                    onTap: onRemove,
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.black, width: 1.5),
                      ),
                      child: Icon(
                        Icons.close,
                        size: 14.r,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 11.h),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/features/wishlist/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/ui/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Text('Wishlist', style: AppTextStyle.text24Regular),
          SizedBox(height: 20.h),
          Expanded(
            child: BlocBuilder<WishlistCubit, WishlistState>(
              buildWhen: (prev, current) =>
                  current is WishlistLoaded || current is WishlistUpdated,
              builder: (context, state) {
                if (state is WishlistLoaded) {
                  if (state.books.isEmpty) {
                    return Center(
                      child: Text(
                        'No books in your wishlist yet',
                        style: AppTextStyle.text18Regular.copyWith(
                          color: AppColors.darkGray,
                        ),
                      ),
                    );
                  }
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 15.h,
                      childAspectRatio: 0.62,
                    ),
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      final book = state.books[index];
                      return WishlistItem(
                        book: book,
                        onRemove: () {
                          context.read<WishlistCubit>().removeBook(book.id);
                        },
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

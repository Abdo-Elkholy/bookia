import 'package:bookia/features/cart/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../cubit/cart_cubit.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            item.itemProductImage!,
            width: 105,
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        item.itemProductName ?? "error",
                        style: AppTextStyle.text20Regular.copyWith(
                          color: AppColors.textGray,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.itemProductPrice ?? "##",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 40.h),

                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            GestureDetector(
                              child: _iconStyle(Icons.add),
                              onTap: () {
                                context.read<CartCubit>().addToCart(
                                  item.itemProductId ?? 0,
                                );
                              },
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "${item.itemQuantity}",
                              style: AppTextStyle.text18Regular.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 16),
                            GestureDetector(
                              child: _iconStyle(Icons.remove),
                              onTap: () {
                                context.read<CartCubit>().removeItem(
                                  item.itemId ?? 0,
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _iconStyle(IconData icon) {
  return Container(
    padding: EdgeInsetsDirectional.all(5),
    decoration: BoxDecoration(
      color: Color(0xcee0e0e0),
      borderRadius: BorderRadius.circular(6.r),
    ),
    child: Icon(icon, size: 18),
  );
}

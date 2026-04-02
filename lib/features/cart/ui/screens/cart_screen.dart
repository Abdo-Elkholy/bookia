import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/routing/routs.dart';
import 'package:bookia/features/cart/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/data/model/cart_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_style.dart';
import '../widgets/cart_list_builder.dart';
import '../widgets/price_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          Center(
            child: Text('My Cart'.tr(), style: AppTextStyle.text24Regular),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) {
                return current is ShowCartSuccess ||
                    current is ShowCartLoading ||
                    current is ShowCartFailed ||
                    current is RemoveItemLoading ||
                    current is RemoveItemSuccess ||
                    current is UpdateCartLoading;
              },
              builder: (context, state) {
                CartData? data;

                if (state is ShowCartSuccess) {
                  data = state.data;
                } else if (state is RemoveItemLoading) {
                  data = state.data;
                } else if (state is RemoveItemSuccess) {
                  data = state.data;
                } else if (state is RemoveItemFailed) {
                  data = state.data;
                } else if (state is UpdateCartLoading) {
                  data = state.data;
                }

                if (state is ShowCartLoading && data == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (data != null &&
                    data.cartItems != null &&
                    data.cartItems!.isNotEmpty) {
                  return Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CartListBuilder(
                              cartItems: data.cartItems!,
                            ),
                          ),
                          PriceWidget(
                            action: "Checkout",
                            onTap: () {
                              context.pushNamed(
                                Routs.checkoutScreen,
                                arguments: data!.total ?? "0",
                              );
                            },
                            total: data.total ?? "0",
                          ),
                        ],
                      ),
                      if (state is RemoveItemLoading ||
                          state is UpdateCartLoading)
                        Positioned.fill(
                          child: Container(
                            color: Colors.white.withValues(alpha: 0.4),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(child: Text("No items in cart")),
                      ),
                      PriceWidget(
                        action: "Checkout",
                        onTap: () {
                          context.pushNamed(
                            Routs.checkoutScreen,
                            arguments: "0",
                          );
                        },
                        total: '0',
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

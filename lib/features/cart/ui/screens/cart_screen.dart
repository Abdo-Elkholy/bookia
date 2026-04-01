import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/routing/routs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: CartListBuilder()),

                PriceWidget(
                  action: "Checkout",
                  onTap: () {
                    context.pushNamed(Routs.checkoutScreen, arguments: "");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

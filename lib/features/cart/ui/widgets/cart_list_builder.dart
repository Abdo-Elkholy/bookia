import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/cart_model.dart';
import 'cart_item.dart';

class CartListBuilder extends StatelessWidget {
  const CartListBuilder({super.key, required this.cartItems});
  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) => CartItemWidget(item: cartItems[i]),
      separatorBuilder: (context, i) => Column(
        children: [
          SizedBox(height: 15.h),
          Divider(thickness: 1.5, color: Color(0xffF0F0F0)),
        ],
      ),
      itemCount: cartItems.length,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cart_item.dart';

class CartListBuilder extends StatelessWidget {
  const CartListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) => CartItem(),
      separatorBuilder: (context, i) => Column(
        children: [
          SizedBox(height: 15.h),
          Divider(thickness: 1.5, color: Color(0xffF0F0F0)),
        ],
      ),
      itemCount: 5,
    );
  }
}

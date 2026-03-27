import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/routing/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Assets.icons.logo, width: 100),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routs.searchScreen);
          },
          child: SvgPicture.asset(Assets.icons.search, width: 25),
        ),
      ],
    );
  }
}

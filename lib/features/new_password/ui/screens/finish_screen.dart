import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper/extentions.dart';
import '../../../../core/routing/routs.dart';
import '../../../../core/widgets/main_app_button.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/header_widget.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.icons.successmark, height: 100),
              Header(
                alignment: CrossAxisAlignment.center,
                mainTitle: "Password Changed!".tr(),
                subTitle: "Your password has been changed successfully.".tr(),
              ),

              MainAppButton(
                title: "Back to Login".tr(),
                onTap: () {
                  context.pushNamedAndRemove(Routs.onBoardingScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

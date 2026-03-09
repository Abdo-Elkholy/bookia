import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/home/ui/screens/home_screen.dart';
import 'package:bookia/features/new_password/ui/screens/finish_screen.dart';
import 'package:bookia/features/new_password/ui/screens/forget_password_screen.dart';
import 'package:bookia/features/new_password/ui/screens/new_password_screen.dart';
import 'package:bookia/features/root/cubit/root_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';

class Root extends StatelessWidget {
  static final List<String> icons = [
    Assets.icons.home,
    Assets.icons.bookmark,
    Assets.icons.category,
    Assets.icons.profile,
  ];
  static final List<Widget> screens = [
    const HomeScreen(),
    const NewPasswordScreen(),
    ForgetPasswordScreen(),
    const FinishScreen(),
  ];

  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhite,

      body: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return SafeArea(
            child: IndexedStack(
              index: context.read<RootCubit>().selectedIndex,
              children: screens,
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.appWhite,
        elevation: 0,
        height: 65.h,
        child: BlocBuilder<RootCubit, RootState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                icons.length,
                (i) => GestureDetector(
                  child: SvgPicture.asset(
                    icons[i],
                    colorFilter: ColorFilter.mode(
                      context.read<RootCubit>().select(i),
                      BlendMode.srcIn,
                    ),
                  ),
                  onTap: () {
                    context.read<RootCubit>().onTap(i);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

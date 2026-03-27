import 'package:bookia/features/home/cubit/home_cubit.dart';
import 'package:bookia/features/home/ui/widgets/home_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theme/app_text_style.dart';
import '../widgets/best_seller_builder.dart';
import '../widgets/failed_state_widget.dart';
import '../widgets/slider_builder.dart';
import '../widgets/slider_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HomeAppBar(),
                  SizedBox(height: 25.h),
                  BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (prv, current) =>
                        current is HomeSuccessState ||
                        current is HomeFailedState ||
                        current is HomeLoadingState,
                    builder: (context, state) {
                      if (state is HomeLoadingState) {
                        return Skeletonizer(
                          enabled: true,
                          child: Container(
                            height: 170.h,
                            width: double.infinity,
                            color: Colors.red,
                          ),
                        );
                      } else if (state is HomeSuccessState) {
                        return SliderBuilder(
                          items: List.generate(state.images.length, (index) {
                            return SliderItem(src: state.images[index]);
                          }),
                        );
                      } else if (state is HomeFailedState) {
                        return FailedStateWidget(
                          onTap: () {
                            context.read<HomeCubit>().getSliders();
                          },
                        );
                      } else {
                        return Text("oops there was an error 88".tr());
                      }
                    },
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Text(
                        "Best Seller".tr(),
                        style: AppTextStyle.text24Regular,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (prev, current) =>
                  current is BestSellerSuccessState ||
                  current is BestSellerFailedState ||
                  current is BestSellerLoadingState,
              builder: (context, state) {
                if (state is BestSellerLoadingState) {
                  return BestSellerBuilder(
                    books: [],
                    isLoading: true,
                    onTap: () {
                      context.read<HomeCubit>().getBestSellerData();
                    },
                    isFailed: false,
                  );
                } else if (state is BestSellerSuccessState) {
                  return BestSellerBuilder(
                    books: state.books,
                    isLoading: false,
                    onTap: () {
                      context.read<HomeCubit>().getBestSellerData();
                    },
                    isFailed: false,
                  );
                } else if (state is BestSellerFailedState) {
                  return BestSellerBuilder(
                    books: [],
                    isLoading: false,
                    onTap: () {
                      context.read<HomeCubit>().getBestSellerData();
                    },
                    isFailed: true,
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: Text("oops there was an error 88".tr()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

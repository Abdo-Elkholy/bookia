import 'package:bookia/features/home/cubit/home_cubit.dart';
import 'package:bookia/features/home/ui/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/best_seller_builder.dart';
import '../widgets/failed_state_widget.dart';
import '../widgets/slider_builder.dart';
import '../widgets/slider_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit();
        cubit.getSliders();
        cubit.getBestSellerData();

        return cubit;
      },
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
                    builder: (context, state) {
                      if (state is HomeLoadingState) {
                        return SizedBox(
                          height: 170.h,
                          child: Center(child: CircularProgressIndicator()),
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
                        return Text("oops there was an error 88");
                      }
                    },
                  ),
                ],
              ),
            ),
            BestSellerBuilder(),
          ],
        ),
      ),
    );
  }
}

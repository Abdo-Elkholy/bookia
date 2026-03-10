import 'package:bookia/features/home/cubit/home_cubit.dart';
import 'package:bookia/features/home/ui/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'failed_state_widget.dart';

class BestSellerBuilder extends StatelessWidget {
  const BestSellerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prv, current) =>
          current is BestSellerSuccessState ||
          current is BestSellerFailedState ||
          current is BestSellerLoadingState,
      builder: (context, state) {
        if (state is BestSellerLoadingState) {
          return SkeletonizerWidget();
        } else if (state is BestSellerSuccessState) {
          return SliverGrid.builder(
            itemCount: state.books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 268,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) =>
                BestSellerItem(book: state.books[index]),
          );
        } else if (state is BestSellerFailedState) {
          return SliverToBoxAdapter(
            child: FailedStateWidget(
              onTap: () {
                context.read<HomeCubit>().getBestSellerData();
              },
            ),
          );
        } else {
          return SkeletonizerWidget();
        }
      },
    );
  }
}

class SkeletonizerWidget extends StatelessWidget {
  const SkeletonizerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Skeletonizer(
        enabled: true,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 268,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => Container(
            height: 170.h,
            width: double.infinity,
            color: Colors.black12,
          ),
        ),
      ),
    );
  }
}

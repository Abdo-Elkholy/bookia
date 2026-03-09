import 'package:bookia/features/home/cubit/home_cubit.dart';
import 'package:bookia/features/home/ui/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'failed_state_widget.dart';

class BestSellerBuilder extends StatelessWidget {
  const BestSellerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        //context.read<HomeCubit>().getBestSellerData();
        if (state is BestSellerLoadingState) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 170.h,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
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
          return SliverToBoxAdapter(child: Text("oops there was an error 55"));
        }
      },
    );
  }
}

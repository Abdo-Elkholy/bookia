import 'package:bookia/features/home/data/models/product_model.dart';
import 'package:bookia/features/home/ui/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'failed_state_widget.dart';

class BestSellerBuilder extends StatelessWidget {
  final List<Product> books;
  final bool isLoading;
  final bool isFailed;
  final void Function()? onTap;

  const BestSellerBuilder({
    super.key,
    required this.books,
    required this.isLoading,
    this.onTap,
    required this.isFailed,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SkeletonizerWidget();
    } else if (!isLoading && books.isNotEmpty) {
      return SliverGrid.builder(
        itemCount: books.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 268,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => BestSellerItem(book: books[index]),
      );
    } else if (books.isEmpty && !isFailed) {
      return SliverToBoxAdapter(child: Center(child: Text("No Books Found")));
    } else if (isFailed) {
      return SliverToBoxAdapter(child: FailedStateWidget(onTap: onTap));
    } else {
      return SliverToBoxAdapter(child: Center(child: Text("error")));
    }
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

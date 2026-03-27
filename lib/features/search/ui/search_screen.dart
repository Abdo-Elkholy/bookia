import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/widgets/app_bar.dart';
import 'package:bookia/features/search/ui/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/ui/widgets/best_seller_builder.dart';
import '../cubit/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        backgroundColor: AppColors.appWhite,
        appBar: SubScreensAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              SearchBarWidget(controller: searchController),
              SizedBox(height: 20.h),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        if (state is SearchLoading) {
                          return BestSellerBuilder(
                            books: [],
                            isLoading: true,
                            isFailed: false,
                          );
                        } else if (state is SearchSuccess) {
                          return BestSellerBuilder(
                            books: state.books,
                            isLoading: false,
                            isFailed: false,
                          );
                        } else if (state is SearchError) {
                          return BestSellerBuilder(
                            books: [],
                            isLoading: false,
                            isFailed: true,
                          );
                        } else {
                          return SliverToBoxAdapter(child: Text(""));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

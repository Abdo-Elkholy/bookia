import 'package:bookia/features/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_text_style.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: (name) {
        context.read<SearchCubit>().search(name);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0x4DD9D9D9),

        prefixIcon: const Icon(Icons.search_rounded),
        hint: Text("Search Store", style: AppTextStyle.text14Regular),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}

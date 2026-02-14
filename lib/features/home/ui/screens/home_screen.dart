import 'package:bookia/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => HomeCubit(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      context.read<HomeCubit>().long,
                      (i) => GestureDetector(
                        onTap: () {
                          context.read<HomeCubit>().ontap(i);
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: context.read<HomeCubit>().check(i),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (prev, current) =>
                    current is IncrementState || current == DecrementState,
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<HomeCubit>().add();
                        },
                        icon: Icon(Icons.add),
                      ),

                      IconButton(
                        onPressed: () {
                          context.read<HomeCubit>().minas();
                        },
                        icon: Icon(Icons.minimize),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

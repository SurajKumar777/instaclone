import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/cubits/home_cubit/home_cubit.dart';
import 'package:instagram/presentation/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    if (index == 0)
                      const SizedBox(
                        width: 10,
                      ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        radius: 45,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial) {
                return Center(
                  child: CustomText(
                    text: "00:${state.count}",
                  ),
                );
              } else if (state is HomeSuccessState) {
                return InkWell(
                    onTap: () {
                      context.read<HomeCubit>().onInitialTimer();
                    },
                    child: Center(child: CustomText(text: "Resend")));
              } else {
                return const SizedBox();
              }
            },
          ),
        )
      ],
    );
  }
}

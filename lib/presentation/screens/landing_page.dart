import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/presentation/screens/home_screen.dart';
import 'package:instagram/presentation/screens/post_screen.dart';
import 'package:instagram/presentation/screens/profile_screen.dart';
import 'package:instagram/presentation/screens/reel_screen.dart';
import 'package:instagram/presentation/screens/search_screen.dart';

import '../../cubits/landing_cubit/landing_page_cubit.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const PostScreen(),
    const ReelScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingPageCubit, LandingPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: state.index == 0
              ? AppBar(
                  title: Image.asset(
                    "assets/images/Logo-Instagram.png",
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/notification");
                        },
                        icon: const Icon(
                          CupertinoIcons.heart,
                          color: Colors.black,
                        )),
                    const IconButton(
                        onPressed: null,
                        icon: Icon(
                          CupertinoIcons.paperplane,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                )
              : null,
          body: screens[state.index],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 0.1))),
            child: NavigationBar(
              indicatorColor: Colors.white,
              elevation: 0,
              onDestinationSelected: (int i) {
                context.read<LandingPageCubit>().onTabClicked(i);
              },
              selectedIndex: state.index,
              destinations: const <NavigationDestination>[
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  icon: Icon(
                    Icons.search_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.add_box,
                    size: 30,
                  ),
                  icon: Icon(
                    Icons.add_box_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.video_collection,
                    size: 30,
                  ),
                  icon: Icon(
                    Icons.video_collection_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  selectedIcon: CircleAvatar(
                    radius: 15,
                  ),
                  icon: CircleAvatar(
                    radius: 15,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

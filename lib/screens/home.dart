import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/post_screen.dart';
import 'package:instagram/screens/profile_screen.dart';
import 'package:instagram/screens/reel_screen.dart';
import 'package:instagram/screens/search_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const PostScreen(),
    const ReelScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/Logo-Instagram.png",
          width: MediaQuery.of(context).size.width * 0.3,
        ),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                CupertinoIcons.heart,
                color: Colors.black,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                CupertinoIcons.paperplane,
                color: Colors.black,
              )),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeBarIndex) {
            return screens[state.index];
          } else {
            return SizedBox();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeBarIndex) {
            return Container(
              decoration:
                  BoxDecoration(border: Border(top: BorderSide(width: 0.1))),
              child: NavigationBar(
                indicatorColor: Colors.white,
                elevation: 0,
                onDestinationSelected: (int i) {
                  context.read<HomeBloc>().add(HomeBarClickedEvent(i));
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
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

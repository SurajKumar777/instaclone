import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  List<Widget> screens = [Text("data1"), Text("data2"), Text("data3")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/Logo-Instagram.png",
          width: MediaQuery.of(context).size.width * 0.3,
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(
                CupertinoIcons.heart,
                color: Colors.black,
              )),
          SizedBox(
            width: 10,
          ),
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
      body: screens[0],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: null,
      ),
    );
  }
}

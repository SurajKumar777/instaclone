import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
            width: 15,
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
    );
  }
}

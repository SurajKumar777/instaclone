import 'dart:js';

import 'package:flutter/material.dart';
import 'package:instagram/screens/home.dart';
import 'package:instagram/screens/login.dart';
import 'package:instagram/screens/splash.dart';

class Routes {
  static Route? onGeneratedRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/splash":
        return MaterialPageRoute(builder: (context) => const Splash());
      case "/login":
        return MaterialPageRoute(builder: (context) => const Login());
      case "/home":
        return MaterialPageRoute(builder: (context) => Home());
      default:
        return null;
    }
  }
}

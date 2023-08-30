import 'package:flutter/material.dart';
import 'package:instagram/presentation/screens/landing_page.dart';
import 'package:instagram/presentation/screens/login.dart';
import 'package:instagram/presentation/screens/notification_screen.dart';
import 'package:instagram/presentation/screens/splash.dart';

class Routes {
  static Route? onGeneratedRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/splash":
        return MaterialPageRoute(builder: (context) => const Splash());
      case "/login":
        return MaterialPageRoute(builder: (context) => const Login());
      case "/home":
        return MaterialPageRoute(builder: (context) => LandingPage());
      case "/notification":
        return MaterialPageRoute(
            builder: (context) => const NotificationScreen());
      default:
        return null;
    }
  }
}

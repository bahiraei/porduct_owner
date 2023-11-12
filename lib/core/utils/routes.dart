import 'package:flutter/material.dart';

import '../../features/home/presentation/home_screen.dart';

class Routes {
  static final Routes _instance = Routes._internal();

  factory Routes() => _instance;

  Routes._internal();

  static const String splash = "/splash";
  static const String home = "/home";

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return screenRouting(const HomeScreen());

      default:
        return screenRouting(
          const Scaffold(
            body: Center(
              child: Text('404'),
            ),
          ),
        );
    }
  }

  MaterialPageRoute screenRouting(Widget screen) {
    return MaterialPageRoute(
      builder: (context) => screen,
    );
  }
}

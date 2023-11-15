import 'package:flutter/material.dart';
import 'package:porduct_owner/features/auth/login_screen.dart';
import 'package:porduct_owner/features/auth/verify_screen.dart';
import 'package:porduct_owner/features/ships/ships_screen.dart';
import 'package:porduct_owner/features/splash/presentation/splash_screen.dart';

import '../../features/home/presentation/home_screen.dart';

class Routes {
  static final Routes _instance = Routes._internal();

  factory Routes() => _instance;

  Routes._internal();

  static const String splash = "/splash";
  static const String home = "/home";
  static const String login = "/login";
  static const String verify = "/verify";
  static const String ships = "/ships";

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return screenRouting(const SplashScreen());

      case home:
        return screenRouting(const HomeScreen());

      case login:
        return screenRouting(const LoginScreen());

      case verify:
        return screenRouting(const VerifyScreen());

      case ships:
        return screenRouting(const ShipsScreen());

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

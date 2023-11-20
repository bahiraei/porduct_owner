import 'package:flutter/material.dart';
import 'package:porduct_owner/features/account_type/account_type_screen.dart';
import 'package:porduct_owner/features/auth/login_screen.dart';
import 'package:porduct_owner/features/auth/verify_screen.dart';
import 'package:porduct_owner/features/news/news_screen.dart';
import 'package:porduct_owner/features/notifications/notification_screen.dart';
import 'package:porduct_owner/features/overview/overview_screen.dart';
import 'package:porduct_owner/features/ships/ships_screen.dart';
import 'package:porduct_owner/features/splash/presentation/splash_screen.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/services/services_screen.dart';
import '../../features/ship/ship_screen.dart';

class Routes {
  static final Routes _instance = Routes._internal();

  factory Routes() => _instance;

  Routes._internal();

  static const String splash = "/splash";
  static const String home = "/home";
  static const String login = "/login";
  static const String verify = "/verify";
  static const String ships = "/ships";
  static const String ship = "/ship";
  static const String notifications = "/notifications";
  static const String overview = "/overview";
  static const String services = "/services";
  static const String accountType = "/accountType";
  static const String news = "/news";

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

      case ship:
        return screenRouting(const ShipScreen());

      case notifications:
        return screenRouting(const NotificationsScreen());

      case overview:
        return screenRouting(const OverviewScreen());

      case services:
        return screenRouting(const ServicesScreen());

      case accountType:
        return screenRouting(const AccountTypeScreen());

      case news:
        return screenRouting(
          const NewsScreen(),
        );

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

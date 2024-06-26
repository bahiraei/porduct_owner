import 'package:flutter/material.dart';
import 'package:porduct_owner/features/account_type/account_type_screen.dart';
import 'package:porduct_owner/features/auth/presentation/verify_screen.dart';
import 'package:porduct_owner/features/home_page/home_page_screen.dart';
import 'package:porduct_owner/features/news/news_screen.dart';
import 'package:porduct_owner/features/notifications/notification_screen.dart';
import 'package:porduct_owner/features/overview/overview_screen.dart';
import 'package:porduct_owner/features/services/presentation/unload_services_screen.dart';
import 'package:porduct_owner/features/ship/ship_time_sheet_screen.dart';
import 'package:porduct_owner/features/ships/ships_screen.dart';
import 'package:porduct_owner/features/splash/presentation/splash_screen.dart';
import 'package:porduct_owner/features/vessels/vessels_screen.dart';

import '../../features/auth/presentation/auth_with_pass.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/pdf/pdf_screen.dart';
import '../../features/secondary_pdf/secondary_pdf_screen.dart';
import '../../features/services/data/model/allocation_equ.dart';
import '../../features/services/presentation/add_unload_request_screen.dart';
import '../../features/services/presentation/services_screen.dart';
import '../../features/services/presentation/unload_service_details_screen.dart';
import '../../features/ship/ship_screen.dart';

class Routes {
  static final Routes _instance = Routes._internal();

  factory Routes() => _instance;

  Routes._internal();

  static const String splash = "/splash";
  static const String home = "/home";

  static const String home2 = "/home2";
  static const String login = "/login";
  static const String verify = "/verify";

  static const String loginWithSms = "/loginWithSms";

  static const String billDetails = "/billDetail";

  static const String bill = "/bill";
  static const String ships = "/ships";
  static const String ship = "/ship";
  static const String shipTimeSheet = "/shipTimeSheet";
  static const String notifications = "/notifications";
  static const String overview = "/overview";

  static const String accountType = "/accountType";
  static const String news = "/news";

  static const String pdf = "/pdf";
  static const String secondaryPDF = "/secondaryPDF";
  static const String vessels = "/vessels";

  static const String services = "/services";

  static const String unloadServices = "/unloadServices";

  static const String addUnloadRequest = "/addUnloadRequest";

  static const String unloadServiceDetails = "/UnloadServiceDetailsScreen";

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return screenRouting(const SplashScreen());

      case home:
        return screenRouting(const HomeScreen());

      case home2:
        return screenRouting(const HomePageScreen());

      case login:
        return screenRouting(const LoginScreen());

      case verify:
        return screenRouting(const VerifyScreen());

      case loginWithSms:
        return screenRouting(const AuthWithPassScreen());

      case ships:
        return screenRouting(const ShipsScreen());

      case ship:
        return screenRouting(const ShipScreen());

      case shipTimeSheet:
        return screenRouting(const ShipTimeSheetScreen());

      case notifications:
        return screenRouting(const NotificationsScreen());

      case overview:
        return screenRouting(const OverviewScreen());

      case services:
        return screenRouting(const ServicesScreen());

      case accountType:
        return screenRouting(const AccountTypeScreen());

      case pdf:
        return screenRouting(
          PdfScreen(
            params: settings.arguments as PdfScreenParams,
          ),
        );

      case secondaryPDF:
        return screenRouting(
          SecondaryPdfScreen(
            params: settings.arguments as SecondaryPdfScreenParams,
          ),
        );

      case news:
        return screenRouting(
          const NewsScreen(),
        );

      case vessels:
        return screenRouting(
          const VesselsScreen(),
        );

      case services:
        return screenRouting(
          const ServicesScreen(),
        );

      case unloadServices:
        return screenRouting(
          UnloadServicesPageScreen(
            screenParam: settings.arguments as UnloadServicesScreenParam,
          ),
        );

      case addUnloadRequest:
        return screenRouting(
          AddUnloadRequestScreen(
            screenParam: settings.arguments as AddUnloadRequestScreenParam,
          ),
        );

      case unloadServiceDetails:
        return screenRouting(
          UnloadServiceDetailsScreen(
            allocationEquModel: settings.arguments as AllocationEquModel,
          ),
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

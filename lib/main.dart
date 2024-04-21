import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:porduct_owner/features/splash/presentation/splash_screen.dart';

import 'core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final route = Routes();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'صاحبان کالا',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      scrollBehavior: MyScrollBehavior(),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fa', 'IR'),
      ],
      locale: const Locale('fa', 'IR'),
      theme: ThemeData(
        fontFamily: 'IranSans',
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue,
        disabledColor: Colors.blue.withOpacity(0.2),
        dividerColor: Colors.black87,
        useMaterial3: false,
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.blue,
          contentTextStyle: TextStyle(
            fontFamily: 'IranSans',
            color: Colors.white,
          ),
        ),
      ),
      onGenerateRoute: route.generateRoute,
      home: const SplashScreen(),
    );
  }
}

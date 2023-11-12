import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:porduct_owner/features/home/presentation/home_screen.dart';

import 'core/core.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'IranSans',
      ),
      onGenerateRoute: route.generateRoute,
      home: const HomeScreen(),
    );
  }
}

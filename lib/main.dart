import 'package:flutter/material.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: route.generateRoute,
      home: const HomeScreen(),
    );
  }
}

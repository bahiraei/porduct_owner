import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:porduct_owner/features/home_page/pages/monitoring_page.dart';
import 'package:porduct_owner/features/home_page/pages/port_page.dart';
import 'package:porduct_owner/features/home_page/pages/sea_page.dart';

import 'widget/app_bar.dart';
import 'widget/bottom_bar.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final tabIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: CustomAppBar(
          drawerTap: () => scaffoldKey.currentState?.openDrawer(),
          tabIndexNotifier: tabIndexNotifier,
        ),
      ),
      body: Column(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: tabIndexNotifier,
            builder: (context, index, _) {
              switch (tabIndexNotifier.value) {
                case 0:
                  return const SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SeaPage(),
                      ],
                    ),
                  );
                case 1:
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PortPage(),
                      SizedBox(
                        width: double.infinity,
                      ),
                    ],
                  );
                case 2:
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MonitoringPage(),
                      SizedBox(
                        width: double.infinity,
                      ),
                    ],
                  );
                default:
                  return const SizedBox();
              }
            },
          )
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        tabIndexNotifier: tabIndexNotifier,
      ),
    );
  }
}

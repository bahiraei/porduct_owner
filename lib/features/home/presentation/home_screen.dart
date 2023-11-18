import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:porduct_owner/features/home/presentation/view/home_page.dart';
import 'package:porduct_owner/features/home/presentation/view/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            /*gap: 32,*/
            activeColor: Colors.black,
            iconSize: 24,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            padding: const EdgeInsets.symmetric(horizontal: 49, vertical: 20),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'خانه',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'پروفایل',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  _getBody() {
    switch (_selectedIndex) {
      case 0:
        return const HomePageView();
      case 1:
        return const ProfilePageView();
    }
  }
}

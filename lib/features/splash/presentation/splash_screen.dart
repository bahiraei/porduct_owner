import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/widgets/custom_button.dart';

import '../../../core/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Blurred Overlay
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ), // Adjust the blur intensity
              child: Container(
                color: Colors.black.withOpacity(
                  0.4,
                ), // Adjust the opacity as needed
              ),
            ),
          ),

          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    32,
                    MediaQuery.of(context).size.height * 0.4,
                    32,
                    0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/splash/splashTitle.png',
                          ),
                          const Gap(8),
                          const Text(
                            'اپلیکیشن صاحبان کالا',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(48, 48, 48, 64),
                child: CustomButton(
                  borderRadius: 23,
                  backgroundColor: Colors.white,
                  showShadow: false,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.login,
                    );
                  },
                  child: const Text('ورود'),
                )
                    .animate(delay: 2000.ms)
                    .slideY(
                      duration: 1000.ms,
                      begin: 10,
                      end: 0,
                    )
                    .fadeIn()
                    .callback(
                      callback: (_) => print('scale is done'),
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

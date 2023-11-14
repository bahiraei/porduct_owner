import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/utils/routes.dart';
import '../../core/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _fadeController;
  late Animation<double> _heightAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _heightAnimation = Tween<double>(
      begin: 300.0,
      end: 300.0,
    ).animate(
      _animationController,
    );

    _fadeAnimation = Tween<double>(
      begin: 5.0,
      end: 0.0,
    ).animate(
      _fadeController,
    );

    /*_animationController.forward();
    _fadeController.forward();*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedBuilder(
                  animation: _heightAnimation,
                  builder: (BuildContext context, Widget? child) {
                    return SizedBox(
                      width: double.infinity,
                      height: _heightAnimation.value,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/background.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff406CB1),
                              Color(0xff203659),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          'assets/images/splash/splashTitle.png',
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 64, 32, 0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'کدملی',
                        style: TextStyle(
                          color: Color(0xff20437B),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Gap(18),
                  TextFormField(
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      alignLabelWithHint: true,
                      fillColor: const Color(0xffECECEC),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const Gap(64),
                  CustomButton(
                    height: 54,
                    borderRadius: 12,
                    backgroundColor: const Color(0xff406CB1),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.verify,
                      );
                    },
                    child: const Text(
                      'ورود',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(32),
          ],
        ),
      ),
    );
  }
}

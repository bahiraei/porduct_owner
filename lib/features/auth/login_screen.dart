import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/utils/routes.dart';
import '../../core/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(119),
                  ),
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/background.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
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

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../core/utils/routes.dart';
import '../../core/widgets/custom_button.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final textPinNode = FocusNode();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    margin: const EdgeInsets.symmetric(horizontal: 5),
    textStyle: const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    decoration: BoxDecoration(
      color: const Color(0xffECECEC),
      border: Border.all(
        color: Colors.black38,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(9),
    ),
  );

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'کد چهار رقمی ارسال شده را وارد کنید',
                        style: TextStyle(
                          color: Color(0xff20437B),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Gap(32),
                  Align(
                    alignment: Alignment.center,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsRetrieverApi,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: BoxDecoration(
                            color: const Color(0xff406CB1).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                              color: const Color(0xff406CB1),
                              width: 1,
                            ),
                          ),
                        ),
                        defaultPinTheme: defaultPinTheme,
                        focusNode: textPinNode,
                      ).animate().fade().scale(
                            delay: 100.ms,
                            duration: 500.ms,
                          ),
                    ),
                  ),
                  const Gap(64),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: CustomButton(
                      height: 54,
                      borderRadius: 12,
                      showShadow: false,
                      backgroundColor: const Color(0xff406CB1),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.home,
                        );
                      },
                      child: const Text(
                        'تایید',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const Gap(24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ارسال مجدد کد',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Gap(16),
                      Text(
                        '01:48',
                        style: TextStyle(
                          color: Color(0xff406CB1),
                          fontSize: 16,
                        ),
                      ),
                    ],
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

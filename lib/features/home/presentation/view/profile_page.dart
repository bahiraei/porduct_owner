import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/widgets/custom_button.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe3e3e3),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                padding: EdgeInsets.fromLTRB(
                  24,
                  MediaQuery.of(context).viewPadding.top + 24,
                  24,
                  32,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xff001E4D),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(74),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/profile/header.png',
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'پروفایل کاربری',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 86,
                            height: 86,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: const Color(0xff556080),
                                width: 1,
                              ),
                            ),
                            child: Image.asset(
                              'assets/images/profile/profile.png',
                              fit: BoxFit.cover,
                            ),
                          ).animate().scale(duration: 500.ms),
                          const Gap(6),
                          const Text(
                            'محمد جواد بحیرایی',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ).animate().scale(
                                delay: 400.ms,
                                duration: 500.ms,
                              ),
                          const Gap(6),
                          Text(
                            'نماینده',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ).animate().scale(
                                delay: 800.ms,
                                duration: 500.ms,
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 64,
                  right: 64,
                  top: -30,
                  bottom: 0,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('کد ملی'),
                                    Text('0022433449'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('جنسیت'),
                                    Text('مرد'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('تاریخ تولد'),
                                    Text('1378/04/19'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('شرکت'),
                                    Text('صنایع غذایی کوروش'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('شماره تماس'),
                                    Text('09039060355'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Gap(32),
                      CustomButton(
                        height: 50,
                        backgroundColor: Colors.red,
                        showShadow: false,
                        onPressed: () {},
                        child: const Text(
                          'خروج از حساب',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Gap(24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

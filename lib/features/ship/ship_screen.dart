import 'package:circular_charts/circular_charts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/widgets/widgets.dart';

import '../../core/utils/routes.dart';

class ShipScreen extends StatelessWidget {
  const ShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Gap(MediaQuery.of(context).viewPadding.top + 8),
                Row(
                  children: [
                    const Gap(8),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'پاناما - بندرانزلی',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                  ],
                ),
                const Gap(24),
              ],
            ),
            Column(
              children: [
                Stack(
                  children: [
                    CircularChart(
                      isShowingCentreCircle: false,
                      centreCircleTitle: 'کالاها',
                      centreCircleSubtitleTextStyle: const TextStyle(
                        fontFamily: 'IranSans',
                        color: Colors.black,
                      ),
                      centreCirclePercentageTextStyle: const TextStyle(
                        fontFamily: 'IranSans',
                        color: Colors.black,
                      ),
                      overAllPercentage: 100,
                      animationTime: 800,
                      chartHeight: 300,
                      chartWidth: size.width,
                      pieChartChildNames: const [
                        "ذرت",
                        "گندم",
                        "جو",
                      ],
                      pieChartEndColors: const [
                        Color(0xfffc7e00),
                        Color(0xfffc6076),
                        Color(0xff007ced),
                        Color(0xff4e9b01),
                        Color(0xff009efd),
                        Color(0xffff4b63),
                      ],
                      pieChartStartColors: const [
                        Color(0xffffd200),
                        Color(0xffff9231),
                        Color(0xff00beeb),
                        Color(0xff92d108),
                        Color(0xff00dbbe),
                        Color(0xfff280ff),
                      ],
                      pieChartPercentages: const [
                        60,
                        20,
                        20,
                      ],
                      isShowingLegend: true,
                    ),
                    const Positioned(
                      left: 0,
                      right: 0,
                      bottom: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'نمودار تفکیک کالا',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  margin: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3,
                      )
                    ],
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'صاحب کالا',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'سید حسین حسینی',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(5),
                      Divider(
                        color: Colors.black12,
                      ),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'دسته بندی کالا',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'فله',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Gap(5),
                      Divider(
                        color: Colors.black12,
                      ),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'نام کالا',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'ذرت',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Gap(5),
                      Divider(
                        color: Colors.black12,
                      ),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'سرویس های کل',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '256',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Gap(5),
                      Divider(
                        color: Colors.black12,
                      ),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'تاریخ شروع عملیات',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '1402/08/01',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Gap(5),
                      Divider(
                        color: Colors.black12,
                      ),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'شرکت تجهیزاتی',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'شرکت آریا بنادر ایرانیان',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(5),
                      Divider(
                        color: Colors.black12,
                      ),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'شرکت انبارداری',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'شرکت آریا بنادر ایرانیان',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(5),
                      Divider(
                        color: Colors.black12,
                      ),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'شرکت حمل و نقل',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'شرکت آریا بنادر ایرانیان',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                  child: CustomButton(
                    height: 54,
                    showShadow: false,
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.services);
                    },
                    child: const Text(
                      'سرویس های انجام شده',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

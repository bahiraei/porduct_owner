import 'package:circular_charts/circular_charts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  String selectedBandar = 'انزلی';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
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
                            'نمای کلی',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(32),
                  ],
                ),
                const Gap(16),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    24,
                    0,
                    24,
                    24,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField2<String>(
                              style: theme.textTheme.titleSmall,
                              isExpanded: true,
                              decoration: InputDecoration(
                                // Add Horizontal padding using menuItemStyleData.padding so it matches
                                // the menu padding when button's width is not specified.
                                contentPadding:
                                    const EdgeInsets.fromLTRB(8, 4, 0, 0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // Add more decoration..
                              ),
                              hint: const Text(
                                'انتخاب بندر',
                              ),
                              items: ['انزلی', 'بندر عباس']
                                  .map((bandar) => DropdownMenuItem<String>(
                                        alignment: Alignment.centerRight,
                                        value: bandar,
                                        child: Text(
                                          bandar.toString(),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'لطفا یک بندر را انتخاب کنید';
                                }
                                return null;
                              },
                              onChanged: (bandar) {
                                setState(() {
                                  selectedBandar = bandar!;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              value: selectedBandar,
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 24,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                direction: DropdownDirection.textDirection,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
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
                            'آمار به تفکیک کالا',
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
                        "انزلی",
                        "امام",
                        "رجایی",
                        "بندرعباس",
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
                        30,
                        20,
                        20,
                        30,
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
                            'آمار به تفکیک بنادر',
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
                const Gap(32),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

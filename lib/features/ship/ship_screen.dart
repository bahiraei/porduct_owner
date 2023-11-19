import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/widgets/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/utils/routes.dart';

class ShipScreen extends StatelessWidget {
  const ShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<_PieData> pieData = [];

    pieData.add(
      _PieData('انجام شده', 60, '60 درصد'),
    );
    pieData.add(
      _PieData('باقی مانده', 40, '40 درصد'),
    );

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
                          SelectableText(
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
                SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: SfCircularChart(
                            margin: const EdgeInsets.all(0),
                            legend: const Legend(
                              isVisible: true,
                              isResponsive: true,
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            palette: const [
                              Colors.blue,
                              Colors.amber,
                            ],
                            series: <PieSeries<_PieData, String>>[
                              PieSeries<_PieData, String>(
                                explode: true,
                                explodeIndex: 0,
                                explodeOffset: '10%',
                                dataSource: pieData,
                                xValueMapper: (_PieData data, _) => data.xData,
                                yValueMapper: (_PieData data, _) => data.yData,
                                dataLabelMapper: (_PieData data, _) =>
                                    data.text,
                                dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                          SelectableText(
                            'صاحب کالا',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: SelectableText(
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
                          SelectableText(
                            'دسته بندی کالا',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SelectableText(
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
                          SelectableText(
                            'نام کالا',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SelectableText(
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
                          SelectableText(
                            'سرویس های کل',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SelectableText(
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
                          SelectableText(
                            'تاریخ شروع عملیات',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SelectableText(
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
                          SelectableText(
                            'شرکت تجهیزاتی',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: SelectableText(
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
                          SelectableText(
                            'شرکت انبارداری',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: SelectableText(
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
                          SelectableText(
                            'شرکت حمل و نقل',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: SelectableText(
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
                    child: const SelectableText(
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

class _PieData {
  _PieData(this.xData, this.yData, [this.text = '-']);

  final String xData;
  final num yData;
  final String text;
}

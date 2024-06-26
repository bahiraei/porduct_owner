import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/widgets/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/utils/routes.dart';

class ShipScreen extends StatefulWidget {
  const ShipScreen({super.key});

  @override
  State<ShipScreen> createState() => _ShipScreenState();
}

class _ShipScreenState extends State<ShipScreen> {
  String isChartPerPercent = 'درصد';

  @override
  Widget build(BuildContext context) {
    List<_PieData> pieData = [];

    List<_PieData> pieDataTonnage = [];

    pieData.add(
      _PieData('انجام شده', 60, '60%'),
    );
    pieData.add(
      _PieData('باقی مانده', 40, '40%'),
    );

    pieDataTonnage.add(
      _PieData('انجام شده', 5000, '5000'),
    );
    pieDataTonnage.add(
      _PieData('باقی مانده', 1200, '1200'),
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
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: DropdownButtonFormField2<String>(
                          style: Theme.of(context).textTheme.titleSmall,
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
                            'نوع گزارش',
                          ),
                          items: ['درصد', 'تناژ']
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
                              return 'لطفا واحد را انتخاب کنید';
                            }
                            return null;
                          },
                          onChanged: (bandar) {
                            setState(() {
                              isChartPerPercent = bandar!;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          value: isChartPerPercent,
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
                    ),
                  ],
                ),
                Visibility(
                  visible: isChartPerPercent == 'درصد',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SfCircularChart(
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
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isChartPerPercent != 'درصد',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SfCircularChart(
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
                                dataSource: pieDataTonnage,
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
                        ],
                      ),
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
                          Text(
                            'تناژ کل',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '6200',
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 32),
                  child: ExpansionTileCard(
                    baseColor: Colors.white,
                    shadowColor: Colors.black,
                    expandedColor: Colors.white,
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.inventory,
                        size: 18,
                      ),
                    ),
                    title: Text('محوطه ها و انبار ها'),
                    subtitle: Text(
                      'انبار ها و محوطه های تخصیص داده شده',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    elevation: 2.0,
                    initiallyExpanded: true,
                    children: <Widget>[
                      /*Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),*/
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 16,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('انبار شماره یک'),
                              ],
                            )
                          ],
                        ),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                  child: CustomButton(
                    height: 54,
                    showShadow: false,
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.shipTimeSheet);
                    },
                    child: const Text(
                      'تایم شیت',
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

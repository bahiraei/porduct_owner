import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/consts/constans.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  String selectedBandar = 'انزلی';

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {},
                        child: Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: Constants.shadow,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warehouse,
                                color: Colors.grey,
                                size: 34,
                              ),
                              Gap(8),
                              Text('انبار شماره یک'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {},
                        child: Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: Constants.shadow,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warehouse,
                                color: Colors.grey,
                                size: 34,
                              ),
                              Gap(8),
                              Text('انبار شماره دو'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {},
                        child: Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: Constants.shadow,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warehouse,
                                color: Colors.grey,
                                size: 34,
                              ),
                              Gap(8),
                              Text('انبار شماره سه'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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

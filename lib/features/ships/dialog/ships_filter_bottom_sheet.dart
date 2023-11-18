import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class ShipsFilterBottomSheet extends StatefulWidget {
  const ShipsFilterBottomSheet({super.key});

  @override
  State<ShipsFilterBottomSheet> createState() => _ShipsFilterBottomSheetState();
}

class _ShipsFilterBottomSheetState extends State<ShipsFilterBottomSheet> {
  String selectedBandar = 'انزلی';
  String selectedOperationStatus = 'درحال انجام';
  JalaliRange? selectedDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FractionallySizedBox(
      heightFactor: 0.7,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 24),
                          Container(
                            height: 4,
                            width: 32,
                            decoration: BoxDecoration(
                              color: const Color(0xffdcdcdc),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          16,
                          16,
                          16,
                          20,
                        ),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'نام بندر :',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(16),
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
                                        .map((bandar) =>
                                            DropdownMenuItem<String>(
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
                                      direction:
                                          DropdownDirection.textDirection,
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          16,
                          0,
                          16,
                          20,
                        ),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'وضعیت عملیات :',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(16),
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
                                      'وضعیت عملیات',
                                    ),
                                    items: [
                                      'درحال انجام',
                                      'متوقف شده',
                                      'تکمیل شده'
                                    ]
                                        .map((status) =>
                                            DropdownMenuItem<String>(
                                              alignment: Alignment.centerRight,
                                              value: status,
                                              child: Text(
                                                status.toString(),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'لطفا یک وضعیت را انتخاب کنید';
                                      }
                                      return null;
                                    },
                                    onChanged: (status) {
                                      setState(() {
                                        selectedOperationStatus = status!;
                                      });
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      padding: EdgeInsets.only(right: 8),
                                    ),
                                    value: selectedOperationStatus,
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
                                      direction:
                                          DropdownDirection.textDirection,
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          16,
                          0,
                          16,
                          20,
                        ),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'بازه عملیات:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(16),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    var picked =
                                        await showPersianDateRangePicker(
                                      context: context,
                                      initialEntryMode:
                                          PDatePickerEntryMode.input,
                                      initialDateRange: JalaliRange(
                                        start: DateTime.now()
                                            .subtract(const Duration(days: 10))
                                            .toJalali(),
                                        end: DateTime.now()
                                            .subtract(const Duration(days: 5))
                                            .toJalali(),
                                      ),
                                      firstDate: Jalali(1385, 8),
                                      lastDate: DateTime.now().toJalali(),
                                    );
                                    setState(() {
                                      selectedDate = picked;
                                    });
                                  },
                                  child: const Text('انتخاب تاریخ'),
                                ),
                                const Gap(8),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      selectedDate != null
                                          ? "${selectedDate?.start.formatCompactDate()} الی ${selectedDate?.end.formatCompactDate()}"
                                          : 'انتخاب نشده',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(24),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfffe5722),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0.3,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'اعمال فیلتر',
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
        ),
      ),
    );
  }
}

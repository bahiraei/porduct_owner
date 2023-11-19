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

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          16 + MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
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
                                items: ['درحال انجام', 'تکمیل شده']
                                    .map((status) => DropdownMenuItem<String>(
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
                                  direction: DropdownDirection.textDirection,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
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
                            Expanded(
                              child: SizedBox(
                                height: 44,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    hintText: 'از تاریخ',
                                    hintStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 12,
                                    ),
                                    alignLabelWithHint: true,
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    Jalali? picked =
                                        await showPersianDatePicker(
                                      context: context,
                                      initialDate: Jalali.now(),
                                      firstDate: Jalali(1400, 8),
                                      lastDate: Jalali(1450, 9),
                                    );

                                    if (picked != null) {
                                      startDateController.text =
                                          picked.formatCompactDate();
                                    }
                                  },
                                  onTapOutside: (event) =>
                                      FocusScope.of(context).unfocus(),
                                  textAlign: TextAlign.center,
                                  controller: startDateController,
                                ),
                              ),
                            ),
                            const Gap(16),
                            Expanded(
                              child: SizedBox(
                                height: 44,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    hintText: 'تا تاریخ',
                                    hintStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 12,
                                    ),
                                    alignLabelWithHint: true,
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    Jalali? picked =
                                        await showPersianDatePicker(
                                      context: context,
                                      initialDate: Jalali.now(),
                                      firstDate: Jalali(1400, 8),
                                      lastDate: Jalali(1450, 9),
                                    );

                                    if (picked != null) {
                                      endDateController.text =
                                          picked.formatCompactDate();
                                    }
                                  },
                                  onTapOutside: (event) =>
                                      FocusScope.of(context).unfocus(),
                                  textAlign: TextAlign.center,
                                  controller: endDateController,
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
    );
  }
}

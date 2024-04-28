import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../core/consts/app_colors.dart';
import '../../core/utils/helper.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/custom_text_form_field.dart';

class AddUnloadRequestScreen extends StatefulWidget {
  const AddUnloadRequestScreen({super.key});

  @override
  State<AddUnloadRequestScreen> createState() => _AddUnloadRequestScreenState();
}

class _AddUnloadRequestScreenState extends State<AddUnloadRequestScreen> {
  final descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<ItemModel> items = [
    ItemModel(
      text: 'خدمت شماره یک',
      isChecked: false,
    ),
    ItemModel(
      text: 'خدمت شماره دو',
      isChecked: false,
    ),
    ItemModel(
      text: 'خدمت شماره سه',
      isChecked: false,
    ),
    ItemModel(
      text: 'خدمت شماره سه',
      isChecked: false,
    ),
  ];

  Jalali? toDate;

  final fromDateController = TextEditingController();

  String? selectedValue;
  final List shipType = ['فله', 'کانتینری'];

  List<PlatformFile> files = [];

  @override
  Widget build(BuildContext context) {
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
                            'درخواست تخلیه جدید',
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                24,
                6,
                24,
                24,
              ),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Text(
                                'نوع خدمات:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return CustomCheckBoxListItem(
                        item: items[index - 1],
                        onCheckboxChanged: (isChecked) {
                          setState(() {
                            items[index - 1].isChecked = isChecked;
                          });
                        },
                      );
                    },
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'نوع کشتی',
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: DropdownButtonFormField2<String>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                                      // the menu padding when button's width is not specified.
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      // Add more decoration..
                                    ),
                                    hint: const Text(
                                      'انتخاب بندر',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    items: shipType
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'لطفا نوع کشتی را انتخاب کنید';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      selectedValue = value.toString();

                                      setState(() {});
                                    },
                                    onSaved: (value) {
                                      selectedValue = value.toString();
                                      setState(() {});
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      padding: EdgeInsets.only(right: 8),
                                    ),
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
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                    ),
                                    value: selectedValue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          'تاریخ ورود کشتی',
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          margin: const EdgeInsets.only(right: 16),
                          child: TextField(
                            textAlign: TextAlign.center,
                            readOnly: true,
                            onTap: () async {
                              Jalali? picked = await showPersianDatePicker(
                                context: context,
                                initialDate: Jalali.now(),
                                firstDate: Jalali(1400, 1),
                                lastDate: Jalali(1500, 1),
                              );
                              if (picked != null) {
                                toDate = picked;

                                fromDateController.text =
                                    picked.formatCompactDate();

                                setState(() {});
                              } else {
                                toDate = null;
                                fromDateController.text = '';
                                setState(() {});
                              }
                            },
                            controller: fromDateController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'انتخاب تاریخ',
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),
                  DottedBorder(
                    color: Colors.black38,
                    strokeWidth: 1,
                    radius: const Radius.circular(32),
                    borderType: BorderType.RRect,
                    dashPattern: const [12, 4, 12, 4],
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'آپلود فایل ضمیمه',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              const Gap(12),
                              OutlinedButton(
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    allowMultiple: true,
                                    type: FileType.custom,
                                    allowCompression: true,
                                    allowedExtensions: [
                                      'pdf',
                                      'png',
                                      'zip',
                                      'rar',
                                      'jpg',
                                      'jpeg',
                                      'doc',
                                      'docx',
                                      'rtf',
                                      'xls',
                                      'xlsx',
                                      'pptx',
                                      'ppt',
                                      'txt',
                                    ],
                                  );

                                  if (result != null) {
                                    for (PlatformFile file in result.files) {
                                      if (file.size <= 4 * 1024 * 1024) {
                                        // 4 MB in bytes
                                        files.add(file);
                                      } else {
                                        if (mounted) {
                                          Helper.showToast(
                                            title: 'پیام!',
                                            description:
                                                "حجم فایل انتخابی باید کمتر از 4 مگابایت باشد",
                                            context: context,
                                          );
                                        }
                                      }
                                    }
                                    setState(() {});
                                    // دستکاری و استفاده از فایل‌های انتخاب شده در اینجا
                                  }
                                },
                                child: const Text(
                                  'انتخاب فایل',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (files.isNotEmpty) const Gap(24),
                  if (files.isNotEmpty)
                    Container(
                      height: 68,
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        8,
                        16,
                        8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: AppColor.shadow,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff0090FF),
                            ),
                            child: const Icon(
                              Icons.file_present_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                files.first.name,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff0090FF),
                                  fontSize: 13,
                                ),
                                maxLines: 1,
                                textDirection: TextDirection.ltr,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          InkWell(
                            onTap: () {
                              files.removeAt(0);
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.delete,
                              size: 22,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const Gap(24),
                  CustomTextFormField(
                    controller: descriptionController,
                    label: const Text(
                      'توضیحات',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    hintText: 'توضیحات را وارد کنید',
                    maxLines: 4,
                    showClearButton: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    hintStyle: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const Gap(24),
                  AppButton(
                    text: 'ثبت درخواست',
                    isLoading: false,
                    onClick: () {},
                    height: 54,
                  ),
                  const Gap(48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemModel {
  final String text;
  bool isChecked;

  ItemModel({
    required this.text,
    this.isChecked = false,
  });
}

class CustomCheckBoxListItem extends StatelessWidget {
  final ItemModel item;
  final Function(bool) onCheckboxChanged;

  const CustomCheckBoxListItem({
    super.key,
    required this.item,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCheckboxChanged(!item.isChecked);
      },
      child: Row(
        children: [
          Checkbox(
            value: item.isChecked,
            onChanged: (value) {
              onCheckboxChanged(!item.isChecked);
            },
          ),
          Text(item.text),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

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

  final MultiSelectController<ValueItem<int>> _controller =
      MultiSelectController();

  final List<ValueItem> _selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  MultiSelectDropDown(
                    controller: _controller,
                    clearIcon: const Icon(Icons.reddit),
                    onOptionSelected: (options) {},
                    options: const [
                      ValueItem(label: 'Option 1', value: 1),
                      ValueItem(label: 'Option 2', value: 2),
                    ],
                    maxItems: 4,
                    singleSelectItemStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    chipConfig: const ChipConfig(
                        wrapType: WrapType.wrap, backgroundColor: Colors.red),
                    optionTextStyle: const TextStyle(fontSize: 16),
                    selectedOptionIcon: const Icon(
                      Icons.check_circle,
                      color: Colors.pink,
                    ),
                    selectedOptionBackgroundColor: Colors.grey.shade300,
                    selectedOptionTextColor: Colors.blue,
                    dropdownMargin: 2,
                    onOptionRemoved: (index, option) {},
                    optionBuilder: (context, valueItem, isSelected) {
                      return ListTile(
                        title: Text(valueItem.label),
                        subtitle: Text(valueItem.value.toString()),
                        trailing: isSelected
                            ? const Icon(Icons.check_circle)
                            : const Icon(Icons.radio_button_unchecked),
                      );
                    },
                  ),
                  const Gap(16),
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
          ),
        ],
      ),
    );
  }
}

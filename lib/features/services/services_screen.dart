import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/consts/app_colors.dart';

import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../core/utils/routes.dart';
import '../home_page/widget/home_items.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  String selectedPort = "انزلی";

  TextEditingController shipController = TextEditingController();

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
                          'درخواست خدمات',
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    children: [
                      Expanded(
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
                            'انتخاب بندر',
                          ),
                          items: ['انزلی', 'امام خمینی']
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
                              selectedPort = bandar!;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          value: selectedPort,
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
                      const Gap(8),
                      Expanded(
                        child: TextFormField(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ShipSearchDialog();
                              },
                            );
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignLabelWithHint: true,
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: 'انتخاب کشتی',
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 0,
                            ),
                          ),
                          readOnly: true,
                          controller: shipController,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ResponsiveGridList(
                    horizontalGridMargin: 12,
                    verticalGridMargin: 24,
                    listViewBuilderOptions: ListViewBuilderOptions(
                      shrinkWrap: true,
                    ),
                    minItemWidth: 80,
                    rowMainAxisAlignment: MainAxisAlignment.start,
                    minItemsPerRow: 4,
                    children: [
                      const HomeItems(
                        routeName: Routes.unloadServices,
                        color: Colors.indigo,
                        text: "درخواست تخلیه",
                        child: Icon(
                          Icons.directions_boat,
                          color: Colors.white,
                        ),
                      ),
                      HomeItems(
                        color: Colors.green,
                        text: "درخواست باربری",
                        child: const Icon(
                          Icons.fire_truck_outlined,
                          color: Colors.white,
                        ),
                        onTap: () {},
                      ),
                      HomeItems(
                        color: Colors.pink,
                        text: "پاکسازی",
                        child: const Icon(
                          Icons.cleaning_services,
                          color: Colors.white,
                        ),
                        onTap: () {},
                      ),
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

class ShipSearchDialog extends StatefulWidget {
  const ShipSearchDialog({super.key});

  @override
  State<ShipSearchDialog> createState() => _ShipSearchDialogState();
}

class _ShipSearchDialogState extends State<ShipSearchDialog> {
  final searchController = TextEditingController();

  String? selectedType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenSze = Screen.fromContext(context).screenSize;

    double screenMargin = 0.95;
    switch (screenSze) {
      case ScreenSize.xsmall:
        screenMargin = 0.95;
        break;
      case ScreenSize.small:
        screenMargin = 0.75;
        break;
      case ScreenSize.medium:
        screenMargin = 0.65;
        break;
      case ScreenSize.large:
        screenMargin = 0.45;
        break;
      case ScreenSize.xlarge:
        screenMargin = 0.35;
        break;
    }

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 0,
      ),
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * screenMargin,
        padding: const EdgeInsets.fromLTRB(
          0,
          24,
          0,
          24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Icon(
                    Icons.directions_boat,
                    color: Colors.black87,
                  ),
                  Gap(6),
                  Flexible(
                    child: Text(
                      'جستحوی کشتی',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 24,
              endIndent: 24,
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                onTap: () {},
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  alignLabelWithHint: true,
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText: 'جستجو',
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 0,
                                  ),
                                ),
                                readOnly: true,
                                controller: searchController,
                              ),
                            ),
                            const Gap(8),
                            Expanded(
                              flex: 2,
                              child: DropdownButtonFormField2<String>(
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
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
                                  'نوع کشتی',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                items: ['فله', 'کانتینری']
                                    .map(
                                      (type) => DropdownMenuItem<String>(
                                        alignment: Alignment.centerRight,
                                        value: type,
                                        child: Text(
                                          type.toString(),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'لطفا یک بندر را انتخاب کنید';
                                  }
                                  return null;
                                },
                                onChanged: (type) {
                                  setState(() {
                                    selectedType = type!;
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.only(right: 8),
                                ),
                                value: selectedType,
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
                        const Text(
                          'از لیست کشتی های یافت شده کشتی مورد نظر خود را انتخاب نمایید',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 32,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffBFC3FF),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    width: 64,
                                    height: 64,
                                    child: Icon(
                                      Icons.directions_boat,
                                      color: Colors.indigo.shade800,
                                      size: 28,
                                    ),
                                  ),
                                  const Gap(8),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                'کشتی پاناما',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Gap(12),
                                        Row(
                                          children: [
                                            Text(
                                              'شماره کشتی:',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Gap(4),
                                            Text(
                                              '125352',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:porduct_owner/core/utils/extentions.dart';

import '../../core/utils/helper.dart';

import '../../core/widgets/app_bg.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';

import '../../core/widgets/title_bar.dart';
import 'bloc/vessel_bloc.dart';
import 'data/repository/imass_repository.dart';

class VesselsSubScreen extends StatefulWidget {
  const VesselsSubScreen({super.key});

  @override
  State<VesselsSubScreen> createState() => _VesselsSubScreenState();
}

class _VesselsSubScreenState extends State<VesselsSubScreen> {
  final List<String> genderItems = [
    'انزلی',
    'رجایی',
  ];

  String selectedValue = 'انزلی';

  Timer? _timer;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return AppBackground(
              size: size,
              child: Column(
                children: [
                  TitleBar(
                    size: size,
                    title: "شناور ها",
                    onTap: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(32),
                          ),
                        ),
                        child: BlocBuilder<VesselBloc, VesselState>(
                          builder: (context, state) {
                            Helper.log("State => $state");

                            if (state is VesselLoading ||
                                state is VesselInitial) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 12, 16, 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              DropdownButtonFormField2<String>(
                                                isExpanded: true,
                                                decoration: InputDecoration(
                                                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                                                  // the menu padding when button's width is not specified.
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 16),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  // Add more decoration..
                                                ),
                                                hint: const Text(
                                                  'انتخاب بندر',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                items: genderItems
                                                    .map((item) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                                validator: (value) {
                                                  if (value == null) {
                                                    return 'لطفا یک بندر را انتخاب کنید';
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  selectedValue =
                                                      value.toString();

                                                  setState(() {});
                                                  Helper.log("onChange");

                                                  BlocProvider.of<VesselBloc>(
                                                          context)
                                                      .add(
                                                    VesselStarted(
                                                      filter: selectedValue,
                                                    ),
                                                  );
                                                },
                                                onSaved: (value) {
                                                  selectedValue =
                                                      value.toString();
                                                  setState(() {});
                                                  Helper.log('onSave');
                                                },
                                                buttonStyleData:
                                                    const ButtonStyleData(
                                                  padding:
                                                      EdgeInsets.only(right: 8),
                                                ),
                                                iconStyleData:
                                                    const IconStyleData(
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.black45,
                                                  ),
                                                  iconSize: 24,
                                                ),
                                                dropdownStyleData:
                                                    DropdownStyleData(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                menuItemStyleData:
                                                    const MenuItemStyleData(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                  ),
                                                ),
                                                value: selectedValue,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: CustomTextFormField(
                                            label: const Text(
                                              'جستجو',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            hintText: 'جستجو',
                                            keyboardType: TextInputType.text,
                                            controller: searchController,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 16,
                                            ),
                                            hintStyle: const TextStyle(
                                              fontSize: 15,
                                            ),
                                            onChanged: (value) {
                                              _startTimer();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 32,
                                          width: 32,
                                          child: CircularProgressIndicator(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else if (state is VesselEmpty) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 12, 16, 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              DropdownButtonFormField2<String>(
                                                isExpanded: true,
                                                decoration: InputDecoration(
                                                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                                                  // the menu padding when button's width is not specified.
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 16),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  // Add more decoration..
                                                ),
                                                hint: const Text(
                                                  'انتخاب بندر',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                items: genderItems
                                                    .map((item) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                                validator: (value) {
                                                  if (value == null) {
                                                    return 'لطفا یک بندر را انتخاب کنید';
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  selectedValue =
                                                      value.toString();

                                                  setState(() {});
                                                  Helper.log("onChange");

                                                  BlocProvider.of<VesselBloc>(
                                                          context)
                                                      .add(
                                                    VesselStarted(
                                                      filter: selectedValue,
                                                    ),
                                                  );
                                                },
                                                onSaved: (value) {
                                                  selectedValue =
                                                      value.toString();
                                                  setState(() {});
                                                  Helper.log('onSave');
                                                },
                                                buttonStyleData:
                                                    const ButtonStyleData(
                                                  padding:
                                                      EdgeInsets.only(right: 8),
                                                ),
                                                iconStyleData:
                                                    const IconStyleData(
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.black45,
                                                  ),
                                                  iconSize: 24,
                                                ),
                                                dropdownStyleData:
                                                    DropdownStyleData(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                menuItemStyleData:
                                                    const MenuItemStyleData(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                  ),
                                                ),
                                                value: selectedValue,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: CustomTextFormField(
                                            label: const Text(
                                              'جستجو',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            hintText: 'جستجو',
                                            keyboardType: TextInputType.text,
                                            controller: searchController,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 16,
                                            ),
                                            hintStyle: const TextStyle(
                                              fontSize: 15,
                                            ),
                                            onChanged: (value) {
                                              _startTimer();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'اطلاعاتی یافت نشد',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else if (state is VesselError) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 12, 16, 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                DropdownButtonFormField2<
                                                    String>(
                                                  isExpanded: true,
                                                  decoration: InputDecoration(
                                                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                                                    // the menu padding when button's width is not specified.
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 16),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    // Add more decoration..
                                                  ),
                                                  hint: const Text(
                                                    'انتخاب بندر',
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  items: genderItems
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return 'لطفا یک بندر را انتخاب کنید';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    selectedValue =
                                                        value.toString();

                                                    setState(() {});
                                                    Helper.log("onChange");

                                                    BlocProvider.of<VesselBloc>(
                                                            context)
                                                        .add(
                                                      VesselStarted(
                                                        filter: selectedValue,
                                                      ),
                                                    );
                                                  },
                                                  onSaved: (value) {
                                                    selectedValue =
                                                        value.toString();
                                                    setState(() {});
                                                    Helper.log('onSave');
                                                  },
                                                  buttonStyleData:
                                                      const ButtonStyleData(
                                                    padding: EdgeInsets.only(
                                                        right: 8),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black45,
                                                    ),
                                                    iconSize: 24,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      const MenuItemStyleData(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                    ),
                                                  ),
                                                  value: selectedValue,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: CustomTextFormField(
                                            label: const Text(
                                              'جستجو',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            hintText: 'جستجو',
                                            keyboardType: TextInputType.text,
                                            controller: searchController,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 16,
                                            ),
                                            hintStyle: const TextStyle(
                                              fontSize: 15,
                                            ),
                                            onChanged: (value) {
                                              _startTimer();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          state.exception.message ??
                                              'خطایی رخ داده است',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 44),
                                        SizedBox(
                                          width: null,
                                          child: CustomButton(
                                            width: 120,
                                            height: 44,
                                            backgroundColor: Colors.red,
                                            showShadow: false,
                                            borderRadius: 20,
                                            onPressed: () {
                                              BlocProvider.of<VesselBloc>(
                                                      context)
                                                  .add(
                                                VesselStarted(
                                                  filter: selectedValue,
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'تلاش مجدد',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else if (state is VesselSuccess) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 12, 16, 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              DropdownButtonFormField2<String>(
                                                isExpanded: true,
                                                decoration: InputDecoration(
                                                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                                                  // the menu padding when button's width is not specified.
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 16),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  // Add more decoration..
                                                ),
                                                hint: const Text(
                                                  'انتخاب بندر',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                items: genderItems
                                                    .map((item) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                                validator: (value) {
                                                  if (value == null) {
                                                    return 'لطفا یک بندر را انتخاب کنید';
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  selectedValue =
                                                      value.toString();

                                                  setState(() {});
                                                  Helper.log("onChange");

                                                  BlocProvider.of<VesselBloc>(
                                                          context)
                                                      .add(
                                                    VesselStarted(
                                                      filter: selectedValue,
                                                      search:
                                                          searchController.text,
                                                    ),
                                                  );
                                                },
                                                onSaved: (value) {
                                                  selectedValue =
                                                      value.toString();
                                                  setState(() {});
                                                  Helper.log('onSave');
                                                },
                                                buttonStyleData:
                                                    const ButtonStyleData(
                                                  padding:
                                                      EdgeInsets.only(right: 8),
                                                ),
                                                iconStyleData:
                                                    const IconStyleData(
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.black45,
                                                  ),
                                                  iconSize: 24,
                                                ),
                                                dropdownStyleData:
                                                    DropdownStyleData(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                menuItemStyleData:
                                                    const MenuItemStyleData(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                  ),
                                                ),
                                                value: selectedValue,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: CustomTextFormField(
                                            label: const Text(
                                              'جستجو',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            hintText: 'جستجو',
                                            keyboardType: TextInputType.text,
                                            controller: searchController,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 16,
                                            ),
                                            hintStyle: const TextStyle(
                                              fontSize: 15,
                                            ),
                                            onChanged: (value) {
                                              _startTimer();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      padding: const EdgeInsets.fromLTRB(
                                          24, 0, 24, 32),
                                      itemCount: state.vesseles.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 2,
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 16, 16, 20),
                                          child: Column(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          state.vesseles[index]
                                                              .name,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          color: Colors.blue
                                                              .withOpacity(
                                                                  0.15),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 14,
                                                          vertical: 8,
                                                        ),
                                                        child: Text(
                                                          state.vesseles[index]
                                                              .type,
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors
                                                                .blue.shade900,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Divider(
                                                    color: Colors.black12,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'شماره دریایی:',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.02),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 8,
                                                          vertical: 6,
                                                        ),
                                                        child: Text(
                                                          state.vesseles[index]
                                                              .pmoNumber,
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors
                                                                .grey.shade900,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'آخرین وضعیت:',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${state.vesseles[index].voyageStatePersianName ?? "-"} ",
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'تاریخ ورود:',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        state.vesseles[index]
                                                                .entranceDate ??
                                                            '-',
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'بندر:',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        state.vesseles[index]
                                                                .port ??
                                                            '-',
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'تناژ:',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${state.vesseles[index].nt.withNumberSplit()} ",
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'آخرین موقعیت شناور:',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${state.vesseles[index].lastLocationPersianName ?? "-"} ",
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'پرچم شناور:',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${state.vesseles[index].vesselFlagCountryPersianName ?? "-"} ",
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }

                            throw Exception('state not found');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    _timer?.cancel(); // Cancel the timer if it's active
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel(); // Cancel the previous timer (if any)
    _timer = Timer(const Duration(seconds: 1), _handleTimeout);
  }

  void _handleTimeout() {
    Helper.log("User finished typing: ${searchController.text}");
    BlocProvider.of<VesselBloc>(context).add(
      VesselStarted(
        filter: selectedValue,
        search: searchController.text,
      ),
    );
  }
}

class VesselsScreen extends StatelessWidget {
  const VesselsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VesselBloc>(
      create: (context) {
        final bloc = VesselBloc(
          repository: iMassRepository,
        );

        bloc.add(
          const VesselStarted(
            filter: 'انزلی',
          ),
        );
        return bloc;
      },
      child: const VesselsSubScreen(),
    );
  }
}

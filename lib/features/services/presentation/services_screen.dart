import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/model/ship_type.dart';
import 'package:porduct_owner/core/repository/product_owner_repository.dart';
import 'package:porduct_owner/core/widgets/error_view.dart';
import 'package:porduct_owner/features/services/presentation/bloc/service_bloc.dart';
import 'package:porduct_owner/features/services/presentation/unload_services_screen.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../../core/utils/helper.dart';
import '../../../core/utils/routes.dart';
import '../../home_page/widget/home_items.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  /*PortModel? selectedPort;

  ShipModel? selectedShip;

  TextEditingController shipController = TextEditingController();*/

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceBloc>(
      create: (context) {
        final bloc = ServiceBloc(
          repository: productOwnerRepository,
          context: context,
        );
        bloc.add(ServiceBaseInfoStarted());

        return bloc;
      },
      child: Scaffold(
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
                            'خدمات',
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
            BlocBuilder<ServiceBloc, ServiceState>(
              builder: (context, state) {
                Helper.log('state $state');
                if (state is ServiceLoading || state is ServiceInitial) {
                  return const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(),
                        ),
                        Gap(16),
                        Text(
                          'در حال دریافت اطلاعات',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is ServiceError) {
                  return ErrorView(
                    message: state.exception.message,
                    onRetry: () {
                      BlocProvider.of<ServiceBloc>(context).add(
                        ServiceBaseInfoStarted(),
                      );
                    },
                  );
                } else if (state is ServiceBaseInfoSuccess) {
                  /* selectedPort = state.response.ports.isNotEmpty
                      ? state.response.ports.first
                      : null;*/
                  return Expanded(
                    child: Column(
                      children: [
                        /*Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField2<PortModel>(
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
                                  items: state.response.ports
                                      .map((bandar) =>
                                          DropdownMenuItem<PortModel>(
                                            alignment: Alignment.centerRight,
                                            value: bandar,
                                            child: Text(
                                              bandar.portName.toString(),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                ),
                              ),
                              const Gap(8),
                              Expanded(
                                child: TextFormField(
                                  onTap: () async {
                                    final result = await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ShipSearchDialog(
                                          shipTypes: state.response.shipTypes,
                                        );
                                      },
                                    );

                                    if (result != null) {
                                      setState(() {
                                        selectedShip = (result as ShipModel);
                                      });
                                      shipController.text =
                                          (result as ShipModel).shipName;
                                    }
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
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  readOnly: true,
                                  controller: shipController,
                                ),
                              ),
                            ],
                          ),
                        ),*/
                        /*if (selectedShip != null && selectedPort != null)*/
                        Expanded(
                          child: ResponsiveGridList(
                            horizontalGridMargin: 12,
                            listViewBuilderOptions: ListViewBuilderOptions(
                              shrinkWrap: true,
                            ),
                            minItemWidth: 80,
                            rowMainAxisAlignment: MainAxisAlignment.start,
                            minItemsPerRow: 4,
                            children: [
                              HomeItems(
                                routeName: Routes.unloadServices,
                                arguments: UnloadServicesScreenParam(
                                  shipTypes: state.response.shipTypes,
                                  ports: state.response.ports,
                                  allocationEquTypes:
                                      state.response.allocationEquTypes,
                                  productCategories:
                                      state.response.productCategories,
                                ),
                                color: Colors.indigo,
                                text: "درخواست تخلیه",
                                child: const Icon(
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
                  );
                }
                throw Exception('state not found!');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShipSearchDialog extends StatefulWidget {
  final List<ShipTypeModel> shipTypes;

  const ShipSearchDialog({
    super.key,
    required this.shipTypes,
  });

  @override
  State<ShipSearchDialog> createState() => _ShipSearchDialogState();
}

class _ShipSearchDialogState extends State<ShipSearchDialog> {
  final searchController = TextEditingController();

  ShipTypeModel? selectedType;

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

    return BlocProvider<ServiceBloc>(
      create: (context) {
        final bloc = ServiceBloc(
          repository: productOwnerRepository,
          context: context,
        );
        bloc.add(const ServiceShipsStarted());
        return bloc;
      },
      child: Dialog(
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
                    Builder(
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        alignLabelWithHint: true,
                                        hintStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hintText: 'جستجو',
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 0,
                                        ),
                                      ),
                                      controller: searchController,
                                      onChanged: (value) {
                                        BlocProvider.of<ServiceBloc>(context)
                                            .add(
                                          ServiceShipsStarted(
                                            search: searchController.text,
                                            shipType: selectedType?.name,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const Gap(8),
                                  Expanded(
                                    flex: 2,
                                    child: Builder(
                                      builder: (context) {
                                        return DropdownButtonFormField2<
                                            ShipTypeModel>(
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                              ),
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            // Add Horizontal padding using menuItemStyleData.padding so it matches
                                            // the menu padding when button's width is not specified.
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                              8,
                                              4,
                                              0,
                                              0,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            // Add more decoration..
                                          ),
                                          hint: const Text(
                                            'نوع کشتی',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          items: widget.shipTypes
                                              .map(
                                                (type) => DropdownMenuItem<
                                                    ShipTypeModel>(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  value: type,
                                                  child: Text(
                                                    type.name.toString(),
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
                                            BlocProvider.of<ServiceBloc>(
                                                    context)
                                                .add(
                                              ServiceShipsStarted(
                                                search: searchController.text,
                                                shipType: selectedType?.name,
                                              ),
                                            );
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            direction:
                                                DropdownDirection.textDirection,
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                          ),
                                        );
                                      },
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
                        );
                      },
                    ),
                    BlocBuilder<ServiceBloc, ServiceState>(
                      builder: (context, state) {
                        Helper.log("state is $state");

                        if (state is ServiceInitial ||
                            state is ServiceLoading) {
                          return const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                            ),
                          );
                        } else if (state is ServiceError) {
                          return ErrorView(
                            message: state.exception.message,
                            onRetry: () {
                              BlocProvider.of<ServiceBloc>(context).add(
                                ServiceShipsStarted(
                                  search: searchController.text,
                                  shipType: selectedType?.name,
                                ),
                              );
                            },
                          );
                        } else if (state is ServiceShipsSuccess) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: state.response.ships.length,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 32,
                              ),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop(
                                        state.response.ships[index],
                                      );
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
                                              borderRadius:
                                                  BorderRadius.circular(9),
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        state
                                                            .response
                                                            .ships[index]
                                                            .shipName,
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Gap(12),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'شماره کشتی:',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const Gap(4),
                                                    Text(
                                                      state
                                                              .response
                                                              .ships[index]
                                                              .imoNumber ??
                                                          '-',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
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
                          );
                        }

                        throw Exception('state $state not found');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

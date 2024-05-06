import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/consts/app_colors.dart';
import 'package:porduct_owner/core/model/product_category.dart';
import 'package:porduct_owner/core/model/ship_type.dart';
import 'package:porduct_owner/core/repository/product_owner_repository.dart';
import 'package:porduct_owner/features/services/presentation/bloc/service_bloc.dart';

import '../../../core/model/allocationOfEquTypes.dart';
import '../../../core/model/port.dart';
import '../../../core/utils/helper.dart';
import '../../../core/utils/routes.dart';
import '../../../core/widgets/bottom_loader.dart';
import '../../../core/widgets/empty_bottom_loader.dart';
import '../../../core/widgets/empty_view.dart';
import '../../../core/widgets/error_view.dart';
import '../data/model/allocation_equ.dart';
import 'add_unload_request_screen.dart';

class UnloadServicesScreenParam {
  final List<ShipTypeModel> shipTypes;
  final List<PortModel> ports;

  final List<AllocationOfEquTypesModel> allocationEquTypes;

  final List<ProductCategoryModel> productCategories;

  UnloadServicesScreenParam({
    required this.shipTypes,
    required this.ports,
    required this.allocationEquTypes,
    required this.productCategories,
  });
}

class UnloadServicesScreen extends StatelessWidget {
  final UnloadServicesScreenParam screenParam;

  const UnloadServicesScreen({
    super.key,
    required this.screenParam,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceBloc>(
      create: (context) {
        final bloc = ServiceBloc(
          repository: productOwnerRepository,
          context: context,
        );

        bloc.add(
          const ServiceLoadUnloadRequestsStarted(
            isScrolling: false,
          ),
        );
        return bloc;
      },
      child: UnloadServicesPageScreen(
        screenParam: screenParam,
      ),
    );
  }
}

class UnloadServicesPageScreen extends StatefulWidget {
  final UnloadServicesScreenParam screenParam;
  const UnloadServicesPageScreen({
    super.key,
    required this.screenParam,
  });

  @override
  State<UnloadServicesPageScreen> createState() =>
      _UnloadServicesPageScreenState();
}

class _UnloadServicesPageScreenState extends State<UnloadServicesPageScreen> {
  final _scrollController = ScrollController();

  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      _onScroll,
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(
        _onScroll,
      )
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ServiceBloc>().add(
            const ServiceLoadUnloadRequestsStarted(
              isScrolling: true,
            ),
          );
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll /** 0.9*/);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = Screen.fromContext(context).screenSize;

    double mainMargin = 0;

    if (screenSize == ScreenSize.xsmall) {
      mainMargin = 16;
    } else if (screenSize == ScreenSize.small) {
      mainMargin = 70;
    } else if (screenSize == ScreenSize.medium) {
      mainMargin = 250;
    } else if (screenSize == ScreenSize.large) {
      mainMargin = 450;
    } else if (screenSize == ScreenSize.xlarge) {
      mainMargin = 600;
    }
    return BlocProvider<ServiceBloc>(
      create: (context) {
        final bloc = ServiceBloc(
          repository: productOwnerRepository,
          context: context,
        );
        bloc.add(
          const ServiceLoadUnloadRequestsStarted(
            isScrolling: false,
          ),
        );
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
                            'درخواست های تخلیه',
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
                Helper.log(state.toString());

                if (state is ServiceLoading || state is ServiceInitial) {
                  return const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 32,
                          width: 32,
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  );
                } else if (state is ServiceEmpty) {
                  return const Expanded(
                    child: EmptyView(),
                  );
                } else if (state is ServiceError) {
                  return ErrorView(
                    message: state.exception.message,
                    onRetry: () {
                      BlocProvider.of<ServiceBloc>(context).add(
                        const ServiceLoadUnloadRequestsStarted(
                          isScrolling: false,
                        ),
                      );
                    },
                  );
                } else if (state is ServiceLoadUnloadRequestsSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: !state.moreData
                          ? state.allocationEqus.length
                          : state.allocationEqus.length + 1,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                      itemBuilder: (context, index) {
                        if (index >= state.allocationEqus.length &&
                            !state.moreData) {
                          return const EmptyBottomLoader();
                        } else if (index >= state.allocationEqus.length &&
                            state.moreData) {
                          return const BottomLoader();
                        } else {
                          return UnloadServiceListItem(
                            allocationEquModel: state.allocationEqus[index],
                          );
                        }
                      },
                    ),
                  );
                }

                throw Exception('state not found');
              },
            ),
          ],
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton.extended(
            label: const Row(
              children: [
                Icon(Icons.add),
                Gap(4),
                Text('درخواست جدید'),
              ],
            ),
            onPressed: () async {
              await Navigator.of(context).pushNamed(
                Routes.addUnloadRequest,
                arguments: AddUnloadRequestScreenParam(
                  shipTypes: widget.screenParam.shipTypes,
                  ports: widget.screenParam.ports,
                  allocationEquTypes: widget.screenParam.allocationEquTypes,
                  productCategories: widget.screenParam.productCategories,
                ),
              );

              if (mounted) {
                BlocProvider.of<ServiceBloc>(context).add(
                  const ServiceLoadUnloadRequestsStarted(
                    isScrolling: false,
                  ),
                );
              }
            },
          );
        }),
      ),
    );
  }
}

class UnloadServiceListItem extends StatelessWidget {
  final AllocationEquModel allocationEquModel;
  const UnloadServiceListItem({
    super.key,
    required this.allocationEquModel,
  });

  /*{
       shipId: "94aec805-7d3a-ee11-ab2d-000c298bb859",
       productCategoryId: "e27e1316-e8e7-ed11-a03a-e39549b01a8c",
       pmoNumber: "102030",
       tonnage: 15000,
       totalPrice: 7500000,
       description: null,
       companyOwnerId: "1335c141-28f6-ee11-ab3c-000c298bb859",
       state: 0,
       portId: "5d88fdfd-d5e7-ed11-a03a-e39549b01a8c",
       id: "19813ce8-2b06-ef11-ab3c-000c298bb859",
       shipShipName: "کشتی وندا",
       productCategoryName: "فله",
       enterShipFa: "1403/02/10",
       tonnageTitle: "15,000",
       totalPriceTitle: "7,500,000",
       portPortName: "بندر انزلی",
       allocationOfEquTypeName: "پاکسازی",
       stateTitle: "بررسی اولیه",
       companyOwnerCompanyName: "هاروست پارس خاورمیانه",
       "AllocatuionEqu/1403-2\5bd6270f-bc90-49cc-9fee-22dc899ef7ca.png"
  }*/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            Routes.unloadServiceDetails,
            arguments: allocationEquModel,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: AppColor.shadow,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "${allocationEquModel.shipShipName} - ${allocationEquModel.portPortName}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blue.withOpacity(0.3),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Text(
                      allocationEquModel.stateTitle,
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  )
                ],
              ),
              const Gap(12),
              Row(
                children: [
                  Text(
                    allocationEquModel.enterShipFa,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
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

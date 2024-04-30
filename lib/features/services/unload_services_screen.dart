import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/consts/app_colors.dart';
import 'package:porduct_owner/core/model/product_category.dart';

import '../../core/model/allocationOfEquTypes.dart';
import '../../core/model/port.dart';
import '../../core/model/ship.dart';
import '../../core/utils/routes.dart';
import 'add_unload_request_screen.dart';

class UnloadServicesScreen extends StatelessWidget {
  final UnloadServicesScreenParam screenParam;

  const UnloadServicesScreen({
    super.key,
    required this.screenParam,
  });

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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      Routes.unloadServiceDetails,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
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
                            const Flexible(
                              child: Text(
                                'درخواست خدمات تخلیه',
                                style: TextStyle(
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
                              child: const Text(
                                'در حال بررسی',
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Gap(12),
                        const Row(
                          children: [
                            Text(
                              'کد پیگیری',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                            Gap(4),
                            Text(
                              '12542563',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Row(
          children: [
            Icon(Icons.add),
            Gap(4),
            Text('درخواست جدید'),
          ],
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(
            Routes.addUnloadRequest,
            arguments: AddUnloadRequestScreenParam(
              port: screenParam.port,
              ship: screenParam.ship,
              allocationEquTypes: screenParam.allocationEquTypes,
              productCategories: screenParam.productCategories,
            ),
          );
        },
      ),
    );
  }
}

class UnloadServicesScreenParam {
  final ShipModel ship;
  final PortModel port;

  final List<AllocationOfEquTypesModel> allocationEquTypes;

  final List<ProductCategoryModel> productCategories;

  UnloadServicesScreenParam({
    required this.ship,
    required this.port,
    required this.allocationEquTypes,
    required this.productCategories,
  });
}
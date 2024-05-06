import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/repository/product_owner_repository.dart';
import 'package:porduct_owner/features/services/presentation/bloc/service_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/consts/app_colors.dart';
import '../../../core/consts/app_environment.dart';
import '../../../core/utils/routes.dart';
import '../../../core/widgets/error_view.dart';
import '../../secondary_pdf/secondary_pdf_screen.dart';
import '../data/model/allocation_equ.dart';

class UnloadServiceDetailsScreen extends StatelessWidget {
  final AllocationEquModel allocationEquModel;

  const UnloadServiceDetailsScreen({
    super.key,
    required this.allocationEquModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceBloc>(
      create: (context) {
        final bloc = ServiceBloc(
          repository: productOwnerRepository,
          context: context,
        );
        if (allocationEquModel.totalPriceCompany > 0) {
          bloc.add(
            ServiceLoadUnloadRequestStarted(
              allocationEquipmentId: allocationEquModel.id,
            ),
          );
        }

        return bloc;
      },
      child: Scaffold(
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
                              'درخواست تخلیه',
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
              Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 32,
                        ),
                        margin: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 3,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'نام کشتی',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  allocationEquModel.shipShipName,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(5),
                            const Divider(
                              color: Colors.black12,
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'شماره کشتی',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  allocationEquModel.pmoNumber ?? '-',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(5),
                            const Divider(
                              color: Colors.black12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'تاریخ ورود کشتی',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  allocationEquModel.enterShipFa,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                              ],
                            ),
                            const Gap(5),
                            const Divider(
                              color: Colors.black12,
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'مانیفست',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                if (allocationEquModel
                                        .manifestFilePath?.isNotEmpty ??
                                    false)
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 12,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (allocationEquModel
                                              .manifestFilePath?.isNotEmpty ??
                                          false) {
                                        await launchUrl(
                                          Uri.parse(
                                            AppEnvironment.loadUnloadApiPassword
                                                    .replaceAll('api/', '') +
                                                allocationEquModel
                                                    .manifestFilePath!,
                                          ),
                                          mode: LaunchMode.externalApplication,
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'دانلود فایل',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                if (allocationEquModel
                                        .manifestFilePath?.isEmpty ??
                                    true)
                                  const Text('ندارد')
                              ],
                            ),
                            const Divider(
                              color: Colors.black12,
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'نوع بار',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  allocationEquModel.productCategoryName ?? '-',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(5),
                            const Divider(
                              color: Colors.black12,
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'وضعیت درخواست',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    allocationEquModel.stateTitle,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(5),
                            const Divider(
                              color: Colors.black12,
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'بندر',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    allocationEquModel.portPortName,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(5),
                            const Divider(
                              color: Colors.black12,
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'صاحب کالا',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    allocationEquModel
                                            .companyOwnerCompanyName ??
                                        '-',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(5),
                            const Divider(
                              color: Colors.black12,
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'تناژ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    allocationEquModel.tonnageTitle,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(5),
                            const Divider(
                              color: Colors.black12,
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'سهم آریا بنادر',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  allocationEquModel.totalPriceCompanyTitle ??
                                      '-',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(5),
                            const Divider(
                              color: Colors.black12,
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'سهم سازمان',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  allocationEquModel.totalPriceCompanyTitle ??
                                      '-',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(5),
                            const Divider(
                              color: Colors.black12,
                            ),
                            const Gap(5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Row(
                                  children: [
                                    Text(
                                      'توضیحات:',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        allocationEquModel.description ?? '-',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Text(
                          'پیش فاکتور های صادر شده',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(6),
                  const Divider(
                    color: Colors.black26,
                    indent: 24,
                    endIndent: 24,
                  ),
                  /*ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 86),
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.billDetails,
                            arguments: 1,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: AppColor.shadow,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.receipt,
                                  color: Colors.white,
                                ),
                              ),
                              const Gap(12),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('پیش فاکتور سازمان بنادر'),
                                        ],
                                      ),
                                      Gap(8),
                                      Row(
                                        children: [
                                          Text(
                                            'تاریخ صدور: 1402/01/01',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(16),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.billDetails, arguments: 2);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: AppColor.shadow,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.receipt,
                                  color: Colors.white,
                                ),
                              ),
                              const Gap(12),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('پیش فاکتور آریا بنادر'),
                                        ],
                                      ),
                                      Gap(8),
                                      Row(
                                        children: [
                                          Text(
                                            'تاریخ صدور: 1402/01/01',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),*/
                  BlocBuilder<ServiceBloc, ServiceState>(
                    builder: (context, state) {
                      if (state is ServiceLoadUnloadRequestSuccess) {
                        return ListView(
                          shrinkWrap: true,
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 86),
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            if (state.orgBase64?.isNotEmpty ?? false)
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    Routes.secondaryPDF,
                                    arguments: SecondaryPdfScreenParams(
                                      data: state.orgBase64!,
                                      name:
                                          '${allocationEquModel.pmoNumber}-${allocationEquModel.enterShipFa}',
                                      pageTitle: "پیش فاکتور سازمان بنادر",
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: AppColor.shadow,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 38,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.receipt,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                      const Gap(12),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      ' مشاهده پیش فاکتور سازمان بنادر',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (state.ariaBase64?.isNotEmpty ?? false)
                              const Gap(16),
                            if (state.ariaBase64?.isNotEmpty ?? false)
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    Routes.secondaryPDF,
                                    arguments: SecondaryPdfScreenParams(
                                      data: state.ariaBase64!,
                                      name:
                                          '${allocationEquModel.pmoNumber}-${allocationEquModel.enterShipFa}',
                                      pageTitle: "پیش فاکتور آریا بنادر",
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: AppColor.shadow,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 38,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.receipt,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                      const Gap(12),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      'مشاهده پیش فاکتور آریا بنادر',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            const Gap(64),
                          ],
                        );
                      } else if (state is ServiceLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is ServiceInitial) {
                        return const SizedBox();
                      } else if (state is ServiceError) {
                        return ErrorView(
                          isExpanded: false,
                          message: state.exception.message,
                          onRetry: () {},
                        );
                      }

                      throw Exception('state $state not found');
                    },
                  ),
                  const Gap(64),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

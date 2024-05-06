import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/core/repository/product_owner_repository.dart';
import 'package:porduct_owner/features/services/presentation/bloc/service_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/consts/app_environment.dart';
import '../../../core/utils/helper.dart';
import '../../../core/utils/routes.dart';
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
                                const Row(
                                  children: [
                                    Icon(Icons.directions_boat_filled_outlined),
                                    Gap(4),
                                    Text(
                                      'نام کشتی',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.blueGrey.withOpacity(0.25),
                                  ),
                                  child: Text(
                                    allocationEquModel.shipShipName,
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
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.red.withOpacity(0.25),
                                    ),
                                    child: const Text(
                                      'ثبت نشده',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
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
                                  'نوع کالا',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  allocationEquModel.productProductName ?? '-',
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
                                  'تاریخ درخواست',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    allocationEquModel.createDateFa,
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
                  if (allocationEquModel.state < 1)
                    Container(
                      width: double.infinity,
                      height: 150,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 28,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: const Column(
                        children: [
                          Icon(
                            Icons.receipt,
                            size: 38,
                            color: Colors.grey,
                          ),
                          Gap(24),
                          Text(
                            'پیش فاکتوری صادر نشده است',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (allocationEquModel.state >= 1)
                    ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 86),
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'سازمان بنادر و دریانوردی',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  BlocConsumer<ServiceBloc, ServiceState>(
                                    listener: (context, state) {
                                      if (state
                                          is ServiceLoadUnloadOrgInvoiceSuccess) {
                                        Navigator.of(context).pushNamed(
                                          Routes.secondaryPDF,
                                          arguments: SecondaryPdfScreenParams(
                                            data: state.orgBase64!,
                                            name:
                                                '${allocationEquModel.pmoNumber}',
                                            pageTitle:
                                                "پیش فاکتور سازمان بنادر",
                                          ),
                                        );
                                      } else if (state is ServiceDialogError) {
                                        Helper.showToast(
                                          title: 'خطا!',
                                          description:
                                              "خطا در دریافت پیش فاکتور",
                                          context: context,
                                          type: ToastificationType.error,
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                      return OutlinedButton(
                                        onPressed: state
                                                is ServiceLoadUnloadOrgInvoiceLoading
                                            ? () {}
                                            : () {
                                                BlocProvider.of<ServiceBloc>(
                                                        context)
                                                    .add(
                                                  ServiceLoadUnloadOrgInvoiceStarted(
                                                    allocationEquipmentId:
                                                        allocationEquModel.id,
                                                  ),
                                                );
                                              },
                                        child: state
                                                is ServiceLoadUnloadOrgInvoiceLoading
                                            ? const SizedBox(
                                                width: 16,
                                                height: 16,
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : const Text(
                                                'مشاهده فاکتور',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const Gap(0),
                              const Divider(
                                color: Colors.black12,
                              ),
                              const Gap(8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'مبلغ قابل پرداخت',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        allocationEquModel.totalPriceOrgTitle ??
                                            '0',
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                        textDirection: TextDirection.ltr,
                                      ),
                                      const Gap(4),
                                      const Text(
                                        'ریال',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                        textDirection: TextDirection.ltr,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(32),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'جهت واریز سهم سازمان بنادر و دریانوردی',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'شماره شبا',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                'IR240100004001064504008225',
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const Gap(6),
                                              InkWell(
                                                onTap: () {
                                                  Clipboard.setData(
                                                    const ClipboardData(
                                                      text:
                                                          "IR240100004001064504008225",
                                                    ),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.copy,
                                                  size: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'مبلغ:',
                                          textDirection: TextDirection.rtl,
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                allocationEquModel
                                                        .totalPriceOrgTitle ??
                                                    '0',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              const Gap(4),
                                              const Text(
                                                'ریال',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              const Gap(8),
                                              InkWell(
                                                onTap: () {
                                                  Clipboard.setData(
                                                    ClipboardData(
                                                      text: allocationEquModel
                                                          .totalPriceOrg
                                                          .toString(),
                                                    ),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.copy,
                                                  size: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(24),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 48,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),
                                        onPressed: () {},
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.payment,
                                            ),
                                            Gap(4),
                                            Text(
                                              'پرداخت آنلاین',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Gap(16),
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'شرکت آریا بنادر ایرانیان',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  BlocConsumer<ServiceBloc, ServiceState>(
                                    listener: (context, state) {
                                      if (state
                                          is ServiceLoadUnloadAriaInvoiceSuccess) {
                                        Navigator.of(context).pushNamed(
                                          Routes.secondaryPDF,
                                          arguments: SecondaryPdfScreenParams(
                                            data: state.ariaBase64!,
                                            name:
                                                '${allocationEquModel.pmoNumber}',
                                            pageTitle:
                                                "پیش فاکتور آریا بنادر ایرانیان",
                                          ),
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                      return OutlinedButton(
                                        onPressed: state
                                                is ServiceLoadUnloadAriaInvoiceLoading
                                            ? () {}
                                            : () {
                                                BlocProvider.of<ServiceBloc>(
                                                        context)
                                                    .add(
                                                  ServiceLoadUnloadAriaInvoiceStarted(
                                                    allocationEquipmentId:
                                                        allocationEquModel.id,
                                                  ),
                                                );
                                              },
                                        child: state
                                                is ServiceLoadUnloadAriaInvoiceLoading
                                            ? const SizedBox(
                                                width: 16,
                                                height: 16,
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : const Text(
                                                'مشاهده فاکتور',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const Gap(0),
                              const Divider(
                                color: Colors.black12,
                              ),
                              const Gap(8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'مبلغ قابل پرداخت',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        allocationEquModel
                                                .totalPriceCompanyTitle ??
                                            '0',
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                        textDirection: TextDirection.ltr,
                                      ),
                                      const Gap(4),
                                      const Text(
                                        'ریال',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                        textDirection: TextDirection.ltr,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(32),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'جهت واریز سهم شرکت آریا بنادر ایرانیان',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'شماره شبا',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                'IR760180000000377801176611',
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const Gap(6),
                                              InkWell(
                                                onTap: () {
                                                  Clipboard.setData(
                                                    const ClipboardData(
                                                      text:
                                                          "IR760180000000377801176611",
                                                    ),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.copy,
                                                  size: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'مبلغ:',
                                          textDirection: TextDirection.rtl,
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                allocationEquModel
                                                        .totalPriceCompanyTitle ??
                                                    '0',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              const Gap(4),
                                              const Text(
                                                'ریال',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              const Gap(8),
                                              InkWell(
                                                onTap: () {
                                                  Clipboard.setData(
                                                    ClipboardData(
                                                      text: allocationEquModel
                                                          .totalPriceCompany
                                                          .toString(),
                                                    ),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.copy,
                                                  size: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(24),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 48,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),
                                        onPressed: () {},
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.payment,
                                            ),
                                            Gap(4),
                                            Text(
                                              'پرداخت آنلاین',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Gap(64),
                      ],
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_icons/line_icons.dart';
import 'package:porduct_owner/core/core.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              Gap(MediaQuery.of(context).viewPadding.top + 24),
              Row(
                children: [
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: const Icon(
                      LineIcons.bell,
                      size: 26,
                      color: Color(0xff808080),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      /*   onTapOutside: (event) => FocusScope.of(context).unfocus(),*/
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: const BorderSide(
                            color: Color(0xff808080),
                            width: 1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Color(0xff808080),
                          ),
                        ),
                        hintText: 'جستجو',
                        hintStyle: const TextStyle(
                          color: Color(0xff808080),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(32),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                decoration: BoxDecoration(
                  color: const Color(0xff3A45ED),
                  borderRadius: BorderRadius.circular(27),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'نمای کل',
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/home/ship.png',
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Gap(32),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'کشتی های فعال',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.ships);
                        },
                        child: const Row(
                          children: [
                            Text(
                              'مشاهده همه',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff3A45ED),
                              ),
                            ),
                            Icon(
                              Icons.arrow_back_ios_new,
                              size: 14,
                              color: Color(0xff3A45ED),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(8),
                  ListView(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(9),
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.ship);
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
                                  child: Image.asset(
                                    'assets/images/home/load.png',
                                  ),
                                ),
                                const Gap(8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Flexible(
                                            child: Text(
                                              'کشتی پاناما',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xff3A45ED),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 12,
                                            ),
                                            child: const Text(
                                              'درحال بارگیری',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(12),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'بندر انزلی',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            '1400/02/02',
                                            style: TextStyle(
                                              fontSize: 13,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(9),
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.ship);
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
                                    color: const Color(0xffFFE098),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  width: 64,
                                  height: 64,
                                  child: Image.asset(
                                    'assets/images/home/unload.png',
                                  ),
                                ),
                                const Gap(8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Flexible(
                                            child: Text(
                                              'کشتی پاناما',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xff3A45ED),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 12,
                                            ),
                                            child: const Text(
                                              'در حال تخلیه',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(12),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'بندر انزلی',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            '1400/02/02',
                                            style: TextStyle(
                                              fontSize: 13,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(9),
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.ship);
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
                                  child: Image.asset(
                                    'assets/images/home/load.png',
                                  ),
                                ),
                                const Gap(8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Flexible(
                                            child: Text(
                                              'کشتی پاناما',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xffFF9100),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 12,
                                            ),
                                            child: const Text(
                                              'توقف بارگیری',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(12),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'بندر انزلی',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            '1400/02/02',
                                            style: TextStyle(
                                              fontSize: 13,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(9),
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.ship);
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
                                    color: const Color(0xffFFE098),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  width: 64,
                                  height: 64,
                                  child: Image.asset(
                                    'assets/images/home/unload.png',
                                  ),
                                ),
                                const Gap(8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Flexible(
                                            child: Text(
                                              'کشتی پاناما',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xff23C53E),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 12,
                                            ),
                                            child: const Text(
                                              'تکمیل شده',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(12),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'بندر انزلی',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            '1400/02/02',
                                            style: TextStyle(
                                              fontSize: 13,
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
                      ),
                    ],
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_icons/line_icons.dart';
import 'package:porduct_owner/core/core.dart';

import '../../core/consts/constans.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                          'لیست پیام ها',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                ],
              ),
              const Gap(16),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.20),
                  blurRadius: 4,
                  offset: const Offset(0.5, 1),
                ),
              ],
              color: Colors.white,
            ),
            child: Stack(
              children: [
                buildPositionedContainer(selectedTab),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(48),
                        child: Center(
                          child: Text(
                            'اعلان ها',
                            style: TextStyle(
                              fontSize: 14,
                              color: selectedTab == 0
                                  ? Colors.white
                                  : const Color(0xff002998),
                              fontWeight: selectedTab == 0
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedTab = 0;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(48),
                        child: Center(
                          child: Text(
                            'اخبار',
                            style: TextStyle(
                              fontSize: 14,
                              color: selectedTab == 1
                                  ? Colors.white
                                  : const Color(0xff002998),
                              fontWeight: selectedTab == 1
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedTab = 1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(24),
          Expanded(
            child: IndexedStack(
              index: selectedTab,
              children: [
                ListView.builder(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: Constants.shadow1,
                          ),
                          child: SelectionArea(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Flexible(
                                      child: SelectableText(
                                        'عنوان پیام',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.notifications,
                                      color: Colors.blue.withOpacity(0.95),
                                      size: 18,
                                    ),
                                  ],
                                ),
                                const Gap(12),
                                const Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'توضیحات پیام دریافتی توضیحات پیام دریافتی توضیحات پیام دریافتی توضیحات پیام دریافتی توضیحات پیام دریافتی',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          height: 1.8,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(12),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      LineIcons.calendar,
                                      size: 20,
                                    ),
                                    Gap(2),
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
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.news);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            debugPrint(' خبر شماره $index');
                            Navigator.of(context).pushNamed(
                              Routes.news,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: Constants.shadow1,
                            ),
                            child: SelectionArea(
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/images/background.jpg',
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: SelectableText(
                                                  'عنوان خبر',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
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
                                        ),
                                        Gap(12),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  'توضیحات خبر توضیحات خبر توضیحات خبر توضیحات خبر توضیحات خبر توضیحات خبر توضیحات خبر ',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.8,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPositionedContainer(int index) {
    return Builder(builder: (context) {
      return AnimatedContainer(
        margin: EdgeInsets.only(
          right: index == 0 ? 0 : MediaQuery.of(context).size.width * 0.5 - 16,
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: index == 0
              ? const BorderRadius.horizontal(
                  right: Radius.circular(48),
                )
              : const BorderRadius.horizontal(
                  left: Radius.circular(48),
                ),
        ),
        width: index == 0
            ? MediaQuery.of(context).size.width * 0.5 - 16
            : MediaQuery.of(context).size.width * 0.5,
        height: 48,
        duration: const Duration(
          milliseconds: 500,
        ),
      );
    });
  }
}

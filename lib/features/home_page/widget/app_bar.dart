// ignore: unnecessary_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:porduct_owner/features/home_page/widget/tab_bar.dart';
import '../../../core/widgets/custom_logo.dart';

class CustomAppBar extends StatefulWidget {
  final VoidCallback drawerTap;
  final ValueNotifier<int> tabIndexNotifier;

  const CustomAppBar({
    super.key,
    required this.drawerTap,
    required this.tabIndexNotifier,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: widget.drawerTap,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.blue,
                ),
              ),
              const CustomLogo(),
              IconButton(
                onPressed: () async {},
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          ValueListenableBuilder<int>(
            valueListenable: widget.tabIndexNotifier,
            builder: (context, index, _) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(1, 2),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CustomTabBar(
                      title: 'دریایی',
                      isShowLine: widget.tabIndexNotifier.value == 0,
                      onTap: () => widget.tabIndexNotifier.value = 0,
                      child: Icon(
                        Icons.waves,
                        color: widget.tabIndexNotifier.value == 0
                            ? Colors.black87
                            : Colors.black54,
                      ),
                    ),
                    CustomTabBar(
                      icon: Icons.home,
                      title: 'بندری',
                      isShowLine: widget.tabIndexNotifier.value == 1,
                      onTap: () => widget.tabIndexNotifier.value = 1,
                    ),
                    CustomTabBar(
                      title: 'مانیتورینگ 360',
                      isShowLine: widget.tabIndexNotifier.value == 2,
                      onTap: () => widget.tabIndexNotifier.value = 2,
                      icon: Icons.star,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

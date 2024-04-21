import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/helper.dart';

class HomeItems extends StatelessWidget {
  final Color color;
  final String text;
  final Color? textColor;
  final String? routeName;
  final VoidCallback? onTap;
  final double? fontSize;
  final double? margin;
  final Widget child;
  final int? badgeCount;
  final Object? arguments;
  final HomeItemStatus status;

  const HomeItems({
    super.key,
    required this.color,
    required this.text,
    this.textColor,
    this.routeName,
    this.fontSize,
    this.margin,
    required this.child,
    this.onTap,
    this.badgeCount,
    this.arguments,
    this.status = HomeItemStatus.active,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = (status == HomeItemStatus.inactive);
    final bool isHidden = (status == HomeItemStatus.hidden);

    return isHidden
        ? const SizedBox()
        : Badge(
            label: isDisabled
                ? const Text(
                    'بزودی',
                    style: TextStyle(
                      fontSize: 9,
                    ),
                  )
                : Text(
                    '$badgeCount',
                  ),
            isLabelVisible: badgeCount != null || isDisabled,
            alignment: isDisabled ? Alignment.bottomCenter : Alignment.topRight,
            offset: isDisabled ? const Offset(-7, -20) : const Offset(-10, -5),
            child: SizedBox(
              width: 80,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: isDisabled
                    ? () {
                        Helper.showToast(
                          title: 'بزودی',
                          description: 'این بخش بزودی رونمایی خواهد شد',
                          context: context,
                        );
                      }
                    : onTap ??
                        () => Navigator.pushNamed(
                              context,
                              routeName ?? '',
                              arguments: arguments,
                            ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: margin ?? 20),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isDisabled ? Colors.grey : color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: child,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSize ?? 12,
                        color: (textColor ?? Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

enum HomeItemStatus { active, inactive, hidden }

import 'package:flutter/material.dart';
import 'package:porduct_owner/core/core.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../widget/home_items.dart';

class PortPage extends StatefulWidget {
  const PortPage({
    super.key,
  });

  @override
  State<PortPage> createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<PortPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      horizontalGridMargin: 12,
      verticalGridMargin: 24,
      listViewBuilderOptions: ListViewBuilderOptions(
        shrinkWrap: true,
      ),
      minItemWidth: 80,
      rowMainAxisAlignment: MainAxisAlignment.start,
      minItemsPerRow: 4,
      children: const [
        HomeItems(
          routeName: Routes.home,
          color: Colors.indigo,
          text: "رصد عملیات",
          child: Icon(
            Icons.monitor,
            color: Colors.white,
          ),
        ),
        HomeItems(
          routeName: Routes.bills,
          color: Colors.orange,
          text: "پیش فاکتور ها",
          child: Icon(
            Icons.receipt_rounded,
            color: Colors.white,
          ),
        ),
        HomeItems(
          routeName: Routes.services,
          color: Colors.deepPurpleAccent,
          text: "درخواست خدمات",
          child: Icon(
            Icons.home_repair_service,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

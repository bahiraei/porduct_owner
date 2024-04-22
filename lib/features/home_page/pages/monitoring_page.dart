import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class MonitoringPage extends StatefulWidget {
  const MonitoringPage({
    super.key,
  });

  @override
  State<MonitoringPage> createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
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
      children: const [],
    );
  }
}

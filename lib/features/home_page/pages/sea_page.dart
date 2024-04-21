import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../widget/home_items.dart';

class SeaPage extends StatefulWidget {
  const SeaPage({
    super.key,
  });

  @override
  State<SeaPage> createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<SeaPage> {
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

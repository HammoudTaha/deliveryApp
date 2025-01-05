import 'package:delivaryapp/features/orderStatus/widgets/custom_endtimeline_item.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomFirstTimeLineItem extends StatelessWidget {
  const CustomFirstTimeLineItem({
    super.key,
    this.color = Colors.grey,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TimelineTile(
        isFirst: true,
        afterLineStyle: LineStyle(
          color: color,
          thickness: 2,
        ),
        indicatorStyle: IndicatorStyle(
          color: color,
          width: 18,
          padding: const EdgeInsets.only(
            right: 20,
          ),
        ),
        endChild: const Padding(
          padding: EdgeInsets.only(top: 45),
          child: CustomEndTimeLineItem(
            index: 7,
          ),
        ),
      ),
    );
  }
}

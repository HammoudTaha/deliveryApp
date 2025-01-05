import 'package:delivaryapp/features/orderStatus/widgets/custom_endtimeline_item.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomMidTimeListItem extends StatelessWidget {
  const CustomMidTimeListItem({
    super.key,
    this.color = Colors.grey,
    required this.index,
  });
  final Color color;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TimelineTile(
        alignment: TimelineAlign.start,
        afterLineStyle: LineStyle(
          color: color,
          thickness: 2,
        ),
        beforeLineStyle: LineStyle(
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
        endChild: Padding(
          padding: const EdgeInsets.only(top: 45),
          child: CustomEndTimeLineItem(
            index: index,
          ),
        ),
      ),
    );
  }
}

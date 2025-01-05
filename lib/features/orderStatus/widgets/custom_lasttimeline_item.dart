import 'package:delivaryapp/features/orderStatus/widgets/custom_endtimeline_item.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomLastTimeLineItem extends StatelessWidget {
  const CustomLastTimeLineItem({
    super.key,
    this.color = Colors.grey,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: TimelineTile(
          alignment: TimelineAlign.start,
          isLast: true,
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
          endChild: const Padding(
            padding: EdgeInsets.only(top: 45),
            child: CustomEndTimeLineItem(
              index: 0,
            ),
          )),
    );
  }
}

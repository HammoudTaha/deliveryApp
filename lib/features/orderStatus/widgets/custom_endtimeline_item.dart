import 'package:delivaryapp/features/orderStatus/widgets/timeline_widget.dart';
import 'package:flutter/material.dart';

class CustomEndTimeLineItem extends StatelessWidget {
  const CustomEndTimeLineItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          status[index].title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          status[index].time,
          style: const TextStyle(
            color: Colors.black38,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          status[index].description,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

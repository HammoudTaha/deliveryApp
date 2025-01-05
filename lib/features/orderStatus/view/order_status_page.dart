import 'package:delivaryapp/features/orderStatus/widgets/custom_firsttimeline_item.dart';
import 'package:delivaryapp/features/orderStatus/widgets/custom_lasttimeline_item.dart';
import 'package:delivaryapp/features/orderStatus/widgets/custom_midtimeline_item.dart';
import 'package:flutter/material.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({super.key});
  static const String id = 'order_status_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Status'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF9E6EC),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        child: ListView(
          children: [
            const CustomFirstTimeLineItem(
              color: Colors.amber,
            ),
            for (int i = 6; i > 0; i--)
              CustomMidTimeListItem(
                color: Colors.amber,
                index: i,
              ),
            const CustomLastTimeLineItem(
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}

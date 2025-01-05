import 'package:delivaryapp/features/orderDelails/widgets/custom_delivery_details.dart';
import 'package:delivaryapp/features/orderDelails/widgets/custom_ordersid_item.dart';
import 'package:delivaryapp/features/orderDelails/widgets/custom_payments_details.dart';
import 'package:delivaryapp/features/orderDelails/widgets/custom_product_item_order.dart';
import 'package:flutter/material.dart';

class OrderDatailsPage extends StatelessWidget {
  const OrderDatailsPage({super.key});
  static const String id = 'order_details_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: ListView(
          children: [
            const CustomOrderStatusDateIdItem(),
            const SizedBox(height: 20),
            for (int i = 0; i < 2; i++)
              const Padding(
                padding: EdgeInsets.only(bottom: 13),
                child: CustomProductItemOrder(),
              ),
            const CustomDeliveryDetails(),
            const SizedBox(height: 13),
            const CustomPaymentsDetails(),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}

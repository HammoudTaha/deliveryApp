import 'package:delivaryapp/features/paymenets/widgets/custom_change_address.dart';
import 'package:delivaryapp/features/paymenets/widgets/payments_methods.dart';
import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});
  static const String id = 'payments_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paymets'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' Shipping to',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            CustomChangeAddress(),
            SizedBox(
              height: 15,
            ),
            Text(
              'Credit Card',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: PaymentsMethods(),
            )
          ],
        ),
      ),
    );
  }
}

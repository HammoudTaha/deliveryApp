import 'package:delivaryapp/features/orderDelails/view/order_detalis_page.dart';
import 'package:delivaryapp/features/orders/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});
  static const String id = 'orders_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 3),
                    color: Color(0xffCACACA),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order id : 478chdt5',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '7th May 2024, 4:00 PM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black26,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Items : 7 Products',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'order Completed',
                        style: TextStyle(
                          color: Color(0xff01E408),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Text(
                        'Total Payments : ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '\$ 593',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomIconButton(
                        color: const Color(0xff3DF242),
                        icon: Icons.edit,
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      CustomIconButton(
                        color: const Color(0xffCA1F13),
                        icon: Icons.delete,
                        onTap: () {},
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, OrderDatailsPage.id);
                        },
                        child: const Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

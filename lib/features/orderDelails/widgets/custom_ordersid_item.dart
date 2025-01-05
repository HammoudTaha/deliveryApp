import 'package:delivaryapp/features/orderStatus/view/order_status_page.dart';
import 'package:flutter/material.dart';

class CustomOrderStatusDateIdItem extends StatelessWidget {
  const CustomOrderStatusDateIdItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFBE7E6),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Status',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Order Completed',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff375C89),
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, OrderStatusPage.id);
                },
                child: const Text(
                  'View Status',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff375C89),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 4),
          const Divider(color: Colors.black),
          const SizedBox(height: 4),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ordered Date :',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '7th May 2024  1:40 AM',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff375C89),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Divider(color: Colors.black),
          const SizedBox(height: 4),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Id :',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '89h4h80mx57g7mnc75',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff375C89),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

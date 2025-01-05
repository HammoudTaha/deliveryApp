import 'package:flutter/material.dart';

class CustomPaymentsDetails extends StatelessWidget {
  const CustomPaymentsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              Text(
                'Cash on Delivery',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff375C89),
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(height: 3),
          Divider(color: Colors.black),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price(4 items)',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              Text(
                '\$ 100.0',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff375C89),
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Fee',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              Text(
                '\$ 10.0',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff375C89),
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discounts',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              Text(
                '\$ 0.0',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff375C89),
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Taxes',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              Text(
                '\$ 0.0',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff375C89),
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(height: 3),
          Divider(color: Colors.black),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Payments',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\$ 0.0',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff375C89),
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

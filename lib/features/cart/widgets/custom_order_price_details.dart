import 'package:delivaryapp/features/cart/manger/bill.dart';
import 'package:delivaryapp/features/cart/manger/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomOrderPriceDetails extends StatelessWidget {
  const CustomOrderPriceDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Bill bill = context.watch<CartProvider>().bill;
    return Container(
      height: 165,
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailsPriceItem(
              name: 'Base Price',
              price: bill.basePrice,
            ),
            const SizedBox(height: 5),
            detailsPriceItem(
              name: 'Delivery Fee',
              price: bill.deliveryFee,
            ),
            const SizedBox(height: 5),
            detailsPriceItem(
              name: 'Taxes ',
              price: bill.taxes,
            ),
            const SizedBox(height: 5),
            detailsPriceItem(
              name: 'Discount ',
              price: bill.discount,
            ),
            const SizedBox(height: 5),
            const Divider(),
            const SizedBox(height: 5),
            detailsPriceItem(
              name: 'Total Price ',
              price: bill.totalPrice,
            ),
          ],
        ),
      ),
    );
  }
}

Widget detailsPriceItem({required String name, required double price}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
      Text(
        '\$ $price',
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
    ],
  );
}

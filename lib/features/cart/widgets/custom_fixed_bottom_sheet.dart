import 'package:delivaryapp/core/widgets/custom_button.dart';
import 'package:delivaryapp/features/cart/manger/cart_provider.dart';
import 'package:delivaryapp/features/cart/widgets/custom_order_price_details.dart';
import 'package:delivaryapp/features/paymenets/view/payments_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomFixedBottomSheet extends StatelessWidget {
  const CustomFixedBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Provider.of<CartProvider>(context).cartItems;
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 10,
        left: 40,
        right: 40,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFEF7FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black12,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                ' Order Details : ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                ' items : ${context.watch<CartProvider>().cartItems.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          const CustomOrderPriceDetails(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: 335,
              height: 50,
              child: CustomButton(
                name: 'Place Order',
                onPress: () {
                  Navigator.pushNamed(context, PaymentsPage.id);
                  //Navigator.pushNamed(context, AddressDeliveryPage.id);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

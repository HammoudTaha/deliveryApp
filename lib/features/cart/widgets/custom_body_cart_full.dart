import 'package:delivaryapp/core/models/cartModel/cart_model.dart';
import 'package:delivaryapp/features/cart/widgets/custom_fixed_bottom_sheet.dart';
import 'package:delivaryapp/features/cart/widgets/custom_item_cart.dart';
import 'package:flutter/material.dart';

class CustomBodyCartFull extends StatelessWidget {
  const CustomBodyCartFull({
    super.key,
    required this.cartIems,
  });

  final List<CartModel> cartIems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartIems.length,
            itemBuilder: (context, index) {
              return CustomItemCart(
                cartItem: cartIems[index],
              );
            },
          ),
        ),
        const CustomFixedBottomSheet()
      ],
    );
  }
}

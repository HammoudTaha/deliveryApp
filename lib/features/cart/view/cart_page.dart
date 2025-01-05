import 'package:delivaryapp/core/models/cartModel/cart_model.dart';
import 'package:delivaryapp/features/cart/manger/cart_provider.dart';
import 'package:delivaryapp/features/cart/widgets/custom_body_cart_empty.dart';
import 'package:delivaryapp/features/cart/widgets/custom_body_cart_full.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static const id = 'cart_page';

  @override
  Widget build(BuildContext context) {
    List<CartModel> cartItems = context.watch<CartProvider>().cartItems;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Cart',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: cartItems.isEmpty
          ? const CustomBodyCartEmpty()
          : CustomBodyCartFull(
              cartIems: cartItems,
            ),
    );
  }
}

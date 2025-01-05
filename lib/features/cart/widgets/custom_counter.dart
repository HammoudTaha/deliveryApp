import 'package:delivaryapp/core/models/cartModel/cart_model.dart';
import 'package:delivaryapp/core/utiles/helper_functions.dart';
import 'package:delivaryapp/features/cart/manger/cart_provider.dart';
import 'package:delivaryapp/features/cart/widgets/custom_counter_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCounter extends StatelessWidget {
  const CustomCounter({
    super.key,
    required this.itemCart,
  });
  final CartModel itemCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 80,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CustomCounterItem(
            color: const Color(0xff3DF242),
            icon: Icons.add,
            onTap: () {
              if ((itemCart.product.amount - itemCart.itemsCount) < 1) {
                customToast('No Product Item Available');
              } else {
                context.read<CartProvider>().plusItemCart(itemCart.id);
              }
            },
          ),
          const Spacer(),
          Text('${itemCart.itemsCount}'),
          const Spacer(),
          CustomCounterItem(
            color: const Color(0xffCA1F13),
            icon: Icons.remove,
            onTap: () {
              if (itemCart.itemsCount == 1) {
                customToast('Sorry, The items must be at least 1');
              } else {
                context.read<CartProvider>().minusItemCart(itemCart.id);
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:delivaryapp/core/models/cartModel/cart_model.dart';
import 'package:delivaryapp/core/utiles/custom_alert_dialog.dart';
import 'package:delivaryapp/core/utiles/helper_functions.dart';
import 'package:delivaryapp/features/cart/manger/cart_provider.dart';
import 'package:delivaryapp/features/cart/widgets/custom_counter.dart';
import 'package:delivaryapp/features/wishList/widgets/custom_delete_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart({
    super.key,
    required this.cartItem,
  });
  final CartModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 7,
      ),
      padding: const EdgeInsets.all(10),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: Colors.black12,
            offset: Offset(0, 3),
          ),
          BoxShadow(
            blurRadius: 3,
            color: Colors.black12,
            offset: Offset(1, 0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                cartItem.product.images[0],
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${cartItem.product.price}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'available ${cartItem.product.amount - cartItem.itemsCount} items',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff12F619),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCounter(
                      itemCart: cartItem,
                    ),
                    CustomDeleteItem(
                      padding: 2,
                      color: Colors.redAccent,
                      onTap: () {
                        customAlertDialog(
                            context: context,
                            yesFun: () {
                              context
                                  .read<CartProvider>()
                                  .deleteItemCart(cartItem.id);
                              customToast(
                                  'Product has been deleted from Shopping Cart');
                              Navigator.pop(context);
                            },
                            title: 'Delete From Shopping Cart',
                            msg:
                                'Are you sure to delete this. item from yourShopping Cart ?');
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

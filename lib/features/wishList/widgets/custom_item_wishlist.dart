import 'package:delivaryapp/core/models/cartModel/cart_model.dart';
import 'package:delivaryapp/core/models/wishListModel/wishlist_model.dart';
import 'package:delivaryapp/core/utiles/custom_alert_dialog.dart';
import 'package:delivaryapp/core/utiles/helper_functions.dart';
import 'package:delivaryapp/core/widgets/custom_out_of_stack_button.dart';
import 'package:delivaryapp/core/widgets/custom_outline_button.dart';
import 'package:delivaryapp/core/widgets/stars_rating.dart';
import 'package:delivaryapp/features/cart/manger/cart_notification_provider.dart';
import 'package:delivaryapp/features/cart/manger/cart_provider.dart';
import 'package:delivaryapp/features/productDetalis/view/product_details_page.dart';
import 'package:delivaryapp/features/stores/manger/store_provider.dart';
import 'package:delivaryapp/features/wishList/manger/wishlist_provider.dart';
import 'package:delivaryapp/features/wishList/widgets/custom_delete_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CustomItemWishList extends StatelessWidget {
  const CustomItemWishList({
    super.key,
    required this.wishListItem,
  });
  final WishListModel wishListItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Colors.black12,
              offset: Offset(0, 3),
              blurStyle: BlurStyle.normal,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductDetailsPage.id);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      wishListItem.product.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wishListItem.product.name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\$ ${wishListItem.product.price}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    StarsRating(rating: wishListItem.product.rating),
                    const SizedBox(height: 4),
                    Text(
                      '${wishListItem.product.sales} Sales',
                      style: const TextStyle(
                        color: Colors.black38,
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomDeleteItem(
                onTap: () {
                  customAlertDialog(
                    context: context,
                    title: 'Delete From Wishlist',
                    msg:
                        'Are you sure to delete this item from your wishlist ?',
                    yesFun: () {
                      context
                          .read<WishListProvider>()
                          .removeFromWishList(wishListItem.id);
                      context.read<StoreProvider>().changeFivrateProduct(
                          wishListItem.product.storeId,
                          wishListItem.product.id);
                      customToast('Product has been deleted from WishList');
                      Navigator.pop(context);
                    },
                  );
                },
                padding: 4,
                color: const Color(0xff656565),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: wishListItem.product.amount != 0
                    ? CustomOutlineButton(
                        fontSize: 15,
                        text: 'Add to Shopping Cart',
                        colorBorder: const Color(0xff0EAACD),
                        onTap: () {
                          if (!context
                              .read<CartProvider>()
                              .isProductFoundInCart(wishListItem.product.id)) {
                            context
                                .read<CartNotificationProvider>()
                                .setNewValue();
                            context.read<CartProvider>().addItemToCart(
                                  CartModel(
                                    id: const Uuid().v8(),
                                    itemsCount: 1,
                                    product: wishListItem.product,
                                  ),
                                );
                            customToast(
                                'Product has been added to Shopping Cart');
                          } else {
                            customToast(
                                'Product has been added to Shopping Cart');
                          }
                        },
                      )
                    : const CustomOutOfStackButton(
                        fontSize: 15,
                        height: 35,
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

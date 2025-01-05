import 'package:delivaryapp/core/models/cartModel/cart_model.dart';
import 'package:delivaryapp/core/models/productModel/product_model.dart';
import 'package:delivaryapp/core/models/wishListModel/wishlist_model.dart';
import 'package:delivaryapp/core/utiles/helper_functions.dart';
import 'package:delivaryapp/core/widgets/custom_image_slider.dart';
import 'package:delivaryapp/core/widgets/custom_out_of_stack_button.dart';
import 'package:delivaryapp/core/widgets/custom_outline_button.dart';
import 'package:delivaryapp/features/cart/manger/cart_notification_provider.dart';
import 'package:delivaryapp/features/cart/manger/cart_provider.dart';
import 'package:delivaryapp/features/home/widgets/custom_home_appbar.dart';
import 'package:delivaryapp/features/productDetalis/widgets/custom_in_out_stack.dart';
import 'package:delivaryapp/features/stores/manger/store_provider.dart';
import 'package:delivaryapp/features/wishList/manger/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});
  static const id = 'product_details';
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    Provider.of<StoreProvider>(context).getProduct(product.storeId, product.id);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomHomeAppBar(
            isHasBack: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomImageSilder(
              images: product.images,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey.shade200,
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (product.isFavorite) {
                            context
                                .read<WishListProvider>()
                                .removeFromWishList(product.id);
                          } else {
                            context.read<WishListProvider>().addToWishList(
                                  WishListModel(
                                    id: const Uuid().v8(),
                                    product: product,
                                  ),
                                );
                          }
                          context.read<StoreProvider>().changeFivrateProduct(
                              product.storeId, product.id);
                        },
                        icon: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'available ${product.amount} items',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      product.amount > 0
                          ? const CustomInOutStack(
                              color: Color(0xff12F619),
                              text: 'In Stack',
                            )
                          : const CustomInOutStack(
                              color: Colors.red,
                              text: 'Out Of Stack',
                            ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 22,
                        ),
                        Text(
                          ' ${product.rating}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const VerticalDivider(
                          thickness: 1.5,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${product.sales}  Sales',
                          style: const TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const VerticalDivider(thickness: 1.5),
                        const SizedBox(width: 10),
                        Text(
                          '${product.reviewers}  reviews',
                          style: const TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        '\$ ${product.price}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                      const Text(
                        '  (floor price)',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'About me',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -2),
                  color: Colors.black12,
                  blurRadius: 3,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 12,
            ),
            child: product.amount == 0
                ? const CustomOutOfStackButton(
                    fontSize: 18,
                  )
                : CustomOutlineButton(
                    text: 'Add to Shopping Cart',
                    fontSize: 18,
                    colorBorder: const Color(0xff0EAACD),
                    onTap: () {
                      if (!context
                          .read<CartProvider>()
                          .isProductFoundInCart(product.id)) {
                        context.read<CartNotificationProvider>().setNewValue();
                        context.read<CartProvider>().addItemToCart(
                              CartModel(
                                id: const Uuid().v8(),
                                itemsCount: 1,
                                product: product,
                              ),
                            );
                        customToast('Product has been added to Shopping Cart');
                      } else {
                        customToast(
                            'Product already has been added to Shopping Cart');
                      }
                    },
                  ),
          )
        ],
      ),
    );
  }
}

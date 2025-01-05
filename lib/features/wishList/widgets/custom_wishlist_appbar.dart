import 'package:delivaryapp/features/cart/manger/cart_notification_provider.dart';
import 'package:delivaryapp/features/cart/view/cart_page.dart';
import 'package:delivaryapp/features/home/widgets/custom_home_appbar.dart';
import 'package:delivaryapp/features/wishList/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomWishListAppBar extends StatelessWidget {
  const CustomWishListAppBar({
    super.key,
    required this.text,
    this.titie,
    this.ishasBack = false,
  });
  final String? titie;
  final String text;
  final bool ishasBack;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              children: [
                ishasBack
                    ? Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                          ),
                        ),
                      )
                    : const SizedBox(),
                Text(
                  titie ?? text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                CustomBadge(
                  itemsNewestAddedToCart: context
                      .watch<CartNotificationProvider>()
                      .itemsNewestAddedToCart,
                  child: InkWell(
                    onTap: () {
                      context.read<CartNotificationProvider>().resetValue();
                      Navigator.pushNamed(context, CartPage.id);
                    },
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {},
                  child: const Icon(Icons.notifications),
                )
              ],
            ),
            const SizedBox(height: 5),
            CustomTextField(
              hint: 'Search $text',
            ),
          ],
        ),
      ),
    );
  }
}

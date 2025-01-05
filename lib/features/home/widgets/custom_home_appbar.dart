import 'package:delivaryapp/features/cart/manger/cart_notification_provider.dart';
import 'package:delivaryapp/features/cart/view/cart_page.dart';
import 'package:delivaryapp/features/notifications/view/notifications_page.dart';
import 'package:delivaryapp/features/search/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
    this.isHasBack = false,
  });
  final bool isHasBack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SearchPage.id);
      },
      child: Container(
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            bottom: 8,
          ),
          child: Row(
            children: [
              isHasBack
                  ? InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 7,
                          left: 8,
                        ),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    )
                  : const SizedBox(
                      width: 12.0,
                      height: 0.0,
                    ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 35,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search Product',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7, right: 7),
                    child: Row(
                      children: [
                        CustomBadge(
                          itemsNewestAddedToCart: context
                              .watch<CartNotificationProvider>()
                              .itemsNewestAddedToCart,
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<CartNotificationProvider>()
                                  .resetValue();
                              Navigator.pushNamed(context, CartPage.id);
                            },
                            child: const Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                              size: 22,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, NotificationsPage.id);
                          },
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.black,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
    required this.child,
    required this.itemsNewestAddedToCart,
  });

  final Widget child;
  final int itemsNewestAddedToCart;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        itemsNewestAddedToCart != 0
            ? Positioned(
                right: -6,
                top: -10,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '$itemsNewestAddedToCart',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

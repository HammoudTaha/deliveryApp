import 'package:delivaryapp/core/models/wishListModel/wishlist_model.dart';
import 'package:delivaryapp/features/wishList/widgets/custom_item_wishlist.dart';
import 'package:delivaryapp/features/wishList/widgets/custom_wishlist_appbar.dart';
import 'package:flutter/material.dart';

class CustomFullBodyWishList extends StatelessWidget {
  const CustomFullBodyWishList({
    super.key,
    required this.wishListItems,
  });
  final List<WishListModel> wishListItems;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          const CustomWishListAppBar(
            text: 'WishList',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: wishListItems.length,
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomItemWishList(
                    wishListItem: wishListItems[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

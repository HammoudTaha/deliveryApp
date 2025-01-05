import 'package:delivaryapp/core/models/wishListModel/wishlist_model.dart';
import 'package:delivaryapp/features/wishList/manger/wishlist_provider.dart';
import 'package:delivaryapp/features/wishList/widgets/custom_empty_body_wishlist.dart';
import 'package:delivaryapp/features/wishList/widgets/custom_full_body_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<WishListModel> wishListItems =
        context.watch<WishListProvider>().wishlistItems;
    return wishListItems.isEmpty
        ? const CustomEmptyBodyWishList()
        : CustomFullBodyWishList(
            wishListItems: wishListItems,
          );
  }
}

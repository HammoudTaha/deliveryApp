import 'package:delivaryapp/core/models/wishListModel/wishlist_model.dart';
import 'package:delivaryapp/features/stores/manger/store_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListProvider extends ChangeNotifier {
  final List<WishListModel> _wishlistItems = [];
  List<WishListModel> get wishlistItems {
    return _wishlistItems;
  }

  void fetchFavoriteProducts(BuildContext context) {
    _wishlistItems.addAll(
      context.read<StoreProvider>().sortFavoriteProducts(),
    );
  }

  void addToWishList(WishListModel product) {
    _wishlistItems.add(product);
    notifyListeners();
  }

  void removeFromWishList(String id) {
    _wishlistItems.removeWhere(
      (element) {
        return element.id == id;
      },
    );
    notifyListeners();
  }
}

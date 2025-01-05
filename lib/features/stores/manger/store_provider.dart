import 'package:delivaryapp/core/models/productModel/product_model.dart';
import 'package:delivaryapp/core/models/storeModel/store_model.dart';
import 'package:delivaryapp/core/models/wishListModel/wishlist_model.dart';
import 'package:delivaryapp/features/stores/manger/stores.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class StoreProvider extends ChangeNotifier {
  List<StoreModel> _stores = [];

  List<StoreModel> get stores {
    return _stores;
  }

  StoreModel getStore(String id) {
    return _stores.firstWhere(
      (element) {
        return element.id == id;
      },
    );
  }

  ProductModel getProduct(String storeId, String id) {
    return getStore(storeId).products.firstWhere(
      (element) {
        return element.id == id;
      },
    );
  }

  void fetchStores() {
    _stores = allStroes;
  }

  List<WishListModel> sortFavoriteProducts() {
    List<WishListModel> favoriteProducts = [];
    for (var store in _stores) {
      List<ProductModel> products = store.products
          .where(
            (element) => element.isFavorite,
          )
          .toList();
      for (var product in products) {
        favoriteProducts.add(
          WishListModel(
            id: const Uuid().v8(),
            product: product,
          ),
        );
      }
    }
    return favoriteProducts;
  }

  void removeItemProduct(String storeId, String productId, int itemsCount) {
    getProduct(storeId, productId).amount -= itemsCount;
    notifyListeners();
  }

  void addItemProduct(String storeId, String productId, int itemsCount) {
    getProduct(storeId, productId).amount += itemsCount;
    notifyListeners();
  }

  void changeFivrateProduct(String storeId, String productId) {
    getProduct(storeId, productId).isFavorite =
        !getProduct(storeId, productId).isFavorite;
    notifyListeners();
  }
}

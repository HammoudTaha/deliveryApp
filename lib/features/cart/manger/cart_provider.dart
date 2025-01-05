import 'package:delivaryapp/core/models/cartModel/cart_model.dart';
import 'package:delivaryapp/features/cart/manger/bill.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _cartItems = [];
  final Bill _bill = Bill();
  List<CartModel> get cartItems {
    return _cartItems;
  }

  Bill get bill {
    return _bill;
  }

  void addItemToCart(CartModel cartItem) {
    _cartItems.add(cartItem);
    _bill.basePrice += cartItem.product.price;
    _bill.totalPrice += cartItem.product.price;
    notifyListeners();
  }

  void plusItemCart(String id) {
    CartModel cartItem = _cartItems.firstWhere(
      (element) {
        return element.id == id;
      },
    );
    cartItem.itemsCount++;
    _bill.basePrice += cartItem.product.price;
    _bill.totalPrice += cartItem.product.price;
    notifyListeners();
  }

  void minusItemCart(String id) {
    CartModel cartItem = _cartItems.firstWhere(
      (element) {
        return element.id == id;
      },
    );
    cartItem.itemsCount--;
    _bill.basePrice -= cartItem.product.price;
    _bill.totalPrice -= cartItem.product.price;
    notifyListeners();
  }

  void deleteItemCart(String id) {
    CartModel cartItem = _cartItems.firstWhere(
      (element) {
        return element.id == id;
      },
    );
    _bill.basePrice -= cartItem.product.price * cartItem.itemsCount;
    _bill.totalPrice -= cartItem.product.price * cartItem.itemsCount;
    _cartItems.removeWhere(
      (element) {
        return element.id == id;
      },
    );
    notifyListeners();
  }

  bool isProductFoundInCart(String productId) {
    for (var cartItem in _cartItems) {
      if (cartItem.product.id == productId) return true;
    }
    return false;
  }
}

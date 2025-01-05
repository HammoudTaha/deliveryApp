import 'package:flutter/material.dart';

class CartNotificationProvider extends ChangeNotifier {
  int _itemsNewestAddedToCart = 0;
  int get itemsNewestAddedToCart {
    return _itemsNewestAddedToCart;
  }

  void setNewValue() {
    _itemsNewestAddedToCart++;
    notifyListeners();
  }

  void resetValue() {
    _itemsNewestAddedToCart = 0;
    notifyListeners();
  }
}

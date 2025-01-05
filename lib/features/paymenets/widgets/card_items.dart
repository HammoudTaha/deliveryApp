import 'package:delivaryapp/core/models/cardModel/card_model.dart';
import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  CardModel _card = CardModel(
    cardNumber: 45555555,
    cardHolderName: 'Hammoud Taha',
    cvv: 4543,
    expDate: '1/1/2025',
  );

  CardModel get card {
    return _card;
  }

  void setCard(CardModel card) {
    _card = card;
    notifyListeners();
  }
}

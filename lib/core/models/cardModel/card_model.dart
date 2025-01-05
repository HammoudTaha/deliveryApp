class CardModel {
  final int cardNumber;
  final String cardHolderName;
  final int cvv;
  final String expDate;
  final double amount;

  CardModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.cvv,
    required this.expDate,
    this.amount = 500.0,
  });
}

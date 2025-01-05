class Bill {
  double basePrice;
  double deliveryFee;
  double taxes;
  double discount;
  double totalPrice;
  Bill({
    this.basePrice = 0.0,
    this.deliveryFee = 5.0,
    this.discount = 0.0,
    this.taxes = 1.0,
    this.totalPrice = 6.0,
  });
}

import 'package:delivaryapp/core/models/orderModel/payments_enum.dart';
import 'package:flutter/material.dart';

class Payments {
  final double basePrcie;
  final double deliveryFee;
  final double discount;
  final double taxes;
  final PaymentMethods paymentMesthod;
  final Card? card;
  Payments({
    required this.basePrcie,
    required this.deliveryFee,
    required this.discount,
    required this.taxes,
    required this.paymentMesthod,
    this.card,
  });
}

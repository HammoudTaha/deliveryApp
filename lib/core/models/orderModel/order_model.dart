import 'package:delivaryapp/core/models/addressModel/address_model.dart';
import 'package:delivaryapp/core/models/cartModel/cart_model.dart';
import 'package:delivaryapp/core/models/orderModel/order_status_enum.dart';
import 'package:delivaryapp/core/models/orderModel/payments.dart';

class OrderModel {
  final String id;
  final String orderDate;
  final OrderStatus status;
  final int itemsNumber;
  final List<CartModel> items;
  final AddressModel address;
  final Payments payments;

  OrderModel({
    required this.id,
    required this.orderDate,
    required this.status,
    required this.itemsNumber,
    required this.items,
    required this.address,
    required this.payments,
  });
}

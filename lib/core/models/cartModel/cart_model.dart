import 'package:delivaryapp/core/models/productModel/product_model.dart';

class CartModel {
  final String id;
  final ProductModel product;
  int itemsCount;
  CartModel({
    required this.id,
    required this.product,
    required this.itemsCount,
  });
}

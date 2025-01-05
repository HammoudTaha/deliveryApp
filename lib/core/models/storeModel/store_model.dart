import 'package:delivaryapp/core/models/productModel/product_model.dart';
import 'package:delivaryapp/core/models/storeModel/store_address.dart';
import 'package:delivaryapp/core/models/storeModel/store_enum_type.dart';

class StoreModel {
  final String id;
  final String name;
  final String imageUrl;
  final StoreAddress location;
  final List<ProductModel> products;
  final String description;
  final double rating;
  final ProductType type;
  StoreModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.products,
    required this.location,
    required this.description,
    required this.rating,
    required this.type,
  });
}

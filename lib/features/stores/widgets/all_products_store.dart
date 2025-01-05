import 'package:delivaryapp/core/models/productModel/product_model.dart';
import 'package:delivaryapp/features/home/widgets/product_item.dart';
import 'package:flutter/material.dart';

class AllProductsStore extends StatelessWidget {
  const AllProductsStore({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .77,
        crossAxisSpacing: 25,
        mainAxisSpacing: 20,
      ),
      itemCount: products.length,
      padding: const EdgeInsets.only(),
      itemBuilder: (context, index) {
        return ProductItem(
          product: products[index],
        );
      },
    );
  }
}

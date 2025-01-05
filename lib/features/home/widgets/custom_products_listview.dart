import 'package:delivaryapp/core/models/productModel/product_model.dart';
import 'package:delivaryapp/features/home/widgets/product_item.dart';
import 'package:flutter/material.dart';

class CustomProductsListView extends StatelessWidget {
  const CustomProductsListView({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: onTap,
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: AspectRatio(
                  aspectRatio: .68,
                  child: ProductItem(
                    product: ProductModel(
                      id: '0',
                      storeId: '0',
                      name: 'Shoes Waman',
                      description:
                          '''The main purpose of texture units is to allow us to use more than 1 texture in our shaders. By assigning texture units to the samplers, we can bind to multiple textures at once as long as we activate the corresponding texture unit ﬁrst. Just like glBindTexturewe can activate texture units using glActiveTexturepassing in the texture unit we’d like to use. ''',
                      images: [
                        'assets/images/shoes/S1.png',
                        'assets/images/shoes/S2.png',
                        'assets/images/shoes/S3.png',
                      ],
                      price: 457.7,
                      sales: 34,
                      reviewers: 566,
                      isFavorite: true,
                      amount: 7,
                      rating: 3.4,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:delivaryapp/core/models/storeModel/store_model.dart';
import 'package:delivaryapp/core/widgets/stars_rating.dart';
import 'package:delivaryapp/features/stores/widgets/all_products_store.dart';
import 'package:flutter/material.dart';

class StoreDetailsPage extends StatelessWidget {
  const StoreDetailsPage({super.key});
  static const String id = 'stroe_details_page';

  @override
  Widget build(BuildContext context) {
    StoreModel store = ModalRoute.of(context)!.settings.arguments as StoreModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(store.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                store.imageUrl,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  store.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 20,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                        ' ${store.location.cityName}, ${store.location.townName}, ${store.location.streetName}, ${store.location.landmarkName}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            StarsRating(
                              rating: store.rating,
                            ),
                            Text(
                              ' ${store.rating}',
                              style: const TextStyle(
                                color: Colors.black38,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.share,
                              color: Colors.blueAccent,
                            ),
                            const SizedBox(width: 10)
                          ],
                        ),
                        const Divider(),
                        const Text(
                          'About us',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          store.description,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Our Products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            SliverFillRemaining(
              child: AllProductsStore(
                products: store.products,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:delivaryapp/core/models/storeModel/store_model.dart';
import 'package:delivaryapp/features/stores/manger/store_provider.dart';
import 'package:delivaryapp/features/stores/view/store_details_page.dart';
import 'package:delivaryapp/features/stores/view/stores_page.dart';
import 'package:delivaryapp/features/stores/widgets/custom_item_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomStoreListView extends StatelessWidget {
  const CustomStoreListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<StoreModel> stores = Provider.of<StoreProvider>(context).stores;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                ' Stores',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    StoresPage.id,
                    arguments: stores,
                  );
                },
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
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (stores.length / 2).toInt(),
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
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      StoreDetailsPage.id,
                      arguments: stores[index],
                    );
                  },
                  child: CustomStoreItem(
                    cityNmae: stores[index].location.cityName,
                    imageUrl: stores[index].imageUrl,
                    storeName: stores[index].name,
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

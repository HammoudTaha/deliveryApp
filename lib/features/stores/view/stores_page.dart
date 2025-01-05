import 'package:delivaryapp/core/models/storeModel/store_model.dart';
import 'package:delivaryapp/features/stores/view/store_details_page.dart';
import 'package:delivaryapp/features/stores/widgets/custom_item_store.dart';
import 'package:delivaryapp/features/wishList/widgets/custom_wishlist_appbar.dart';
import 'package:flutter/material.dart';

class StoresPage extends StatelessWidget {
  const StoresPage({super.key});
  static const String id = 'stores_page';

  @override
  Widget build(BuildContext context) {
    List<StoreModel> stores =
        ModalRoute.of(context)!.settings.arguments as List<StoreModel>;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
          bottom: 10,
        ),
        child: Column(
          children: [
            const CustomWishListAppBar(
              text: 'Store',
              titie: 'Stroes',
              ishasBack: true,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 15),
                itemCount: stores.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 150,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

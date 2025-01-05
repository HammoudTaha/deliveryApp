import 'package:delivaryapp/core/widgets/custom_image_slider.dart';
import 'package:delivaryapp/features/home/widgets/custom_home_appbar.dart';
import 'package:delivaryapp/features/home/widgets/custom_products_listview.dart';
import 'package:delivaryapp/features/home/widgets/custom_store_listview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = 'Home_Page';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeAppBar(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CustomImageSilder(
                    images: [
                      'assets/images/Furntures/F4.png',
                      'assets/images/Furntures/F5.png',
                      'assets/images/Furntures/F6.png',
                      'assets/images/Furntures/F8.png',
                      'assets/images/Furntures/F7.png',
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: CustomStoreListView(),
              ),
              SliverToBoxAdapter(
                child: CustomProductsListView(
                  onTap: () {},
                  text: 'Trending Products',
                ),
              ),
              SliverToBoxAdapter(
                child: CustomProductsListView(
                  onTap: () {},
                  text: 'Popular Products',
                ),
              ),
              SliverToBoxAdapter(
                child: CustomProductsListView(
                  onTap: () {},
                  text: 'Other Products',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

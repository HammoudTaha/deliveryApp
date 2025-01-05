import 'package:delivaryapp/features/home/view/home_page.dart';
import 'package:delivaryapp/features/orders/view/orders_page.dart';
import 'package:delivaryapp/features/profile/view/profile_page.dart';
import 'package:delivaryapp/features/stores/manger/store_provider.dart';
import 'package:delivaryapp/features/wishList/manger/wishlist_provider.dart';
import 'package:delivaryapp/features/wishList/view/wishlist_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const String id = 'main_page';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> items = [
    const Icon(
      Icons.home,
      size: 30,
    ),
    const Icon(
      Icons.favorite,
      size: 30,
    ),
    const Icon(
      Icons.receipt,
      size: 30,
    ),
    const Icon(
      Icons.person_2_outlined,
      size: 30,
    ),
  ];

  late PageController controller;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  @override
  void initState() {
    controller = PageController();
    context.read<StoreProvider>().fetchStores();
    context.read<WishListProvider>().fetchFavoriteProducts(context);
    super.initState();
  }

  void dsipose() {
    controller.dispose();
    super.dispose();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 500),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      curve: Curves.easeInOutCirc,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('Drawer'),
            ),
          ),
          Scaffold(
            body: PageView(
              controller: controller,
              children: const [
                HomePage(),
                WishListPage(),
                OrdersPage(),
                ProfilePage()
              ],
              onPageChanged: (value) {
                index = value;
                setState(() {});
              },
            ),
            bottomNavigationBar: CurvedNavigationBar(
              items: items,
              height: 60,
              backgroundColor: Colors.white,
              color: Colors.blue,
              index: index,
              onTap: (value) {
                index = value;
                controller.animateToPage(
                  value,
                  duration: const Duration(microseconds: 700),
                  curve: Curves.linear,
                );
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}

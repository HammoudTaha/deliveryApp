import 'package:delivaryapp/core/widgets/stars_rating.dart';
import 'package:delivaryapp/features/search/widgets/custom_lastsearch_item.dart';
import 'package:delivaryapp/features/wishList/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const id = 'search_page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> items = [
    'Ackdskb',
    'dfnuien',
    'rjir',
    'wehfbu',
    'ptnigrne',
    'etvekj',
    'xgmuyr',
    'smzygur',
    'hfmyvr',
    'trxngunu',
  ];
  final TextEditingController controller = TextEditingController();
  List<String> filteredItems = [];
  @override
  void initState() {
    controller.addListener(
      () {
        final searchItem = controller.text.toLowerCase();
        filteredItems.addAll(
          items.where(
            (element) {
              return element
                  .startsWith(searchItem.isEmpty ? ' ' : searchItem[0]);
            },
          ).toList(),
        );
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: CustomTextField(
                hint: 'Search a Product',
                controller: controller,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Last Search',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomSearchItem(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF0F0F0),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 4),
            color: Colors.black38,
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/shoes/S1.png',
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              Text(
                '\$ 23',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StarsRating(rating: 1.2),
                    Spacer(),
                    Text(
                      '456 sales',
                      style: TextStyle(),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

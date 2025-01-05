import 'package:flutter/material.dart';

class CustomEmptyBodyWishList extends StatelessWidget {
  const CustomEmptyBodyWishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WishList',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffFEF7FF),
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Center(
            child: Image.asset(
              'assets/images/empty/empty_wishlist.png',
              height: 250,
            ),
          ),
          const Text(
            'Your WishList is Empty',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

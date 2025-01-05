import 'package:flutter/material.dart';

class CustomStoreItem extends StatelessWidget {
  const CustomStoreItem({
    super.key,
    required this.imageUrl,
    required this.storeName,
    required this.cityNmae,
  });
  final String imageUrl;
  final String storeName;
  final String cityNmae;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xffF3DCE4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: Colors.black26,
            offset: Offset(0, 3),
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              imageUrl,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            storeName,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.amber,
                size: 20,
              ),
              Text(
                cityNmae,
              )
            ],
          )
        ],
      ),
    );
  }
}

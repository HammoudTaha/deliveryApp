import 'package:flutter/material.dart';

class CustomOnBoardingItem extends StatelessWidget {
  const CustomOnBoardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        Center(
          child: Image.asset(
            image,
            height: 250,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black45,
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}

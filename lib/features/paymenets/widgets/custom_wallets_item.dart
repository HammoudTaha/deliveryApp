import 'package:flutter/material.dart';

class CustomWalletItem extends StatelessWidget {
  const CustomWalletItem({
    super.key,
    required this.image,
    required this.text,
    this.onChange,
    required this.indexRadio,
    required this.index,
  });
  final String image;
  final String text;
  final void Function(int?)? onChange;
  final int indexRadio;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 12,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.grey.shade300,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            image,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Radio(
            activeColor: Colors.amber,
            value: index,
            groupValue: indexRadio,
            onChanged: onChange,
          )
        ],
      ),
    );
  }
}

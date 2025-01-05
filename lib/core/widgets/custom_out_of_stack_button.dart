import 'package:flutter/material.dart';

class CustomOutOfStackButton extends StatelessWidget {
  const CustomOutOfStackButton({
    super.key,
    required this.fontSize,
    this.height = 70,
  });
  final double fontSize;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        'Out of Stack',
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

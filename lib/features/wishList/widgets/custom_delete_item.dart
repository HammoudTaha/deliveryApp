import 'package:flutter/material.dart';

class CustomDeleteItem extends StatelessWidget {
  const CustomDeleteItem({
    super.key,
    required this.padding,
    required this.color,
    required this.onTap,
  });
  final double padding;
  final Color color;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.delete,
          color: color,
        ),
      ),
    );
  }
}

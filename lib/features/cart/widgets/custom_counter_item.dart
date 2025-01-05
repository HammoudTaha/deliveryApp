import 'package:flutter/material.dart';

class CustomCounterItem extends StatelessWidget {
  const CustomCounterItem({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        size: 22,
        color: color,
      ),
    );
  }
}

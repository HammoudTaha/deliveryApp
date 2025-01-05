import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    this.widget = const SizedBox(),
    required this.colorBorder,
    required this.text,
    required this.onTap,
    required this.fontSize,
  });

  final Widget widget;
  final Color colorBorder;
  final String text;
  final void Function() onTap;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: colorBorder,
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
                color: colorBorder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

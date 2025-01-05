import 'package:flutter/material.dart';

void customAlertDialog({
  required BuildContext context,
  required void Function() yesFun,
  required String title,
  required String msg,
}) {
  showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: const Color(0xffFFFFFF),
      titlePadding: const EdgeInsets.only(
        left: 20,
        top: 15,
      ),
      actionsPadding: const EdgeInsets.only(
        bottom: 5,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
      content: Text(
        msg,
        style: const TextStyle(
          color: Color(0xff808080),
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'NO',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        TextButton(
          onPressed: yesFun,
          child: const Text(
            'Yes',
            style: TextStyle(color: Colors.blueAccent),
          ),
        )
      ],
    ),
  );
}

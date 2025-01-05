import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
  });
  final String hint;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.blueAccent,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black54,
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        fillColor: const Color(0xffF0F0F0),
        filled: true,
      ),
    );
  }
}
///const Color(0xffE0E0E0)
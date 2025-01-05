import 'package:flutter/material.dart';

class CustomTextFieldAddressItem extends StatelessWidget {
  const CustomTextFieldAddressItem({
    super.key,
    required this.text,
    this.validate,
    this.keyboardType = TextInputType.name,
    required this.save,
  });
  final String text;
  final String? Function(String?)? validate;
  final TextInputType keyboardType;
  final void Function(String?) save;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "this field can't be empty";
        }
        return validate == null ? null : validate!(value);
      },
      onSaved: save,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: 'Enter $text',
        hintText: text,
        hintStyle: const TextStyle(
          color: Colors.black26,
          fontSize: 15,
        ),
        labelStyle: const TextStyle(color: Colors.black38),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black26,
            width: 1.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
            width: 1.5,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

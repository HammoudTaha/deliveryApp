import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CutomTextFormField extends StatefulWidget {
  const CutomTextFormField({
    super.key,
    required this.ledel,
    required this.hint,
    required this.preIcon,
    required this.exist,
    required this.onSave,
    required this.validator,
    required this.isExistFilter,
    this.textInputType = TextInputType.text,
  });
  final String ledel;
  final String hint;
  final IconData? preIcon;
  final bool exist;
  final void Function(String?)? onSave;
  final String? Function(String?)? validator;
  final bool isExistFilter;
  final TextInputType textInputType;

  @override
  State<CutomTextFormField> createState() => _CutomeTextFormFieldState();
}

class _CutomeTextFormFieldState extends State<CutomTextFormField> {
  bool isVisibile = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      obscureText: widget.exist ? !isVisibile : false,
      onSaved: widget.onSave,
      validator: widget.validator,
      inputFormatters: widget.isExistFilter
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: Color(0xff656565),
          fontWeight: FontWeight.normal,
        ),
        label: Text(
          widget.ledel,
        ),
        prefixIcon: Icon(widget.preIcon),
        suffixIcon: IconButton(
          onPressed: () {
            isVisibile = !isVisibile;
            setState(() {});
          },
          icon: Icon(!widget.exist
              ? null
              : isVisibile
                  ? Icons.visibility
                  : Icons.visibility_off),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.black87,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xff06AEAF),
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xff06AEAF),
            width: 1.3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}

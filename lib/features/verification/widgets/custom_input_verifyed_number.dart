import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputVerifedNumber extends StatelessWidget {
  const CustomInputVerifedNumber({
    super.key,
    required this.onSave,
  });

  final void Function(String?) onSave;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 65,
      child: TextFormField(
        textAlign: TextAlign.center,
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
          return null;
        },
        onSaved: onSave,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: Theme.of(context).textTheme.headlineLarge,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xff06AEAF),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

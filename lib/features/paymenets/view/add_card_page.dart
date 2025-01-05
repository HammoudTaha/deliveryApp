import 'package:delivaryapp/core/models/cardModel/card_model.dart';
import 'package:delivaryapp/core/widgets/custom_button.dart';
import 'package:delivaryapp/features/paymenets/widgets/card_items.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});
  static const String id = 'add_card_page';

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final GlobalKey<FormState> formStateKey = GlobalKey();
  String? cardNumber;
  String? cardHolderName;
  String? cvv;
  String? expDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Set New Card',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formStateKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CsutomTextFormFieldCardItem(
                text: ' Card Number',
                save: (value) {
                  cardNumber = value;
                },
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 15),
              CsutomTextFormFieldCardItem(
                text: ' Card Holder Name',
                save: (value) {
                  cardHolderName = value;
                },
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(
                    height: 110,
                    width: 175,
                    child: CsutomTextFormFieldCardItem(
                      text: ' CVV ',
                      keyboardType: TextInputType.number,
                      save: (value) {
                        cvv = value;
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  SizedBox(
                    height: 110,
                    width: 175,
                    child: CsutomTextFormFieldCardItem(
                      text: ' Expire Date',
                      keyboardType: TextInputType.datetime,
                      save: (value) {
                        expDate = value;
                      },
                      validate: (value) {
                        final DateFormat format = DateFormat('dd/MM/yyyy');
                        try {
                          final DateTime dateTime = format.parse(value!);
                          if (!DateTime.now().isBefore(dateTime)) {
                            return 'invalid date';
                          }
                        } on FormatException catch (_) {
                          return 'invalid date';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: CustomButton(
                  name: 'Set',
                  onPress: () {
                    if (formStateKey.currentState!.validate()) {
                      formStateKey.currentState!.save();
                      CardModel card = CardModel(
                          cardNumber: int.parse(cardNumber!),
                          cardHolderName: cardHolderName!,
                          cvv: int.parse(cvv!),
                          expDate: expDate!);
                      context.read<CardProvider>().setCard(card);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CsutomTextFormFieldCardItem extends StatelessWidget {
  const CsutomTextFormFieldCardItem({
    super.key,
    required this.text,
    this.validate,
    required this.keyboardType,
    required this.save,
  });
  final String text;
  final String? Function(String?)? validate;
  final TextInputType keyboardType;
  final void Function(String?) save;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          onSaved: save,
          validator: (value) {
            if (value!.isEmpty) {
              return "this field can't be empty";
            }
            return validate == null ? null : validate!(value);
          },
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: 'Enter$text',
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black12,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black12,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black12,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

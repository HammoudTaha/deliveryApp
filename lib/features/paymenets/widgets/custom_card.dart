import 'package:delivaryapp/core/models/cardModel/card_model.dart';
import 'package:delivaryapp/features/paymenets/view/add_card_page.dart';
import 'package:delivaryapp/features/paymenets/widgets/card_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.indexRadio,
    this.onChange,
  });
  final int indexRadio;
  final void Function(int?)? onChange;

  @override
  Widget build(BuildContext context) {
    CardModel card = Provider.of<CardProvider>(context).card;
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 40,
            child: Image.asset(
              'assets/images/mastercard.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mastercard ${card.cardNumber}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Expires on ${card.expDate}',
                style: const TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Radio(
                activeColor: Colors.amber,
                value: 0,
                groupValue: indexRadio,
                onChanged: onChange,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AddCardPage.id);
                },
                child: const Text(
                  'Set New Card',
                  style: TextStyle(
                    color: Color(0xff3DF242),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

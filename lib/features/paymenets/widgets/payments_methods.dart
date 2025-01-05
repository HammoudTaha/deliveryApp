import 'package:delivaryapp/core/utiles/wallets_info.dart';
import 'package:delivaryapp/features/paymenets/widgets/custom_card.dart';
import 'package:delivaryapp/features/paymenets/widgets/custom_wallets_item.dart';
import 'package:flutter/material.dart';

class PaymentsMethods extends StatefulWidget {
  const PaymentsMethods({super.key});

  @override
  State<PaymentsMethods> createState() => _PaymentsMethodsState();
}

class _PaymentsMethodsState extends State<PaymentsMethods> {
  int radioGroup = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 7),
        CustomCard(
          indexRadio: radioGroup,
          onChange: (value) {
            radioGroup = value!;
            setState(() {});
          },
        ),
        const SizedBox(height: 20),
        const Text(
          'Wallets',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CustomWalletItem(
                  image: images[index],
                  text: texts[index],
                  indexRadio: radioGroup,
                  onChange: (value) {
                    radioGroup = value!;
                    setState(() {});
                  },
                  index: index + 1,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

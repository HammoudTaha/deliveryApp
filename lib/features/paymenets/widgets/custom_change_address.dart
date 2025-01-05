import 'package:delivaryapp/core/models/addressModel/address_model.dart';
import 'package:delivaryapp/features/adressDelivery/view/address_delivery_page.dart';
import 'package:delivaryapp/features/adressDelivery/widgets/address_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomChangeAddress extends StatelessWidget {
  const CustomChangeAddress({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    AddressModel selectedAddress =
        Provider.of<SetAddressProvider>(context).selectedAddress;

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 3),
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xff3DF242),
            radius: 18,
            child: Icon(
              Icons.location_on,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            selectedAddress.addressName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AddressDeliveryPage.id);
            },
            child: const Text(
              'Change Addres',
              style: TextStyle(
                color: Color(0xff3DF242),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:delivaryapp/core/models/addressModel/address_model.dart';
import 'package:delivaryapp/core/widgets/custom_button.dart';
import 'package:delivaryapp/core/widgets/custom_outline_button.dart';
import 'package:delivaryapp/features/adressDelivery/view/add_address_page.dart';
import 'package:delivaryapp/features/adressDelivery/widgets/address_items.dart';
import 'package:delivaryapp/features/adressDelivery/widgets/custom_address_delivery_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AddressDeliveryPage extends StatefulWidget {
  const AddressDeliveryPage({super.key});
  static const String id = 'address_delivery_page';

  @override
  State<AddressDeliveryPage> createState() => _AddressDeliveryPageState();
}

class _AddressDeliveryPageState extends State<AddressDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    List<AddressModel> addresses =
        Provider.of<SetAddressProvider>(context).addresses;
    int selectedIndex =
        Provider.of<SetAddressProvider>(context).selectedAddress.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Address Delivery',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < addresses.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: InkWell(
                        onTap: () {
                          selectedIndex = i;
                          Provider.of<SetAddressProvider>(context,
                                  listen: false)
                              .setSelectedAddress(selectedIndex);
                          setState(() {});
                        },
                        child: CustomAddressDeliveryItem(
                          colorBody: selectedIndex != i
                              ? const Color(
                                  0xffF0F0F0,
                                )
                              : const Color(0xffFFF9EB),
                          colorBorder:
                              selectedIndex != i ? Colors.white : Colors.amber,
                          address: addresses[i],
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 50,
                    child: CustomOutlineButton(
                      text: 'Add New Address',
                      fontSize: 18,
                      colorBorder: Colors.amber,
                      widget: const Icon(Icons.add),
                      onTap: () {
                        Navigator.pushNamed(context, AddAddressPage.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              name: 'Procced Payments',
              onPress: () {},
            )
          ],
        ),
      ),
    );
  }
}

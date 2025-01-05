import 'package:delivaryapp/core/models/addressModel/address_model.dart';
import 'package:delivaryapp/features/adressDelivery/view/add_address_page.dart';
import 'package:delivaryapp/features/adressDelivery/widgets/address_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAddressDeliveryItem extends StatelessWidget {
  const CustomAddressDeliveryItem({
    super.key,
    required this.colorBody,
    required this.colorBorder,
    required this.address,
  });
  final Color colorBody;
  final Color colorBorder;
  final AddressModel address;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 153,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorBody,
        border: Border.all(
          color: colorBorder,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.purple,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                address.addressName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 40,
                child: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        height: 0,
                        onTap: () {
                          Provider.of<SetAddressProvider>(context,
                                  listen: false)
                              .deleteAddress(address.id);
                        },
                        child: const Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        height: 0,
                        onTap: () {
                          Navigator.pushNamed(context, AddAddressPage.id);
                        },
                        child: const Text(
                          'Eidt',
                          style: TextStyle(
                            color: Color(0xff1AF021),
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${address.buildingOrFlatNo}, ${address.streetName}, ${address.neighborhoodName}\n${address.neighborhoodName}, ${address.townName}, ${address.cityName}',
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Phone No : ${address.phoneNumber}',
            style: const TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

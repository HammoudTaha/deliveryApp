import 'package:delivaryapp/core/api%20services/api_services.dart';
import 'package:delivaryapp/core/models/addressModel/address_model.dart';
import 'package:delivaryapp/core/widgets/custom_button.dart';
import 'package:delivaryapp/features/adressDelivery/widgets/address_items.dart';
import 'package:delivaryapp/features/adressDelivery/widgets/custom_textfield.dart';
import 'package:delivaryapp/features/register/manger/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});
  static const id = 'set_address_page';

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final GlobalKey<FormState> formState = GlobalKey();
  int currentCity = 0;
  String? addressName;
  String? phoneNumber;
  String? flatOrBuildingNumber;
  String? neighborhoodName;
  String? streetName;
  String? landMarkname;
  String? townName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Addresss'),
      ),
      body: Form(
        key: formState,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextFieldAddressItem(
                  text: 'address name',
                  save: (value) {
                    addressName = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldAddressItem(
                  text: 'phone number',
                  keyboardType: TextInputType.phone,
                  save: (value) {
                    phoneNumber = value;
                  },
                  validate: (value) {
                    final regExp = RegExp(r'^09\d{8}$');
                    if (value != null && !regExp.hasMatch(value)) {
                      return 'invalid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldAddressItem(
                  text: 'flat, building number',
                  keyboardType: TextInputType.number,
                  save: (value) {
                    flatOrBuildingNumber = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldAddressItem(
                  text: 'street name',
                  keyboardType: TextInputType.streetAddress,
                  save: (value) {
                    streetName = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldAddressItem(
                  text: 'neighborhood name',
                  save: (value) {
                    neighborhoodName = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldAddressItem(
                  text: 'land mark name (optional)',
                  save: (value) {
                    landMarkname = value;
                  },
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldAddressItem(
                  text: 'town name',
                  save: (value) {
                    townName = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width - 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              cities[currentCity],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          DropdownButton<int>(
                            menuWidth: 225,
                            items: [
                              for (int i = 0; i < 14; i++)
                                DropdownMenuItem(
                                  value: i,
                                  child: Text(cities[i]),
                                ),
                            ],
                            onChanged: (value) {
                              currentCity = value!;
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  name: 'Submit',
                  onPress: () async {
                    if (formState.currentState!.validate()) {
                      formState.currentState!.save();
                      context.read<SetAddressProvider>().addAddress(
                            AddressModel(
                              id: context
                                  .read<SetAddressProvider>()
                                  .addresses
                                  .length,
                              addressName: addressName!,
                              buildingOrFlatNo: flatOrBuildingNumber!,
                              streetName: streetName!,
                              neighborhoodName: neighborhoodName!,
                              townName: townName!,
                              cityName: cities[currentCity],
                              phoneNumber: phoneNumber!,
                            ),
                          );
                      Navigator.pop(context);
                      // if (await ApiServices.addAddress(
                      //     address: AddressModel(
                      //       id: context
                      //           .read<SetAddressProvider>()
                      //           .addresses
                      //           .length,
                      //       addressName: addressName!,
                      //       buildingOrFlatNo: flatOrBuildingNumber!,
                      //       streetName: streetName!,
                      //       neighborhoodName: neighborhoodName!,
                      //       townName: townName!,
                      //       cityName: cities[currentCity],
                      //       phoneNumber: phoneNumber!,
                      //     ),
                      //     token: context.read<UserProvider>().user!.token!)) {
                      //   if (context.mounted) {
                      //     Navigator.pop(context);
                      //   }
                    }
                    // Provider.of<SetAddressProvider>(context, listen: false)
                    //     .addAddress(
                    //   AddressModel(
                    //     id: context
                    //         .read<SetAddressProvider>()
                    //         .addresses
                    //         .length,
                    //     addressName: addressName!,
                    //     buildingOrFlatNo: flatOrBuildingNumber!,
                    //     streetName: streetName!,
                    //     neighborhoodName: neighborhoodName!,
                    //     townName: townName!,
                    //     cityName: cities[currentCity],
                    //     phoneNumber: phoneNumber!,
                    //   ),
                    // );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

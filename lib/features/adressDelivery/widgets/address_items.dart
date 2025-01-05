import 'package:delivaryapp/core/models/addressModel/address_model.dart';
import 'package:flutter/material.dart';

class SetAddressProvider extends ChangeNotifier {
  final List<AddressModel> _addresses = [
    AddressModel(
        id: 0,
        addressName: 'Home',
        buildingOrFlatNo: '475445',
        streetName: 'Khalid Abn Al_Walid Street',
        neighborhoodName: 'Baramka ',
        landmarkName: 'Hetham Mosque',
        townName: 'Almozaah',
        cityName: 'Al-Raqqa',
        phoneNumber: '0948576456'),
    AddressModel(
        id: 1,
        addressName: 'Work',
        buildingOrFlatNo: '485',
        streetName: 'Al-Almasy streat',
        neighborhoodName: 'Mahajren',
        landmarkName: 'Gazza Highway',
        townName: 'Gazza',
        cityName: 'Alppo',
        phoneNumber: '0948647755'),
  ];
  AddressModel? _selectedAddress;
  AddressModel get selectedAddress {
    return _selectedAddress ?? _addresses[0];
  }

  void setSelectedAddress(int index) {
    _selectedAddress = _addresses[index];
    notifyListeners();
  }

  List<AddressModel> get addresses {
    return _addresses;
  }

  void addAddress(AddressModel address) {
    _addresses.add(address);
    notifyListeners();
  }

  void deleteAddress(int index) {
    _addresses.removeAt(index);
    notifyListeners();
  }
}

List<String> cities = [
  'Damascus',
  'Aleppo',
  'Al-Hasakah',
  'Al-Raqqah',
  "Al-Suwayda'",
  'Damascus Countryside',
  'Daraa',
  'Deir Al-Zor',
  'Hama',
  'Homs',
  'Idlib',
  'Latakia',
  'Tartus',
  'Quneitra',
];

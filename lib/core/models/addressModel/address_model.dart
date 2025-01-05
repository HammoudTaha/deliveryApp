class AddressModel {
  final int id;
  final String addressName;
  final String buildingOrFlatNo;
  final String streetName;
  final String neighborhoodName;
  final String? landmarkName;
  final String townName;
  final String cityName;
  final String phoneNumber;

  AddressModel({
    required this.id,
    required this.addressName,
    required this.buildingOrFlatNo,
    required this.streetName,
    required this.neighborhoodName,
    required this.townName,
    required this.cityName,
    required this.phoneNumber,
    this.landmarkName,
  });
}

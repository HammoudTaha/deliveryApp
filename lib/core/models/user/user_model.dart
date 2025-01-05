import 'dart:io';

class UserModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? password;
  String? code;
  File? imageProfile;
  String? token;
  UserModel({
    this.firstName,
    this.lastName,
    this.code,
    this.phoneNumber,
    this.password,
    this.imageProfile,
    this.token,
  });
}

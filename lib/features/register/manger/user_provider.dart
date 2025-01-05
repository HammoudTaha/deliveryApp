import 'dart:io';

import 'package:delivaryapp/core/api%20services/api_services.dart';
import 'package:delivaryapp/core/models/addressModel/address_model.dart';
import 'package:delivaryapp/core/models/user/user_model.dart';
import 'package:delivaryapp/core/widgets/custom_circle_indictoe_page.dart';
import 'package:delivaryapp/features/main/main_page.dart';
import 'package:delivaryapp/features/verification/view/verified_number.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user {
    return _user;
  }

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void setUserPropreties({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? password,
    String? code,
    File? imageProfile,
    AddressModel? address,
    String? token,
  }) {
    _user = _user == null
        ? UserModel(
            firstName: firstName,
            lastName: lastName,
            code: code,
            imageProfile: imageProfile,
            password: password,
            phoneNumber: phoneNumber,
            token: token,
          )
        : UserModel(
            token: token ?? _user!.token,
            firstName: firstName ?? _user!.firstName,
            lastName: lastName ?? _user!.lastName,
            code: code ?? _user!.code,
            imageProfile: imageProfile ?? _user!.imageProfile,
            password: password ?? _user!.password,
            phoneNumber: phoneNumber ?? _user!.phoneNumber,
          );
    notifyListeners();
  }

  void register(BuildContext context) async {
    Map<String, dynamic> result = await ApiServices.regsiter(
      user: _user!,
    );
    if (result.isNotEmpty) {
      if (context.mounted) {
        _user!.token = result['token'];
        Navigator.pushNamed(
          context,
          CustomCircleIndictorPage.id,
          arguments: Verfication.id,
        );
      }
    }
  }

  void login(BuildContext context) async {
    Map<String, dynamic> result = await ApiServices.login(user: _user!);
    if (result.isNotEmpty) {
      if (result['isVerified'] == 0) {
        if (context.mounted) {
          _user!.token = result['token'];
          Navigator.pushNamed(
            context,
            CustomCircleIndictorPage.id,
            arguments: Verfication.id,
          );
        }
      } else {
        if (context.mounted) {
          Navigator.pushNamed(
            context,
            CustomCircleIndictorPage.id,
            arguments: MainPage.id,
          );
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('loged in', true);
          await prefs.setString(
            'token',
            result['token'],
          );
        }
      }
    }
  }

  Future<bool> verifyNumber(BuildContext context) async {
    if (await ApiServices.verfiyNumber(
      user: _user!,
    )) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resendCode() async {
    return ApiServices.resendCode(user: _user!);
  }

  void resetPassword() {
    ApiServices.resetPassword(user: _user!);
  }
}

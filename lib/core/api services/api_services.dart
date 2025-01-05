import 'dart:convert';
import 'dart:io';

import 'package:delivaryapp/core/models/addressModel/address_model.dart';
import 'package:delivaryapp/core/models/user/user_model.dart';
import 'package:delivaryapp/core/utiles/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'http://10.0.2.2:8000/api';
  static Future<Map<String, dynamic>> regsiter(
      {required UserModel user}) async {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: {
        'phone': user.phoneNumber,
        'password': user.password,
        'role': 'user',
      },
    );
    if (response.statusCode == 200) {
      return {
        'token': jsonDecode(response.body)['token'],
      };
    } else if (response.statusCode == 400) {
      customToast(
          jsonDecode(response.body)['phone'][0], const Color(0xffCA1F13));
      return {};
    } else {
      customToast(
          jsonDecode(response.body)['message'], const Color(0xffCA1F13));
      return {};
    }
  }

  static Future<Map<String, dynamic>> login({required UserModel user}) async {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {
        'phone': user.phoneNumber,
        'password': user.password,
      },
    );
    if (response.statusCode == 200) {
      return {
        'isVerified': jsonDecode(response.body)['isVerify'],
        'token': jsonDecode(response.body)['token'],
      };
    } else {
      customToast(
          jsonDecode(response.body)['message'], const Color(0xffCA1F13));
      return {};
    }
  }

  static Future<bool> resendCode({required UserModel user}) async {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/resend-code'),
      body: {
        'phone': user.phoneNumber,
      },
    );
    if (response.statusCode == 200) {
      customToast(
          jsonDecode(response.body)['message'], const Color(0xff3DF242));
      return true;
    } else {
      customToast(
          jsonDecode(response.body)['message'], const Color(0xffCA1F13));
      return false;
    }
  }

  static void resetPassword({required UserModel user}) async {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/reset-password'),
      body: {
        'phone': user.phoneNumber,
        'password': user.password,
      },
    );
    if (response.statusCode == 200) {
      customToast(
          jsonDecode(response.body)['message'], const Color(0xff3DF242));
    } else {
      customToast(
          jsonDecode(response.body)['message'], const Color(0xffCA1F13));
    }
  }

  static Future<bool> verfiyNumber({required UserModel user}) async {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/verify-phone'),
      body: {
        'phone': user.phoneNumber,
        'verification_code': user.code,
      },
    );
    if (response.statusCode == 200) {
      customToast(
          jsonDecode(response.body)['message'], const Color(0xff3DF242));
      return true;
    } else {
      customToast(
          jsonDecode(response.body)['message'], const Color(0xffCA1F13));
      return false;
    }
  }

  static Future<bool> profile({required UserModel user}) async {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/profileInfo'),
      body: {
        'firstName': user.firstName,
        'lastName': user.lastName,
      },
      headers: {
        'Authorization': 'Bearer ${user.token}',
      },
    );

    if (response.statusCode == 200) {
      customToast('Success');
      return true;
    } else {
      customToast('fial');
      return false;
    }
  }

  static Future<bool> addAddress(
      {required AddressModel address, required String token}) async {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/create'),
      body: {
        'addressName': address.addressName,
        'buidingNumberOrFlat': address.buildingOrFlatNo,
        'streetName': address.streetName,
        'neighborhoodName': address.neighborhoodName,
        'towmName': address.townName,
        'cityName': address.cityName,
        'phone': address.phoneNumber,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      customToast(
          jsonDecode(response.body)['message'], const Color(0xff3DF242));
      return true;
    } else {
      customToast('Somthing went wrong', const Color(0xffCA1F13));
      return false;
    }
  }

  static Future<Map<String, dynamic>> userProfile(String token) async {
    http.Response response = await http.get(
      Uri.parse('$baseUrl/user-profile'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> user =
          jsonDecode(response.body) as Map<String, dynamic>;
      Directory dir = await getApplicationDocumentsDirectory();
      File image = File('${dir.path}/${user['image']}');
      await image.writeAsBytes(response.bodyBytes);
      return {
        'firstName': user['firstName'],
        'lastName': user['lastName'],
        'image': image,
        'phone': user['phone'],
      };
    } else {
      return {};
    }
  }
}

import 'package:delivaryapp/core/widgets/custom_button.dart';
import 'package:delivaryapp/core/widgets/custom_text_form_field.dart';
import 'package:delivaryapp/features/register/manger/user_provider.dart';
import 'package:delivaryapp/features/resetPassword/view/reset_password_page.dart';
import 'package:delivaryapp/features/verification/view/verified_number.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  static const String id = 'forget_password';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> formStateKey = GlobalKey();
  String? phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formStateKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Forget Passwoed',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Please enter your phone number to receive \n a verification code ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  ' Phone number',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CutomTextFormField(
                  hint: 'Enter your phone number',
                  ledel: 'phone',
                  preIcon: Icons.phone,
                  exist: false,
                  isExistFilter: true,
                  textInputType: TextInputType.phone,
                  onSave: (value) {
                    phone = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "this field can't be empty";
                    } else {
                      final regExp = RegExp(r'^09\d{8}$');
                      if (!regExp.hasMatch(value)) {
                        return 'invalid number';
                      }
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  name: 'Send',
                  onPress: () async {
                    if (formStateKey.currentState!.validate()) {
                      formStateKey.currentState!.save();
                      context
                          .read<UserProvider>()
                          .setUserPropreties(phoneNumber: phone!);
                      if (await context.read<UserProvider>().resendCode()) {
                        if (context.mounted) {
                          Navigator.pushNamed(
                            context,
                            Verfication.id,
                            arguments: ResetPasswordPage.id,
                          );
                        }
                      }
                    }
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

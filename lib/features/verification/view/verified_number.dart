import 'package:delivaryapp/core/widgets/custom_button.dart';
import 'package:delivaryapp/features/complateInfo/view/complateinfo_page.dart';
import 'package:delivaryapp/features/login/view/login_page.dart';
import 'package:delivaryapp/features/register/manger/user_provider.dart';
import 'package:delivaryapp/features/verification/widgets/custom_input_verifyed_number.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verfication extends StatefulWidget {
  const Verfication({super.key});
  static const id = 'verified_number';

  @override
  State<Verfication> createState() => _VerficationState();
}

class _VerficationState extends State<Verfication> {
  final GlobalKey<FormState> formStateKey = GlobalKey();
  String? d1, d2, d3, d4;
  @override
  Widget build(BuildContext context) {
    String? id = ModalRoute.settingsOf(context)!.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginPage.id,
              (route) {
                return false;
              },
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Verification',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Please enter 4 digit code your \n received',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: formStateKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomInputVerifedNumber(
                    onSave: (value) {
                      d1 = value!;
                    },
                  ),
                  CustomInputVerifedNumber(
                    onSave: (value) {
                      d2 = value!;
                    },
                  ),
                  CustomInputVerifedNumber(
                    onSave: (value) {
                      d3 = value!;
                    },
                  ),
                  CustomInputVerifedNumber(
                    onSave: (value) {
                      d4 = value!;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 355,
              child: CustomButton(
                name: 'Verify',
                onPress: () async {
                  if (formStateKey.currentState!.validate()) {
                    formStateKey.currentState!.save();
                    String code = '$d1$d2$d3$d4';
                    context.read<UserProvider>().setUserPropreties(code: code);
                    if (!await context
                        .read<UserProvider>()
                        .verifyNumber(context)) {
                      formStateKey.currentState!.reset();
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('isverified', true);
                    } else {
                      if (context.mounted) {
                        if (id == null) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            ComplateInfoPage.id,
                            (route) => false,
                          );
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('loged in', true);
                          // await prefs.setString(
                          //   'token',
                          //   context.read<UserProvider>().user!.token!,
                          // );
                        } else {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            LoginPage.id,
                            (route) => false,
                          );
                        }
                      }
                    }
                  }
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                const Text(
                  "Don't receive any conde?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<UserProvider>().resendCode();
                  },
                  child: const Text(
                    'send again',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff06AEAF),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

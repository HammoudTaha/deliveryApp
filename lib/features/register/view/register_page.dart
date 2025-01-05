import 'package:delivaryapp/core/models/user/user_model.dart';
import 'package:delivaryapp/core/widgets/custom_text_form_field.dart';
import 'package:delivaryapp/features/register/manger/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const id = 'register_page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? phone;
  String? password;
  final GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: const Color(0xff06AEAF),
              alignment: Alignment.topCenter,
              child: const Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: 180,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: formState,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            ' Phone number',
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
                            height: 30,
                          ),
                          const Text(
                            ' Password',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CutomTextFormField(
                            hint: 'Enter your password',
                            ledel: 'password',
                            preIcon: Icons.security,
                            isExistFilter: false,
                            exist: true,
                            textInputType: TextInputType.text,
                            onSave: (value) {
                              password = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "this field can't be empty";
                              } else if (value.length < 8) {
                                return 'the password must be at least 8 character';
                              } else {
                                return null;
                              }
                            },
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Color(0xff4C4C4C),
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          MaterialButton(
                            onPressed: () {
                              if (formState.currentState!.validate()) {
                                formState.currentState!.save();
                                context.read<UserProvider>().setUser(
                                      UserModel(
                                        phoneNumber: phone!,
                                        password: password!,
                                      ),
                                    );
                                context.read<UserProvider>().register(context);
                                setState(() {});
                              }
                            },
                            color: const Color(0xff06AEAF),
                            minWidth: double.infinity,
                            height: 56,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an acount? ",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Color(0xff06AEAF),
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 115,
              left: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  'assets/images/delivary.jpg',
                  height: 120,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

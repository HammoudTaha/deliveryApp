import 'package:delivaryapp/core/widgets/custom_button.dart';
import 'package:delivaryapp/core/widgets/custom_text_form_field.dart';
import 'package:delivaryapp/features/login/view/login_page.dart';
import 'package:delivaryapp/features/register/manger/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});
  static const String id = 'reset+password+page';

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String? password;
  final GlobalKey<FormState> formStateKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formStateKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create New Password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),
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
              const SizedBox(height: 30),
              CustomButton(
                name: 'Reset Passweod',
                onPress: () {
                  if (formStateKey.currentState!.validate()) {
                    formStateKey.currentState!.save();
                    context
                        .read<UserProvider>()
                        .setUserPropreties(password: password!);
                    context.read<UserProvider>().resetPassword();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginPage.id,
                      (route) {
                        return false;
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

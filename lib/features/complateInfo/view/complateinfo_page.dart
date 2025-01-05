import 'dart:io';
import 'package:delivaryapp/core/api%20services/api_services.dart';
import 'package:delivaryapp/core/utiles/helper_functions.dart';
import 'package:delivaryapp/core/widgets/custom_button.dart';
import 'package:delivaryapp/core/widgets/custom_outline_button.dart';
import 'package:delivaryapp/features/adressDelivery/view/add_address_page.dart';
import 'package:delivaryapp/features/complateInfo/widgets/custom_textformfield.dart';
import 'package:delivaryapp/features/main/main_page.dart';
import 'package:delivaryapp/features/register/manger/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ComplateInfoPage extends StatefulWidget {
  const ComplateInfoPage({super.key});
  static const String id = 'complateinfo_page';

  @override
  State<ComplateInfoPage> createState() => _ComplateInfoPageState();
}

class _ComplateInfoPageState extends State<ComplateInfoPage> {
  GlobalKey<FormState> formState = GlobalKey();
  String? firstName;
  String? lastName;
  File? imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    final pickerFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      imageFile = File(pickerFile.path);
      setState(() {});
    }
  }

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
                    'Complate your Information!',
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
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              ' First Name',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextformfield(
                              hint: 'Enter first name',
                              ledel: 'first name',
                              onSave: (value) {
                                firstName = value;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              ' Last Name',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextformfield(
                              hint: 'Enter last name',
                              ledel: 'Last name',
                              onSave: (value) {
                                lastName = value;
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              height: 50,
                              child: CustomOutlineButton(
                                text: 'Set Your Loaction Manually',
                                colorBorder: Colors.blueAccent,
                                fontSize: 18,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AddAddressPage.id,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 150),
                            CustomButton(
                              name: 'Continue',
                              onPress: () async {
                                if (formState.currentState!.validate()) {
                                  formState.currentState!.save();
                                  context
                                      .read<UserProvider>()
                                      .setUserPropreties(
                                        firstName: firstName,
                                        lastName: lastName,
                                        imageProfile: imageFile,
                                      );
                                  // print(
                                  //     context.read<UserProvider>().user!.token);
                                  if (imageFile == null) {
                                    customToast(
                                      'Your image profile is not set',
                                      Colors.red,
                                    );
                                  } else {
                                    if (await ApiServices.profile(
                                        user: context
                                            .read<UserProvider>()
                                            .user!)) {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          MainPage.id, (route) => false);
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
                ),
              ),
            ),
            Positioned(
                top: 100,
                left: 150,
                child: SizedBox(
                  height: 140,
                  width: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: imageFile == null
                        ? Image.asset('assets/images/profile.png')
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              imageFile!,
                              fit: BoxFit.fill,
                            ),
                          ),
                  ),
                )),
            Positioned(
              top: 185,
              left: 245,
              child: CircleAvatar(
                backgroundColor: const Color(0xff06AEAF),
                child: IconButton(
                  onPressed: () async {
                    await getImage();
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

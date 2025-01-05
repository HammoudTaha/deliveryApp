import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imageFile;
  final ImagePicker imagePicker = ImagePicker();
  Future<void> getImage() async {
    final pickerFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      imageFile = File(pickerFile.path);
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/profile.png';
      final File file = File(pickerFile.path);
      await file.copy(imagePath);
      setState(() {});
    }
  }

  @override
  void initState() {
    setImage();
    super.initState();
  }

  void setImage() async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/profile.png';
    final File file = File(imagePath);
    if (await file.exists()) {
      imageFile = file;
      setState(() {});
    } else {
      imageFile = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    /// UserModel user = context.read<UserProvider>().user!;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: imageFile == null
                                ? Image.asset(
                                    'assets/images/defualtProfile.png',
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: 80,
                                  ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 3,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black38,
                              child: InkWell(
                                onTap: () {
                                  getImage();
                                },
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 15),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Hammoud Taha',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '0938534186',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Edit'),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xffE2E5E8),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        const Icon(
                          Icons.logout,
                          size: 30,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:local_storage/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey();
    String? name, desi, tech;
    String? imagePath;
    TextEditingController nameC = TextEditingController();
    TextEditingController desiC = TextEditingController();
    TextEditingController techC = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Edit Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 100),
                TextFormField(
                  controller: nameC,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: textFieldDecoration(title: "User Name"),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: desiC,
                  onChanged: (value) {
                    desi = value;
                  },
                  decoration: textFieldDecoration(title: "Designation"),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: techC,
                  onChanged: (value) {
                    tech = value;
                  },
                  decoration: textFieldDecoration(title: "Technology"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? imageFile =
                        await FilePicker.platform.pickFiles();
                    if (imageFile != null) {
                      imagePath = imageFile.files.single.path;
                    } else {}
                  },
                  child: const Text('Pick Image'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    log(name.toString() + desi.toString() + tech.toString());
                    pref.setString('name', name.toString());
                    pref.setString('desi', desi.toString());
                    pref.setString('tech', tech.toString());
                    (imagePath != null)
                        ? pref.setString('image', imagePath.toString())
                        : imagePath = pref.getString('image');
                    (imagePath != null)
                        ? Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          )
                        : null;
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration textFieldDecoration({required String title}) {
    return InputDecoration(
      filled: true,
      labelText: title,
      labelStyle: TextStyle(color: Colors.grey.shade800),
      fillColor: Colors.teal[200],
      focusColor: Colors.teal[200],
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal.shade700),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal.shade700),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal.shade700),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}

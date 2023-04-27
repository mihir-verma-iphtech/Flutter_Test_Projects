import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:local_storage/edit_profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name = 'r';
  String? desi = 'r';
  String? tech = 'r';
  String? image_path;
  int index = 6;
  List<Alignment> align = [
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
  ];

  @override
  void initState() {
    fetchData();

    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (index == 3) {
        timer.cancel();
      } else {
        setState(() {
          index = Random().nextInt(align.length);
        });
      }
    });
    super.initState();
  }

  fetchData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getKeys());
    setState(() {
      name = pref.getString('name');
      desi = pref.getString('desi');
      tech = pref.getString('tech');
      image_path = pref.getString('image');
    });
  }

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(),
                ),
              );
            },
            icon: const Icon(Icons.edit_document),
            iconSize: 30,
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedAlign(
              duration: Duration(seconds: 2),
              // width: double.infinity,
              // height: double.infinity,
              alignment: align[index],
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(height: sh * 0.05),
                  Text(
                    '$name',
                    style: nameStyle(),
                    textAlign: TextAlign.center,
                    textScaleFactor: 3,
                  ),
                  SizedBox(height: sh * 0.05),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      image(
                          height: sh * 0.30,
                          width: sh * 0.30,
                          radius: 140,
                          color: Colors.teal.shade300),
                      image(
                        height: sh * 0.28,
                        width: sh * 0.28,
                        radius: 120,
                        child: image_path == null
                            ? null
                            : Image.file(
                                File(image_path.toString()),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ],
                  ),
                  SizedBox(height: sh * 0.03),
                  Text(
                    '$desi',
                    style: style(),
                    textAlign: TextAlign.center,
                    textScaleFactor: 2.5,
                  ),
                  SizedBox(height: sh * 0.03),
                  Text(
                    '$tech Developer',
                    style: style(),
                    textAlign: TextAlign.center,
                    textScaleFactor: 2.25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect image(
      {double? height,
      double? width,
      Color? color,
      Widget? child,
      double radius = 100}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child:
          Container(height: height, width: width, color: color, child: child),
    );
  }

  TextStyle style() =>
      TextStyle(color: Colors.white, backgroundColor: Colors.orange[400]);

  TextStyle nameStyle() =>
      TextStyle(color: Colors.white, backgroundColor: Colors.teal[300]);
}

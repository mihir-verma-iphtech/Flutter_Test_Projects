import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? mtoken = " ";
  TextEditingController userName = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    requestPermission();
    getToken();
    initInfo();
  }

  initInfo() {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialize = const DarwinInitializationSettings();
    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: iosInitialize);
    flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse: (details) async {
        try {
          if (details.payload != null && details.payload!.isNotEmpty) {
          } else {}
        } catch (e) {}
      },
    );
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        log("----------------onMessage-------------------");
        log("onMessage: ${message.notification?.title}/${message.notification?.body}");
        BigTextStyleInformation bigTextStyleInformation =
            BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: message.notification!.title.toString(),
          htmlFormatContentTitle: true,
        );
        AndroidNotificationDetails androidPlatformChannelSpecifics =
            AndroidNotificationDetails(
          'mihir',
          'mihir',
          importance: Importance.high,
          styleInformation: bigTextStyleInformation,
          priority: Priority.high,
          playSound: true,
        );
        NotificationDetails platformChannelSpecifics = NotificationDetails(
            android: androidPlatformChannelSpecifics,
            iOS: const DarwinNotificationDetails());
        await flutterLocalNotificationsPlugin.show(
            0,
            message.notification?.title,
            message.notification?.body,
            platformChannelSpecifics,
            payload: message.data['body']);
      },
    );
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
        log("My token is $mtoken");
      });
      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance
        .collection("UserTokens")
        .doc("User1")
        .set({'token': token});
  }

  void sendPushMessage(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAA8FlcdAY:APA91bF_t_eEOLYWA4Xjmv3Bdqpl2_wts1jD0EVj4eB14rWJdDUh1SN64PMXORKyUJ2ChKX0qZLpp_fGJ1MBEVphmluYih-7U3q9JHCgZBni1V7fFZVEVwTIWTgl70U0s1XfOPkShd-G',
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title,
            },
            "notification": <String, dynamic>{
              "title": title,
              "body": body,
              "android_channel_id": "mihir",
            },
            "to": token,
          },
        ),
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: userName,
            ),
            TextFormField(
              controller: title,
            ),
            TextFormField(
              controller: body,
            ),
            GestureDetector(
              onTap: () async {
                //For Testing Purpose It is User1
                String name = userName.text.trim();
                String titleText = title.text;
                String bodyText = body.text;

                if (name != "") {
                  DocumentSnapshot snap = await FirebaseFirestore.instance
                      .collection("UserTokens")
                      .doc('User1')
                      .get();

                  // String token =
                  //     'd6YGAguORBqqXdp-Y5ajg_:APA91bFdpWBiOmcRCLdgKW__CA2Qug1Z0LE0lxqNdE_gBaN1KDXUc87CrPWZtfRir0ACBtIqS0U7y68sRdM_qqcNWfdoZb4rqlMhERE9XmaeiD6idE-QLG5Gfsb1szaQXm7RdegKohHy';
                  String token = snap['token'];
                  log(token);
                  sendPushMessage(token, titleText, bodyText);
                }
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.5),
                      ),
                    ]),
                child: const Center(
                  child: Text("button"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

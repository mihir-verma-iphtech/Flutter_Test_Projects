import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/utils/color_scheme.dart';

import '../../utils/info.dart';

class UserChatScreen extends StatelessWidget {
  final int index;

  const UserChatScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColorScheme.chatScreenAppbar,
        titleSpacing: 0,
        // leadingWidth: 15,
        automaticallyImplyLeading: false,
        title: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(info[index]['profilePic'].toString()),
          ),
          title: Text(
            info[index]['name'].toString(),
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: const Text(
            'Group info',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'images/images.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, left: 5, right: 5),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                // height: 50,
                width: MediaQuery.of(context).size.width * 0.80,
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Message',
                      hintStyle: TextStyle(color: AppColorScheme.appGreyColor),
                      prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.emoji_emotions,
                            color: AppColorScheme.appGreyColor,
                          )),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.attach_file,
                            color: AppColorScheme.appGreyColor,
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.currency_rupee,
                            color: AppColorScheme.appGreyColor,
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.camera_alt_rounded,
                            color: AppColorScheme.appGreyColor,
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      labelStyle: TextStyle(color: AppColorScheme.appGreyColor),
                      fillColor: AppColorScheme.chatScreenTextField,
                      filled: true,
                      enabledBorder: borderStyling(),
                      focusedBorder: borderStyling(),
                      contentPadding: EdgeInsets.zero),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, left: 5, right: 5),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorScheme.tealGreen,
                    minimumSize: const Size(60, 45),
                    shape: const CircleBorder()),
                child: const Icon(
                  Icons.mic,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder borderStyling() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    );
  }
}

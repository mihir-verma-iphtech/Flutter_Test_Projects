import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/src/views/user_chat_screen.dart';
import 'package:whatsapp_ui_clone/utils/colors.dart';

import '../../utils/color_scheme.dart';
import '../../utils/info.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: info.length,
      itemBuilder: (context, index) =>
          chatsTiles(context: context, index: index),
      separatorBuilder: (_, __) => const Divider(
        height: 0,
        thickness: 0.5,
        endIndent: 20,
        indent: 20,
        color: dividerColor,
      ),
    );
  }

  Card chatsTiles({required BuildContext context, required int index}) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColorScheme.backgroundColor,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserChatScreen(index: index),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(info[index]['profilePic'].toString()),
        ),
        title: Text(
          info[index]['name'].toString(),
          style: TextStyle(color: AppColorScheme.appGreyColor),
        ),
        subtitle: Text(
          info[index]['message'].toString(),
          style: TextStyle(color: AppColorScheme.appGreyColor),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              info[index]['time'].toString(),
              style: TextStyle(
                color: AppColorScheme.appGreyColor,
                fontSize: 12,
              ),
            ),
            Icon(
              CupertinoIcons.pin_fill,
              color: AppColorScheme.appGreyColor,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}

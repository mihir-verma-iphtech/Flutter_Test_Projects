import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/src/views/calls_screen.dart';
import 'package:whatsapp_ui_clone/src/views/chat_screen.dart';
import 'package:whatsapp_ui_clone/src/views/groups_screen.dart';
import 'package:whatsapp_ui_clone/src/views/status_screen.dart';
import 'package:whatsapp_ui_clone/utils/color_scheme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            labelColor: AppColorScheme.tealGreen,
            unselectedLabelColor: AppColorScheme.appGreyColor,
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (states) => Colors.transparent),
            tabs: const [
              Tab(
                icon: Icon(Icons.groups),
              ),
              Tab(
                child: Text('Chats'),
              ),
              Tab(
                child: Text('Status'),
              ),
              Tab(
                child: Text('Calls'),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GroupsScreen(),
            ChatScreen(),
            StatusScreen(),
            CallsScreen(),
          ],
        ),
      ),
    );
  }
}

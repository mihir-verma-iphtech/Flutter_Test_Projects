import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/common/widgets/loader.dart';
import 'package:whatsapp_clone/features/chat/controller/chat_controller.dart';
import 'package:whatsapp_clone/features/chat/screens/mobile_chat_screen.dart';
import 'package:whatsapp_clone/models/chat_contact.dart';

import '../../../models/group.dart';

class ContactList extends ConsumerWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<List<Group>>(
                  stream: ref.watch(chatControllerProvider).chatGroups(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loader();
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount:
                          snapshot.data == null ? 0 : snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var groupData = snapshot.data![index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                log(snapshot.data.toString());
                                Navigator.of(context).pushNamed(
                                    MobileChatScreen.routeName,
                                    arguments: {
                                      'name': groupData.name,
                                      'uid': groupData.groupId,
                                      'isGroupChat': true,
                                      'profilePic': groupData.groupPic,
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        groupData.groupPic.toString()),
                                  ),
                                  title: Text(
                                    groupData.name.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      groupData.lastMessage.toString(),
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  trailing: Text(
                                    DateFormat.Hm().format(groupData.timeSent),
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        color: dividerColor,
                        indent: 25,
                        endIndent: 25,
                        height: 0,
                      ),
                    );
                  }),
              StreamBuilder<List<ChatContact>>(
                  stream: ref.watch(chatControllerProvider).chatContacts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loader();
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount:
                          snapshot.data == null ? 0 : snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var chatContactData = snapshot.data![index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                log(snapshot.data.toString());
                                Navigator.of(context).pushNamed(
                                    MobileChatScreen.routeName,
                                    arguments: {
                                      'name': chatContactData.name,
                                      'uid': chatContactData.contactId,
                                      'isGroupChat': false,
                                      'profilePic': chatContactData.profilePic,
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        chatContactData.profilePic.toString()),
                                  ),
                                  title: Text(
                                    chatContactData.name.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      chatContactData.lastMessage.toString(),
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  trailing: Text(
                                    DateFormat.Hm()
                                        .format(chatContactData.timeSent),
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        color: dividerColor,
                        indent: 25,
                        endIndent: 25,
                        height: 0,
                      ),
                    );
                  }),
            ],
          ),
        ));
  }
}

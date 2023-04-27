import 'package:flutter/material.dart';

import '../../utils/color_scheme.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox(
              // height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  chatsTiles(context: context, index: index),
                  Container(
                    height: 12,
                    color: AppColorScheme.backgroundColor,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 22),
                    color: AppColorScheme.backgroundColor,
                    child: Text(
                      'Recent',
                      style: TextStyle(color: AppColorScheme.appGreyColor),
                    ),
                  ),
                  Container(
                    height: 10,
                    color: AppColorScheme.backgroundColor,
                  ),
                ],
              ),
            );
          } else {
            return chatsTiles(context: context, index: index);
          }
        });
  }

  Card chatsTiles({required BuildContext context, required int index}) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColorScheme.backgroundColor,
      child: ListTile(
        leading: const CircleAvatar(),
        title: Text(
          'Call Name',
          style: TextStyle(color: AppColorScheme.appGreyColor),
        ),
        subtitle: Text(
          'Call Date',
          style: TextStyle(color: AppColorScheme.appGreyColor),
        ),
        trailing: Icon(
          Icons.call,
          color: AppColorScheme.tealGreen,
        ),
      ),
    );
  }
}

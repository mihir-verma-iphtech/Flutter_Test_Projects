import 'package:flutter/cupertino.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.ant_circle)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.zzz)),
        ]),
        tabBuilder: (context, index) => CupertinoTabView(
          builder: (context) => CupertinoPageScaffold(
              backgroundColor: CupertinoColors.activeGreen,
              child: Center(child: Text('Tab View $index'))),
        ),
      ),
    );
  }
}

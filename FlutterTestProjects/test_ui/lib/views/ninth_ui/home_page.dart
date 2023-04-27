import 'package:flutter/cupertino.dart';
import 'package:test_ui/views/ninth_ui/second_page.dart';
import 'package:test_ui/views/ninth_ui/textfield_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: const Icon(CupertinoIcons.antenna_radiowaves_left_right),
          middle: const Text('IOS UI'),
          trailing: GestureDetector(
            onTap: () {},
            child: const Text(
              'Press',
              style: TextStyle(
                color: CupertinoColors.activeBlue,
              ),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              CupertinoButton.filled(
                  child: const Text('Cupertino Tab Bar'),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const NextPage()));
                  }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CupertinoButton.filled(
                  child: const Text('Cupertino TextField'),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const CupertinoTextFieldPage()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

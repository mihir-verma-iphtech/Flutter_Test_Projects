import 'package:flutter/cupertino.dart';

class CupertinoTextFieldPage extends StatelessWidget {
  const CupertinoTextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('IOS Text Fields'),
        ),
        child: Column(
          children: [
            const CupertinoTextField(),
            const CupertinoTextField.borderless(),
            const CupertinoSearchTextField(),
            CupertinoTextFormFieldRow()
          ],
        ),
      ),
    );
  }
}

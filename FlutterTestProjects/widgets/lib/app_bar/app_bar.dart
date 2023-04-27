import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarHomePage extends StatefulWidget {
  const AppBarHomePage({super.key});

  @override
  State<AppBarHomePage> createState() => _AppBarHomePageState();
}

class _AppBarHomePageState extends State<AppBarHomePage> {
  bool _leadIcon = false;
  bool _title = false;
  bool _centerTitle = false;
  bool _actionButton = false;
  bool _systemOverlay = false;
  bool _showOverlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: _appBarCustomizable(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'AppBar UI',
            style: TextStyle(fontSize: 30.sp),
          ),
          _customOptionSwitch(
            title: 'Show leading Icon',
            func: (val) {
              setState(() {
                _leadIcon = val;
              });
            },
            value: _leadIcon,
          ),
          _customOptionSwitch(
            title: 'Show Title',
            func: (val) {
              setState(() {
                _title = val;
              });
            },
            value: _title,
          ),
          _customOptionSwitch(
            title: 'Center Title',
            func: (val) {
              setState(() {
                _centerTitle = val;
              });
            },
            value: _centerTitle,
          ),
          _customOptionSwitch(
            title: 'Action Buttons',
            func: (val) {
              setState(() {
                _actionButton = val;
              });
            },
            value: _actionButton,
          ),
          _customOptionSwitch(
            title: 'System Overlay Design(Switch)',
            func: (val) {
              setState(() {
                _systemOverlay = val;
              });
            },
            value: _systemOverlay,
          ),
        ],
      ),
    );
  }

  AppBar _appBarCustomizable() {
    return AppBar(
      leading: !_leadIcon ? Container() : null,
      centerTitle: _centerTitle,
      title: _title ? const Text('Hello World') : null,
      actions: _actionButton
          ? const [
              Icon(CupertinoIcons.heart_fill),
              Icon(Icons.search),
            ]
          : null,
      actionsIconTheme: const IconThemeData(size: 25),
      // systemOverlayStyle: _systemOverlay
      //     ? const SystemUiOverlayStyle(
      //         statusBarColor: Colors.purpleAccent,
      //         systemNavigationBarColor: Colors.purpleAccent,
      //         systemNavigationBarIconBrightness: Brightness.light,
      //         statusBarIconBrightness: Brightness.light)
      //     : const SystemUiOverlayStyle(
      //         statusBarColor: Colors.yellow,
      //         systemNavigationBarColor: Colors.yellow,
      //         statusBarIconBrightness: Brightness.dark,
      //         systemNavigationBarIconBrightness: Brightness.dark),
    );
  }

  Row _customOptionSwitch({String? title, Function(bool)? func, bool? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title!,
          style: TextStyle(fontSize: 20.sp),
        ),
        Switch(
          value: value!,
          onChanged: func,
        )
      ],
    );
  }
}

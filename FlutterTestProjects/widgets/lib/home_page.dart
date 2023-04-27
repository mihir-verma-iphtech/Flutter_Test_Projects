import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/app_bar/app_bar.dart';
import 'package:widgets/banner/banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Widgets Catalog'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _customButtonStyle(
                    func: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AppBarHomePage(),
                        ),
                      );
                    },
                    title: 'App Bar'),
                _customButtonStyle(
                    func: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BannerHomePage(),
                        ),
                      );
                    },
                    title: 'Banner'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _customButtonStyle({Function()? func, String? title}) {
  return ElevatedButton(
    onPressed: func,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white54,
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      elevation: 10,
    ),
    child: Text(
      title!,
      style: TextStyle(fontSize: 20.sp),
    ),
  );
}

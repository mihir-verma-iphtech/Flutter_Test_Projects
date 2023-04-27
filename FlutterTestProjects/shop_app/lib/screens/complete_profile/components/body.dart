import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/complete_profile/components/complete_profile_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: ScreenUtil().screenHeight * 0.02),
            Text(
              'Complete Profile',
              style: headingStyle,
            ),
            const Text(
              'Complete your details or continue \nwith social media',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ScreenUtil().screenHeight * 0.05),
            const CompleteProfileForm(),
            SizedBox(height: 30.h),
            const Text(
              "By continuing you're confirm that you agree \nwith our Term and Condition",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

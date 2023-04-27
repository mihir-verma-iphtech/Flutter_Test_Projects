import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/otp/components/otp_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().screenHeight * 0.05),
              Text(
                'OTP Verification',
                style: headingStyle,
              ),
              const Text(
                'We sent your code to +1 898 860 ****',
                textAlign: TextAlign.center,
              ),
              buildTimer(),
              SizedBox(height: ScreenUtil().screenHeight * 0.15),
              const OtpForm(),
              SizedBox(height: ScreenUtil().screenHeight * 0.1),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Resend OTP Code',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This code will expired in '),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            '00:${value.toInt().toString()}',
            style: const TextStyle(color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}

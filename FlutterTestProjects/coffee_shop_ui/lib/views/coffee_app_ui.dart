import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeAppHomepage extends StatelessWidget {
  const CoffeeAppHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(156, 65, 31, 2),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(139, 97, 84, 71),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.window_rounded,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(139, 97, 84, 71),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: false
                            ? Image.network('img')
                            : const Icon(Icons.supervised_user_circle_outlined),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      child: Text(
                        'Find the best \ncoffee for you',
                        style: GoogleFonts.poppins(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const CupertinoSearchTextField(
                      placeholder: 'Find Your Coffee......',
                      keyboardType: TextInputType.text,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 60.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _optionButton(title: 'Cappuccino'),
                      _optionButton(title: 'Espresso'),
                      _optionButton(title: 'Latte'),
                      _optionButton(title: 'Flat'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 240.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _coffeeCard(title: 'Cappuccino'),
                      _coffeeCard(title: 'Espresso'),
                      _coffeeCard(title: 'Latte'),
                      _coffeeCard(title: 'Flat'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Special for you',
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 400.h,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(15.r)),
                      padding: EdgeInsets.all(15.w),
                      margin: EdgeInsets.symmetric(vertical: 15.h),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: Colors.black38,
                                ),
                                height: 100.w,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(left: 10.w),
                                child: const Text(
                                  '5 Coffee Beans You Must Try!',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.heart_broken_rounded), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      //   ],
      // ),
    );
  }
}

Widget _optionButton({String? title, Function()? func}) {
  return InkWell(
    onTap: func,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(
        '$title',
        style: GoogleFonts.roboto(
            color: Colors.orange[600],
            fontSize: 18.sp,
            fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Widget _coffeeCard({String? title}) {
  return Container(
    width: 150.w,
    padding: EdgeInsets.all(10.w),
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(15.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 50.w,
                height: 25.h,
                child: Container(
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.r),
                      bottomLeft: Radius.circular(15.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange[600],
                        size: 15.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Text(
          '$title',
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('\$ 4.20',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp))
              ],
            ),
            Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: Colors.orange[600],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    ),
  );
}

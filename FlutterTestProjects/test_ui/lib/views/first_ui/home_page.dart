import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ui/utils/Data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Appbar
              _appBar(),

              //Title(Heading)
              _title(),

              // Menu Items
              _menuItemsCategories(),

              // Menu Items SubMenu
              _subItemsCategories()

              // Bottom Navigation Bar
            ],
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(context),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.greenAccent[400],
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
    );
  }

  Expanded _subItemsCategories() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Now',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(
                        color: Colors.greenAccent[400],
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisExtent: 205),
              itemCount: 2,
              padding: EdgeInsets.symmetric(vertical: 5.h),
              itemBuilder: (context, index) => _menuSubItemsCard(index),
            ),
          ),
        ],
      ),
    );
  }

  Column _menuItemsCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 155.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: Data.jsonData['data'].length,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            itemBuilder: (context, index) => _menuItemsCard(index),
            separatorBuilder: (context, index) => SizedBox(
              width: 12.w,
            ),
          ),
        ),
      ],
    );
  }

  Widget _menuItemsCard(int index) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(22.r),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.w,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: index == 0 ? Colors.greenAccent[400] : Colors.white,
              borderRadius: BorderRadius.circular(22.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Image.asset(
                  Data.jsonData['data'][index]['image'],
                ),
              ),
              Text(Data.jsonData['data'][index]['name']),
              Material(
                color: index == 0 ? Colors.white : Colors.greenAccent[400],
                borderRadius: BorderRadius.circular(30.r),
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 30,
                  color: index == 0 ? Colors.greenAccent[400] : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuSubItemsCard(int index) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(22.r),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(22.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Image.asset(Data.jsonData['data'][index]['image']),
              ),
              Text(Data.jsonData['data'][index]['specialname']),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Data.jsonData['data'][index]['addon']),
                  RichText(
                    text: const TextSpan(text: '🔥'),
                  ),
                ],
              ),
              Text(
                '\$${Data.jsonData['data'][index]['price']}',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.greenAccent[700],
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _title() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get your food',
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[500],
                fontWeight: FontWeight.w500),
          ),
          Text(
            'Delivered!',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Row _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: Container(
            height: 50.h,
            width: 50.w,
            color: Colors.greenAccent,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.verified_outlined,
              color: Colors.green[400],
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              'Mihir Verma',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.green[400],
              size: 30,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.window_rounded),
          ),
        ),
      ],
    );
  }
}

Widget customBottomNavigationBar(BuildContext context) {
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    child: Container(
      height: 65.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70.r),
          topRight: Radius.circular(70.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  iconSize: 38.0,
                  icon: Icon(
                    Icons.home,
                    color: Colors.greenAccent[400],
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: const Icon(CupertinoIcons.bell),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  iconSize: 30.0,
                  icon: const Icon(CupertinoIcons.heart),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: const Icon(CupertinoIcons.cart),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

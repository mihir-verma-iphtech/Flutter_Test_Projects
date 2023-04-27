import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 3;
  final PageController _pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'PageView',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            index = value;
          });
        },
        controller: _pageController,
        children: [
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.orange,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.purple,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.cyan,
        elevation: 0,
        onTap: (value) {
          _pageController.animateToPage(value,
              duration: Duration(milliseconds: 2000), curve: Curves.elasticOut);
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.dashboard),
              label: "Dashboard"),
          BottomNavigationBarItem(
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.calendar_month),
              label: "Calendar"),
          BottomNavigationBarItem(
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.movie),
              label: "Movie"),
          BottomNavigationBarItem(
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.settings),
              label: "Settings"),
        ],
      ),
    );
  }
}

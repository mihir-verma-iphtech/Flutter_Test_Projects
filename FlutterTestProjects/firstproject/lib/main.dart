import 'package:firstproject/cupertino/cupertion_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoTextFieldDemo(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 215, 177, 235),
        drawer: Drawer(
          child: Container(
            color: Colors.red,
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 189, 109, 229),
          title: const Text("IOS"),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 250, 206, 141),
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        "My First App On IOS Simulator",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.purple[400],
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: ListView.separated(
                            itemBuilder: (context, index) => ListTile(
                                  title: Text(
                                    'Hello ${index + 1}',
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const Divider(color: Colors.grey, thickness: 1),
                            itemCount: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

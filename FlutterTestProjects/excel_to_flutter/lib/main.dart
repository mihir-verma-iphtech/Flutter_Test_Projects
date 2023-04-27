// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserData {
  final String name;
  final String number;
  UserData({
    required this.name,
    required this.number,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Excel? excel;
  var bytes;
  List<String>? excelData = [];
  List<UserData> excelModelData = [];
  dataFromExcel() async {
    try {
      /// Use FilePicker to pick files in Flutter Web

      // FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      //   type: FileType.custom,
      //   allowedExtensions: ['xlsx'],
      //   allowMultiple: false,
      // );

      // /// file might be picked

      // if (pickedFile != null) {
      //   bytes = pickedFile.files.single.bytes;
      //   excel = Excel.decodeBytes(bytes!);
      //   for (var table in excel!.tables.keys) {
      //     log(table); //sheet Name
      //     log(excel!.tables[table]!.maxCols.toString());
      //     log(excel!.tables[table]!.maxRows.toString());
      //     for (var row in excel!.tables[table]!.rows) {
      //       for (var data in row) log(data!.value.toString());
      //     }
      //   }
      ByteData data = await rootBundle.load('assets/DummyData.xlsx');
      var bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      var excel = Excel.decodeBytes(bytes);

      for (var table in excel.tables.keys) {
        log(table); //sheet Name
        log(excel.tables[table]!.maxCols.toString());
        log(excel.tables[table]!.maxRows.toString());
        for (var row in excel.tables[table]!.rows) {
          // for (var data in row) {
          //   log(data!.value.toString());
          //   excelData!.add(data.value.toString());
          // }

          if (row[0]!.value.toString() == 'Name') continue;

          excelModelData.add(UserData(
              name: row[0]!.value.toString(),
              number: row[1]!.value.toString()));
        }

        setState(() {});
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await dataFromExcel();
                },
                child: const Text('Fetch Excel Sheet'),
              ),
              const SizedBox(height: 40),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [Text('Name'), Text('Number')],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ListView.builder(
                          itemCount: excelModelData.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(excelModelData[index].name),
                                Text(excelModelData[index].number),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

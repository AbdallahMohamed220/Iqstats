import 'package:flutter/material.dart';
import 'package:iqstats/constant.dart';
import 'package:iqstats/main_screen.dart';
import 'package:iqstats/screens/table/table.dart';
import 'package:iqstats/screens/video_list/video_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage = 0;

  void onItemSelected(int index) {
    if (mounted) {
      setState(() {
        currentPage = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IQststs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MainPage(
        pageIndex: currentPage,
        onItemSelected: onItemSelected,
      ),
    );
  }
}

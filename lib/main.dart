import 'package:flutter/material.dart';
import 'package:iqstats/constant.dart';
import 'package:iqstats/screens/table/table.dart';
import 'package:iqstats/screens/video_list/video_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IQststs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: TableScreen(),
    );
  }
}

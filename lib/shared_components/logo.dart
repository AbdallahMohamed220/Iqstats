import 'package:flutter/material.dart';
import 'package:iqstats/screens/table/table.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth * 0.2,
      child: Image.asset(
        'assets/images/logo.png',
        width: 100,
        height: 60,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
      ),
      child: Image.asset(
        'assets/images/logo.png',
        width: 100,
        height: 60,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AhlyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
      ),
      child: Image.asset(
        'assets/images/ahly.png',
        width: 100,
        height: 100,
      ),
    );
  }
}

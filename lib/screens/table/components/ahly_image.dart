import 'package:flutter/material.dart';
import 'package:iqstats/screens/compare/compare.dart';

class AhlyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => CompareScreen()),
          );
        },
        child: Image.asset(
          'assets/images/ahly.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}

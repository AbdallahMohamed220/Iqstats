import 'package:flutter/material.dart';

class CompareTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
          ),
          child: Icon(Icons.perm_device_information_rounded),
        ),
        Text(
          'Compare',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

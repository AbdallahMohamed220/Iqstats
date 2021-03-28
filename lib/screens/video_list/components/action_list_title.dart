import 'package:flutter/material.dart';

class ActionListTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        'Action List',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}

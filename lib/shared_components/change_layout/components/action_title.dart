import 'package:flutter/material.dart';
import 'package:iqstats/screens/video_list/video_list.dart';

class ActionTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth / 4,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                'Actions',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          Column(
            children: [
              Text(
                'Actions',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          Column(
            children: [
              Text(
                'Actions',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

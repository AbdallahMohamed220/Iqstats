import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iqstats/screens/video_list/components/action_list_data.dart';
import 'package:iqstats/screens/video_list/components/action_list_title.dart';
import 'package:iqstats/screens/video_list/components/ahly_logo.dart';
import 'package:iqstats/screens/video_list/components/logo.dart';
import '../../constant.dart';

var deviceWidth;
var deviceHeight;

class VideoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        color: AppColor.kPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: LogoWidget(),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: AhlyLogo(),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 1,
              child: ActionListTitle(),
            ),
            Expanded(
              flex: 8,
              child: ActionListData(),
            ),
          ],
        ),
      ),
    );
  }
}

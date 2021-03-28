import 'package:flutter/material.dart';
import 'package:iqstats/main_screen.dart';
import 'package:iqstats/screens/compare/components/compare_data.dart';
import 'package:iqstats/screens/compare/components/compare_title.dart';

import '../../constant.dart';

class CompareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        color: AppColor.kPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            CompareTitle(),
            Padding(
              padding: const EdgeInsets.only(
                left: 60.0,
                top: 40,
              ),
              child: CompareData(),
            ),
          ],
        ),
      ),
    );
  }
}

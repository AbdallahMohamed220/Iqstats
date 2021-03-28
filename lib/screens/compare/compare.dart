import 'package:flutter/material.dart';
import 'package:iqstats/screens/compare/components/compare_data.dart';
import 'package:iqstats/screens/compare/components/compare_title.dart';
import 'package:iqstats/screens/nav_bar.dart';
import 'package:iqstats/screens/table/table.dart';
import 'package:iqstats/shared_components/logo.dart';

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
            Row(
              children: [
                LogoWidget(),
                SizedBox(
                  width: deviceWidth * .2,
                ),
                Container(
                  width: deviceWidth * .5,
                  height: 70,
                  alignment: Alignment.center,
                  child: Navbar(
                    selectedIndex: 0,
                    onItemSelected: (_) {},
                  ),
                )
              ],
            ),
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

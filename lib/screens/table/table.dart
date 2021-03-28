import 'package:flutter/material.dart';
import 'package:iqstats/screens/table/components/ahly_image.dart';
import 'package:iqstats/screens/table/components/ahly_title.dart';
import 'package:iqstats/shared_components/logo.dart';
import 'package:iqstats/screens/table/components/player_data.dart';

import '../../constant.dart';
import '../nav_bar.dart';

var deviceWidth;
var deviceHeight;

class TableScreen extends StatefulWidget {
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List<String> _matches = [
    'last 1 matches',
    'last 2 matches',
    'last 3 matches',
    'last 4 matches'
  ];
  String _selectedMatches;
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
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AhlyImage(),
                AhlyTitle(),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 20.0,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint:
                          Text('last 3 matches'), // Not necessary for Option 1
                      value: _selectedMatches,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedMatches = newValue;
                        });
                      },
                      items: _matches.map((value) {
                        return DropdownMenuItem(
                          child: new Text(value),
                          value: value,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (_) {},
                    ),
                    Text('show player photo'),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text('page name'),
                  ),
                ),
                Icon(Icons.perm_device_information_rounded),
                Text('PDF'),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.perm_device_information_rounded),
                Text('XLS'),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.perm_device_information_rounded),
                Text('change table layout'),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: deviceHeight / 1.65,
              child: SingleChildScrollView(
                child: BuildPlayerData(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

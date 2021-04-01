import 'package:flutter/material.dart';
import 'package:iqstats/main_screen.dart';
import 'package:iqstats/screens/table/components/ahly_image.dart';
import 'package:iqstats/screens/table/components/ahly_title.dart';
import 'package:iqstats/shared_components/change_layout/change_layout.dart';
import 'package:iqstats/screens/table/components/player_data.dart';

import '../../constant.dart';

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

  bool isImgActive = true;

  String _selectedMatches;
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      value: isImgActive,
                      onChanged: (newValue) {
                        setState(() {
                          isImgActive = newValue;
                        });
                      },
                    ),
                    Text('show player photo'),
                  ],
                ),
                SizedBox(
                  width: 150,
                ),
                Container(
                  width: 200,
                  height: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Page Name",
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                      InkWell(
                          onTap: () {
                            changeLayout(context);
                          },
                          child: Text('change table layout')),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: deviceHeight / 1.65,
              child: SingleChildScrollView(
                child: BuildPlayerData(
                  imgIsActive: isImgActive,
                  columnHead: ['Ev1', 'Ev2', 'Ev3', 'Ev4', 'Ev5'],
                  dataForEveryRow: [
                    ['1', '2', '3', '4', '5'],
                    ['1', '2', '3', '4', '5'],
                    ['1', '2', '3', '4', '5'],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

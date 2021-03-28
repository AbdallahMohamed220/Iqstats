import 'package:flutter/material.dart';

class BuildPlayerData extends StatelessWidget {
  const BuildPlayerData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataRowHeight: 100,
        columns: <DataColumn>[
          DataColumn(
            label: Text(''),
          ),
          DataColumn(
            label: Text('Ev1'),
          ),
          DataColumn(
            label: Text('Ev2'),
          ),
          DataColumn(
            label: Text('Ev3'),
          ),
          DataColumn(
            label: Text('Ev4'),
          ),
          DataColumn(
            label: Text('Ev5'),
          ),
          DataColumn(
            label: Text('Ev6'),
          ),
          DataColumn(
            label: Text('Ev7'),
          ),
          DataColumn(
            label: Text('Ev8'),
          ),
          DataColumn(
            label: Text('Ev9'),
          ),
          DataColumn(
            label: Text('Ev10'),
          ),
          DataColumn(
            label: Text('Ev11'),
          ),
          DataColumn(
            label: Text('Ev12'),
          ),
          DataColumn(
            label: Text('Ev13'),
          ),
          DataColumn(
            label: Text('Ev14'),
          ),
          DataColumn(
            label: Text('Ev15'),
          ),
          DataColumn(
            label: Text('Ev16'),
          ),
          DataColumn(
            label: Text('Ev17'),
          ),
          DataColumn(
            label: Text('Ev18'),
          ),
          DataColumn(
            label: Text('Ev19'),
          ),
          DataColumn(
            label: Text('Ev20'),
          ),
          DataColumn(
            label: Text('Ev21'),
          ),
          DataColumn(
            label: Text('Ev22'),
          ),
          DataColumn(
            label: Text('Ev23'),
          ),
          DataColumn(
            label: Text('Ev24'),
          ),
          DataColumn(
            label: Text('Ev25'),
          ),
          DataColumn(
            label: Text('Ev26'),
          ),
          DataColumn(
            label: Text('Ev27'),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(
                Container(
                  width: 160,
                  child: Row(
                    children: [
                      Image.asset('assets/images/player.png'),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('15   Mo Salah'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('Egyption'),
                            ),
                            Text('age  28'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataCell(Text('1')),
              DataCell(Text('2')),
              DataCell(Text('3')),
              DataCell(Text('4')),
              DataCell(Text('5')),
              DataCell(Text('6')),
              DataCell(Text('7')),
              DataCell(Text('8')),
              DataCell(Text('9')),
              DataCell(Text('10')),
              DataCell(Text('11')),
              DataCell(Text('12')),
              DataCell(Text('13')),
              DataCell(Text('14')),
              DataCell(Text('15')),
              DataCell(Text('16')),
              DataCell(Text('17')),
              DataCell(Text('18')),
              DataCell(Text('19')),
              DataCell(Text('20')),
              DataCell(Text('21')),
              DataCell(Text('22')),
              DataCell(Text('23')),
              DataCell(Text('24')),
              DataCell(Text('25')),
              DataCell(Text('26')),
              DataCell(Text('27')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Container(
                  width: 160,
                  child: Row(
                    children: [
                      Image.asset('assets/images/player.png'),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('15   Mo Salah'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('Egyption'),
                            ),
                            Text('age  28'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataCell(Text('1')),
              DataCell(Text('2')),
              DataCell(Text('3')),
              DataCell(Text('4')),
              DataCell(Text('5')),
              DataCell(Text('6')),
              DataCell(Text('7')),
              DataCell(Text('8')),
              DataCell(Text('9')),
              DataCell(Text('10')),
              DataCell(Text('11')),
              DataCell(Text('12')),
              DataCell(Text('13')),
              DataCell(Text('14')),
              DataCell(Text('15')),
              DataCell(Text('16')),
              DataCell(Text('17')),
              DataCell(Text('18')),
              DataCell(Text('19')),
              DataCell(Text('20')),
              DataCell(Text('21')),
              DataCell(Text('22')),
              DataCell(Text('23')),
              DataCell(Text('24')),
              DataCell(Text('25')),
              DataCell(Text('26')),
              DataCell(Text('27')),
            ],
          ),
        ],
      ),
    );
  }
}

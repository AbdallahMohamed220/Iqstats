import 'package:flutter/material.dart';



class BuildPlayerData extends StatelessWidget {
   BuildPlayerData({
    Key key,
    this.imgIsActive,
    this.columnHead,
    this.dataForEveryRow
  }) : super(key: key);

  List<String> columnHead;
  List<List<String>> dataForEveryRow;


  String playerName = "Mo salah";
  String playerNumber = "12";
  String natiolaity = "Egyption";
  String age = "28";

  bool imgIsActive;

  

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

          ... columnHead.map((col) => DataColumn(
            label: Text(col),
          ),).toList()
 
        ],
        rows: <DataRow>[

          ... dataForEveryRow.map((arrayVals) => DataRow(
            cells: <DataCell>[
              DataCell(
                Container(
                  width: 160,
                  child: Row(
                    children: [
                       imgIsActive ? Image.asset('assets/images/player.png') : SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('$playerNumber  $playerName'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('$natiolaity'),
                            ),
                            Text('age  $age'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ... arrayVals.map((val) => DataCell(Text(val))).toList()
            ],
          )).toList()
          


        ],
      ),
    );
  }
}



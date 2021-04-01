import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iqstats/constant.dart';
import 'package:iqstats/main_screen.dart';
import 'package:iqstats/services/matchServices.dart';
import 'package:video_player/video_player.dart';
import '../models/Event.dart';
import '../services/eventServices.dart';
import '../models/MatchData.dart';
import '../models/MatchEvent.dart';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class MatchStats extends StatefulWidget {
  @override
  _MatchStatsState createState() => _MatchStatsState();
}

class _MatchStatsState extends State<MatchStats> {
  bool checkedValue = false;
  bool checkedValue2 = false;
  bool isLines = false;
  List<Event> events;
  List<String> selectedEvents = [];
  List<String> firstTeamPlayers = [];
  List<String> secondTeamPlayers = [];
  List<MatchEvent> matchEvents;
  MatchEvent selectedEvent;
  bool isGoalPage = true;

  MatchData matchData;
  double _lowerValue = 0.0;
  double _upperValue = 130.0;
  double _lowerValueFormatter = 20.0;
  double _upperValueFormatter = 20.0;

  getMatchData() async {
    MatchData matchDataTemp = await MatchServices.getMatchData("1");
    setState(() {
      matchData = matchDataTemp;
    });
  }

  getMatchEvents() async {
    List<MatchEvent> temp = await MatchServices.getMatchEvents(
        events: selectedEvents.length > 0 ? json.encode(selectedEvents) : null,
        firstTeamPlayers:
            firstTeamPlayers.length > 0 ? json.encode(firstTeamPlayers) : null,
        secondTeamPlayers: secondTeamPlayers.length > 0
            ? json.encode(secondTeamPlayers)
            : null,
        startAtMins: _lowerValue.toString(),
        endAtMins: _lowerValue.toString(),
        matchId: "1");
    setState(() {
      matchEvents = temp;
    });
  }

  // events
  getEvents() async {
    List<Event> temp = await EventServices.getEvents();
    setState(() {
      events = temp;
    });
  }

  selectEventHandler(String eventId) {
    if (!selectedEvents.contains(eventId)) {
      setState(() {
        selectedEvents.add(eventId);
      });
    } else {
      setState(() {
        selectedEvents.remove(eventId);
      });
    }
  }

  selectTeamPlayersHandler(String playerId, int teamNumber) {
    if (teamNumber == 1) {
      print(playerId);
      if (!firstTeamPlayers.contains(playerId)) {
        setState(() {
          firstTeamPlayers.add(playerId);
        });
      } else {
        setState(() {
          firstTeamPlayers.remove(playerId);
        });
      }
    } else {
      if (!secondTeamPlayers.contains(playerId)) {
        setState(() {
          secondTeamPlayers.add(playerId);
        });
      } else {
        setState(() {
          secondTeamPlayers.remove(playerId);
        });
      }
    }
  }

  int selectedIndex;

  final textStyle = TextStyle(
    color: AppColor.kMainColor,
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );

  final items = [
    "My Team",
    "Oppesite Team",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get all events
    selectedIndex = 0;
    getEvents();
    getMatchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: getMatchEvents,
        tooltip: 'Search',
        child: const Icon(Icons.search),
      ),
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   toolbarHeight: 100,
      //   backgroundColor: Colors.white,
      //   elevation: 5,
      //   title: Image.asset(
      //     "assets/images/logo.png",
      //     scale: 9,
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  // Header
                  //
                  //
                  SizedBox(
                    height: 50,
                  ),
                  MatchInfo(),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // SelectedAction()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    !isGoalPage
                        ? SizedBox()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Shot",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Column(
                                        children: [
                                          Divider(),
                                          Row(
                                            children: [
                                              Checkbox(
                                                  value: false,
                                                  onChanged: (val) {}),
                                              Text("Goal"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Divider(),
                                          Row(
                                            children: [
                                              Checkbox(
                                                  value: false,
                                                  onChanged: (val) {}),
                                              Text("wide"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Divider(),
                                          Row(
                                            children: [
                                              Checkbox(
                                                  value: false,
                                                  onChanged: (val) {}),
                                              Text("on"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Divider(),
                                          Row(
                                            children: [
                                              Checkbox(
                                                  value: false,
                                                  onChanged: (val) {}),
                                              Text("blocked"),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "extera",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Column(
                                        children: [
                                          Divider(),
                                          Row(
                                            children: [
                                              Checkbox(
                                                  value: false,
                                                  onChanged: (val) {}),
                                              Text("plante"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Divider(),
                                          Row(
                                            children: [
                                              Checkbox(
                                                  value: false,
                                                  onChanged: (val) {}),
                                              Text("foul"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Attack type",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Column(
                                        children: [
                                          Divider(),
                                          Row(
                                            children: [
                                              Checkbox(
                                                  value: false,
                                                  onChanged: (val) {}),
                                              Text("option 1"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Divider(),
                                          Row(
                                            children: [
                                              Checkbox(
                                                  value: false,
                                                  onChanged: (val) {}),
                                              Text("option 2"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Body",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Column(
                                        children: [
                                          Divider(),
                                          Row(
                                            children: [
                                              Checkbox(
                                                  value: false,
                                                  onChanged: (val) {}),
                                              Text("option 1"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Divider(),
                                          Row(
                                            children: [
                                              Checkbox(
                                                  value: false,
                                                  onChanged: (val) {}),
                                              Text("option 2"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              )
                            ],
                          ),
                    isGoalPage
                        ? SizedBox()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Events",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ...events
                                  .map((event) => EventItem(
                                        title: event.name,
                                        id: event.id,
                                        isSelected:
                                            selectedEvents.contains(event.id),
                                        selectorHandler: selectEventHandler,
                                      ))
                                  .toList(),
                            ],
                          ),
                    matchData == null
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "players",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ...matchData.firstTeamPlayers
                                  .map((player) => PlayerItem(
                                        name: player.player.name,
                                        teamNumber: 1,
                                        id: player.player.id.toString(),
                                        isSelected: firstTeamPlayers.contains(
                                            player.player.id.toString()),
                                        selectorHandler:
                                            selectTeamPlayersHandler,
                                      ))
                                  .toList(),
                            ],
                          ),
                    matchData == null
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Against team",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ...matchData.secondTeamPlayers
                                  .map((player) => PlayerItem(
                                        name: player.player.name,
                                        id: player.player.id.toString(),
                                        teamNumber: 2,
                                        isSelected: secondTeamPlayers.contains(
                                            player.player.id.toString()),
                                        selectorHandler:
                                            selectTeamPlayersHandler,
                                      ))
                                  .toList(),
                            ],
                          ),
                    SizedBox(
                      width: 150,
                    ),
                    Column(
                      children: [
                        Container(
                          width: deviceWidth / 6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: items.map((item) {
                              return InkWell(
                                onTap: () {
                                  switch (item) {
                                    case 'My Team':
                                    case 'Oppesite Team':
                                      if (mounted) {
                                        setState(() {
                                          selectedIndex = items.indexOf(item);
                                        });

                                        // if (widget.onItemSelected != null) {
                                        //   widget.onItemSelected(selectedIndex);
                                        // }
                                      }
                                      break;
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item,
                                      style: textStyle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: textStyle.color.withOpacity(
                                          selectedIndex == items.indexOf(item)
                                              ? 1.0
                                              : 0.75,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      height: 2,
                                      width: 50,
                                      color:
                                          selectedIndex == items.indexOf(item)
                                              ? AppColor.kMainColor
                                              : Colors.transparent,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            RaisedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    isLines = !isLines;
                                  });
                                },
                                color: isLines ? Colors.green : Colors.grey,
                                icon: Icon(Icons.arrow_downward_outlined,
                                    color:
                                        isLines ? Colors.white : Colors.black),
                                label: Text(
                                  "display start and end",
                                  style: TextStyle(
                                      color: isLines
                                          ? Colors.white
                                          : Colors.black),
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            DropdownButton<String>(
                              value: "dvide - 3",
                              items: <String>[
                                'dvide - 3',
                                'dvide - 6',
                                'dvide - 9',
                                'dvide - 18'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        MatchMap(
                          matchEvents: matchEvents,
                          isLines: isLines,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text("Searching specific time"),
                        SizedBox(
                          width: 950,
                          child: frs.RangeSlider(
                            min: 0,
                            max: 130,
                            lowerValue: _lowerValue,
                            upperValue: _upperValue,
                            divisions: 130,
                            showValueIndicator: true,
                            valueIndicatorMaxDecimals: 2,
                            onChanged:
                                (double newLowerValue, double newUpperValue) {
                              setState(() {
                                _lowerValue = newLowerValue;
                                _upperValue = newUpperValue;
                              });
                            },
                            onChangeStart: (double startLowerValue,
                                double startUpperValue) {
                              print(
                                  'Started with values: $startLowerValue and $startUpperValue');
                            },
                            onChangeEnd:
                                (double newLowerValue, double newUpperValue) {
                              print(
                                  'Ended with values: $newLowerValue and $newUpperValue');
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              width: 1920.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x63d4aaaa),
                    offset: Offset(0, -3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  bool isSelected;
  dynamic selectorHandler;
  String title;
  String id;

  EventItem({this.isSelected, this.selectorHandler, this.title, this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Row(
          children: [
            Checkbox(
                value: isSelected, onChanged: (val) => selectorHandler(id)),
            Text(title),
          ],
        ),
      ],
    );
  }
}

class PlayerItem extends StatelessWidget {
  bool isSelected;
  dynamic selectorHandler;
  String name;
  String id;
  int teamNumber;

  PlayerItem(
      {this.isSelected,
      this.selectorHandler,
      this.name,
      this.id,
      this.teamNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Row(
          children: [
            Checkbox(
                value: isSelected,
                onChanged: (val) => selectorHandler(id, teamNumber)),
            Text(name),
          ],
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  double x1;
  double x2;
  double y1;
  double y2;

  MyPainter({this.x1, this.x2, this.y1, this.y2});

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(x1, y1);
    final p2 = Offset(x2, y2);
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class MatchMap extends StatefulWidget {
  bool isLines;
  bool isGoal;
  List<MatchEvent> matchEvents;
  MatchMap(
      {this.matchEvents, this.isLines = false, this.isGoal = false, Key key})
      : super(key: key);

  @override
  _MatchMapState createState() => _MatchMapState();
}

class _MatchMapState extends State<MatchMap> {
  double _currentSliderValue = 1;

  double rationconst = 9.2;
  Widget circle = new Container(
    width: 10.0,
    height: 10.0,
    decoration: new BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
  );

  @override
  initState() {
    super.initState();
  }

  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Future<void> _capturePng() async {
      print(globalKey.currentContext);
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      print(pngBytes);
    }

    return Column(
      children: [
        FlatButton(onPressed: _capturePng, child: Text("dowload")),
        widget.matchEvents == null
            ? widget.isGoal
                ? Image.asset("assets/images/playground.png")
                : Image.asset("assets/images/playground.png")
            : Stack(
                children: [
                  widget.isGoal
                      ? Image.asset("assets/images/playground.png")
                      : Image.asset("assets/images/playground.png"),
                  Positioned(
                    child: circle,
                    left: (60 * 9.2).toDouble(),
                    top: (40 * 9.2).toDouble(),
                  ),
                  ...widget.matchEvents.map((eve) {
                    if (eve.goalLocationX != "null" &&
                        eve.goalLocationY != "null") {
                      return Positioned(
                        child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => new AlertDialog(
                                        title: Text(" Match"),
                                        content: new SizedBox(
                                            height: 720,
                                            width: 1028,
                                            child: VideoApp()),
                                      ));
                            },
                            child: circle),
                        left: (double.parse(eve.goalLocationX) * 1).toDouble(),
                        top: (double.parse(eve.goalLocationY) * 1).toDouble(),
                      );
                    }

                    if (eve.startLocationX == "null" ||
                        eve.startLocationY == "null" ||
                        eve.endLocationX == "null" ||
                        eve.endLocationY == "null") {
                      return SizedBox();
                    } else {
                      // print(double.parse(eve.startLocationX) );
                      // print(eve.startLocationY == "null");
                      if (!widget.isLines) {
                        return Positioned(
                          child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => new AlertDialog(
                                          title: Text(" Match"),
                                          content: new SizedBox(
                                              height: 720,
                                              width: 1028,
                                              child: VideoApp()),
                                        ));
                              },
                              child: circle),
                          left: (double.parse(eve.startLocationX) * 9.2)
                              .toDouble(),
                          top: (double.parse(eve.startLocationY) * 9.2)
                              .toDouble(),
                        );
                      } else {
                        return Positioned(
                          child: InkWell(
                              // onTap: (){
                              //         showDialog(
                              //         context: context,
                              //         builder: (_) => new AlertDialog(
                              //               title: Text(" Match"),
                              //               content: new SizedBox(
                              //                 height: 720,
                              //                 width: 1028,
                              //                 child: VideoApp()),
                              //             ));
                              // },
                              child: CustomPaint(
                            painter: MyPainter(
                                x1: double.parse(eve.startLocationX),
                                x2: double.parse(eve.endLocationX),
                                y1: double.parse(eve.startLocationY),
                                y2: double.parse(eve.endLocationY)),
                          )),
                          left: (double.parse(eve.startLocationX) * 9.2)
                              .toDouble(),
                          top: (double.parse(eve.startLocationY) * 9.2)
                              .toDouble(),
                        );
                      }
                    }
                  }).toList(),
                  Row(
                    children: [
                      Container(
                        color: Colors.red.withOpacity(0.4),
                        height: 800,
                        width: 300,
                      ),
                      Container(
                        color: Colors.red.withOpacity(0.5),
                        height: 800,
                        width: 300,
                      ),
                      Container(
                        color: Colors.red.withOpacity(0.6),
                        height: 800,
                        width: 300,
                      ),
                      Container(
                        color: Colors.red.withOpacity(0.3),
                        height: 800,
                        width: 300,
                      ),
                    ],
                  )
                ],
              ),
      ],
    );
  }
}

class MatchInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Match Data here
        Image.network(
          "https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/Liverpool_FC.svg/1200px-Liverpool_FC.svg.png",
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Liverpool',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 25,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Premier League\n',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 12,
                  color: const Color(0xffc2bebe),
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectedAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // COL 1 -- PLAYERS
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // COL 1 -- PLAYERS -- CONTENT
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Player one name : Ahmed Hossam',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 15,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Player two name : 99.Karim El Tayeeb',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 15,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),

            // COL 2 -- DATA
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // COL 2 -- DATA -- CONTENT
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Time  : 12:9',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 15,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Action : Groud pass',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 15,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),

            SizedBox(
              width: 25,
            ),

            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                          title: Text(" Match"),
                          content: new SizedBox(
                              height: 720, width: 1028, child: VideoApp()),
                        ));
              },
              child: Container(
                width: 312.0,
                height: 62.0,
                child: Center(
                  child: Text(
                    'Watch',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29a8a5a5),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color(0xff679ea0),
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
      'https://r1---sn-hgn7yn7l.googlevideo.com/videoplayback?expire=1613586085&ei=RQotYJ7PGMGk8gPao5e4Dw&ip=197.53.169.8&id=o-AB97lnx8SVOqJ9Jd5nD28IUwXpy10pSTLDoCQjp1xjqo&itag=18&source=youtube&requiressl=yes&gcr=eg&vprv=1&mime=video%2Fmp4&ns=lEZ6qzloyPxajMncweXXBHQF&gir=yes&clen=45571837&ratebypass=yes&dur=690.398&lmt=1613533024781262&fvip=1&c=WEB&txp=5530434&n=2K9Y4mir1jOCrW7h1&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cgcr%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIhANI2yGKas3k1BU-MNxnudnUGAcqWPLnS7HxOM6lAhQLkAiB5M2NzpovqSBlbDD-BZ-xP4Q1sLTOoKb9Fk8-Jft0Mxg%3D%3D&rm=sn-uxaxjvhxbt2u-5atd7e,sn-hgnlz7e&req_id=32445efe846da3ee&redirect_counter=2&cms_redirect=yes&ipbypass=yes&mh=jX&mip=45.100.111.1&mm=29&mn=sn-hgn7yn7l&ms=rdu&mt=1613571420&mv=m&mvi=1&pl=19&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRAIgDR8Eo3dM27IUC0tHyXvYvZV7L7_pt62E3S7ghJOZK4ECIEXR8VuPiYfmwhjFwkDRFMTgMHRpgt9uHuahvLRw2mjE',
    )..initialize().then((_) {
        _controller.seekTo(Duration(seconds: 10));
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});

        Future.delayed(Duration(milliseconds: 3000), () {
          setState(() {
            _controller.pause();
          });
        });
      });
  }

  //       FloatingActionButton(
  //   onPressed: () {
  //     setState(() {
  //       _controller.value.isPlaying
  //           ? _controller.pause()
  //           : _controller.play();
  //     });
  //   },
  //   child: Icon(
  //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
  //   ),
  // )

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          //  _controller.value.initialized
          //     ? AspectRatio(
          //         aspectRatio: _controller.value.aspectRatio,
          //         child: VideoPlayer(_controller),
          //       )
          //     :
          Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

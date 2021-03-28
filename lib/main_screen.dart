import 'package:flutter/material.dart';
import 'package:iqstats/screens/compare/compare.dart';
import 'package:iqstats/screens/nav_bar/nav_bar.dart';
import 'package:iqstats/screens/table/table.dart';

var deviceWidth;
var deviceHeight;

class MainPage extends StatelessWidget {
  final int pageIndex;
  final void Function(int index) onItemSelected;

  const MainPage({@required this.pageIndex, this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          PageBody(
            pageIndex: pageIndex,
            onItemSelected: onItemSelected,
          ),
        ],
      ),
    );
  }
}

class PageBody extends StatefulWidget {
  final int pageIndex;
  final void Function(int index) onItemSelected;

  const PageBody({@required this.pageIndex, this.onItemSelected});

  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  final pages = [
    TableScreen(),
    TableScreen(),
    TableScreen(),
    TableScreen(),
    CompareScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Navbar(
          selectedIndex: widget.pageIndex,
          onItemSelected: widget.onItemSelected,
        ),
        Expanded(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: pages[widget.pageIndex],
          ),
        ),
      ],
    );
  }
}

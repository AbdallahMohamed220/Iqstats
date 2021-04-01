import 'package:flutter/material.dart';
import 'package:iqstats/constant.dart';
import 'package:iqstats/main_screen.dart';

class Navbar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index) onItemSelected;

  Navbar({this.selectedIndex = 0, @required this.onItemSelected});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex;

  final textStyle = TextStyle(
    color: AppColor.kMainColor,
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );

  final items = [
    "Overview",
    "Goalkeepers",
    "Players",
    "teams",
    "Compare",
    "Search",
  ];

  @override
  void initState() {
    super.initState();

    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,
      color: AppColor.kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: deviceWidth / 8,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 70,
              ),
            ),
          ),
          Container(
            width: deviceWidth / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.map((item) {
                return InkWell(
                  onTap: () {
                    switch (item) {
                      case 'Overview':
                      case 'Goalkeepers':
                      case 'Players':
                      case 'teams':
                      case 'Search':
                      case 'Compare':
                        if (mounted) {
                          setState(() {
                            selectedIndex = items.indexOf(item);
                          });

                          if (widget.onItemSelected != null) {
                            widget.onItemSelected(selectedIndex);
                          }
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
                            selectedIndex == items.indexOf(item) ? 1.0 : 0.75,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 2,
                        width: 50,
                        color: selectedIndex == items.indexOf(item)
                            ? AppColor.kMainColor
                            : Colors.transparent,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}

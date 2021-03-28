import 'package:flutter/material.dart';
import 'package:iqstats/constant.dart';

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
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  final items = [
    'Overview',
    'Page_1',
    'Page_2',
    'Page_3',
    'Page_4',
    'Page_5',
    'Page_6',
    'Page_7',
  ];

  @override
  void initState() {
    super.initState();

    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 72,
        width: double.infinity,
        color: AppColor.kPrimaryColor,
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items.map((item) {
                  return InkWell(
                    onTap: () {
                      if (mounted) {
                        setState(() {
                          selectedIndex = items.indexOf(item);
                        });
                        print(item);
                        if (widget.onItemSelected != null) {
                          widget.onItemSelected(selectedIndex);
                        }
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
                          width: 60,
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
          ],
        ),
      ),
    );
  }
}

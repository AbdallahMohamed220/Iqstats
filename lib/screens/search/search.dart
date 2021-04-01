import 'package:flutter/material.dart';
import 'package:iqstats/constant.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: AppColor.kPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: deviceHeight / 8,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 20,
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Search',
                    style: TextStyle(
                      color: AppColor.kSecondaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                right: 30,
                left: 30,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter vaild Value';
                  }
                  if (value.length <= 2) {
                    return 'Enter vaild Value';
                  }
                  return "";
                },
                decoration: InputDecoration(
                  suffix: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: AppColor.kSecondaryColor,
                    ),
                    onPressed: () {},
                  ),
                  hintText: 'keword',
                  focusedBorder: UnderlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/player.png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                              bottom: 5,
                            ),
                            child: Text('Mo Salah'),
                          ),
                          Text('Player'),
                        ],
                      )
                    ],
                  ),
                  Divider()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iqstats/constant.dart';
import 'package:iqstats/screens/video_list/video_list.dart';
import 'package:iqstats/shared_components/change_layout/change_layout.dart';

class ActionListData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: deviceWidth / 2.5,
          height: deviceHeight / 1.65,
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (_, i) => Container(
              height: 60,
              child: Card(
                elevation: 2,
                color: Color(0xff679EA0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0, top: 5),
                              child: Text(
                                'Player one name : Ahmed Hossam',
                                style: TextStyle(
                                  color: AppColor.kPrimaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5.0,
                                top: 5,
                              ),
                              child: Text(
                                'Player two name : Mo Salah',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColor.kPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0, top: 5),
                              child: Text(
                                'Time  : 12:9',
                                style: TextStyle(
                                  color: AppColor.kPrimaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0, top: 5),
                              child: Text(
                                'Action  type',
                                style: TextStyle(
                                  color: AppColor.kPrimaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: deviceWidth * 0.15,
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: ElevatedButton(
                              child: Text(
                                'Watch',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.kSecondaryColor,
                                ),
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: AppColor.kPrimaryColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          width: deviceWidth * 0.57,
          height: deviceWidth / 3.5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 25.0,
                  top: 25,
                ),
                child: Image.asset(
                  'assets/images/video_play.png',
                  fit: BoxFit.cover,
                  height: 300,
                  width: 800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 20),
                child: ElevatedButton(
                  child: Text(
                    'Back to main page',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.kPrimaryColor,
                    ),
                  ),
                  onPressed: () => changeLayout(context),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff679EA0),
                    minimumSize: Size(
                      200,
                      50,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

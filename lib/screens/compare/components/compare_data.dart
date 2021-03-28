import 'package:flutter/material.dart';
import 'package:iqstats/constant.dart';

class CompareData extends StatelessWidget {
  const CompareData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Text('Event'),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/ahly.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Ahly'),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/zamalk.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Zamalk'),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.kSecondaryColor,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Add More'),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              Text('EV1'),
              SizedBox(
                width: 40,
              ),
              Row(
                children: [
                  Icon(Icons.perm_device_information_rounded),
                  Text('12'),
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Row(
                children: [
                  Icon(Icons.perm_device_information_rounded),
                  Text('12'),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              Text('EV1'),
              SizedBox(
                width: 40,
              ),
              Row(
                children: [
                  Icon(Icons.perm_device_information_rounded),
                  Text('12'),
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Row(
                children: [
                  Icon(Icons.perm_device_information_rounded),
                  Text('12'),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iqstats/main_screen.dart';
import 'package:iqstats/shared_components/change_layout/components/change_layout_actions_title.dart';
import 'package:iqstats/shared_components/change_layout/components/sub_action.dart';

Future<void> changeLayout(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop())
          ],
        ),
        content: Builder(
          builder: (context) {
            return Container(
              width: deviceWidth,
              height: deviceHeight - 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.perm_device_info_rounded),
                      Text('change table layout'),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ChangeLayoutActionsTitle(),
                  SubActionTitle(),
                  SubActionTitle(),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

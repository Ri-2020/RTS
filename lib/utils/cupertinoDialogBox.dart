import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void CupertinoDialogBox(context, onPressedYes, String? title, des) {
  showCupertinoDialog(
      context: context,
      builder: (BuildContext ctx) {
        return CupertinoAlertDialog(
          title: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(title ?? ""),
              )),
          content: Align(alignment: Alignment.centerLeft, child: Text(des)),
          actions: [
            // The "Yes" button
            CupertinoDialogAction(
              onPressed: onPressedYes,
              child: const Text('Yes'),
              isDefaultAction: true,
              isDestructiveAction: true,
            ),
            // The "No" button
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
              isDefaultAction: false,
              isDestructiveAction: false,
            )
          ],
        );
      });
}

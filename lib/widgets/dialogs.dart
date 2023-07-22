import 'package:cj_app/helpers/app_style.constants.dart';
import 'package:flutter/material.dart';

showConfirmLogout(BuildContext context, String title, String content,
    Function cancelFun, Function confirmFun) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          ElevatedButton(
            style: confirmBtnStyle,
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              confirmFun();
            },
          ),
          ElevatedButton(
            style: confirmBtnStyle,
            child: const Text(
              "No",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              cancelFun();
              Navigator.pop(context, 'Cancel');
            },
          ),
        ],
      );
    },
  );
}

import 'dart:ui';

import 'package:flutter/material.dart';

class AppHelperFunction {
  static Color? getColor(String value) {
    if (value == "white") {
      return Colors.white;
    } else if (value == "black") {
      return Colors.black;
    } else if (value == "red") {
      return Colors.red;
    } else if (value == "green") {
      return Colors.green;
    } else if (value == "blue") {
      return Colors.blue;
    } else if (value == "yellow") {
      return Colors.yellow;
    } else if (value == "orange") {
      return Colors.orange;
    } else if (value == "purple") {
      return Colors.purple;
    } else if (value == "pink") {
      return Colors.pink;
    } else if (value == "grey") {
      return Colors.grey;
    } else if (value == "brown") {
      return Colors.brown;
    } else if (value == "cyan") {
      return Colors.cyan;
    } else if (value == "teal") {
      return Colors.teal;
    } else if (value == "indigo") {
      return Colors.indigo;
    } else if (value == "amber") {
      return Colors.amber;
    } else if (value == "lime") {
      return Colors.lime;
    } else if (value == "deepOrange") {
      return Colors.deepOrange;
    } else if (value == "deepPurple") {
      return Colors.deepPurple;
    } else {
      return null;
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static String turncateText(String text, int maxLenght) {
    if (text.length > maxLenght) {
      return text;
    } else {
      return '${text.substring(0, maxLenght)} ...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size sizeScreen(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

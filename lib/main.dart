import 'package:flutter/material.dart';

void main() {
  runApp(const Shopora());
}

class Shopora extends StatelessWidget {
  const Shopora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Column(),
    );
  }
}


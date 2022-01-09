import 'package:flutter/material.dart';

class TestScreens extends StatefulWidget {
  Color? color;

  TestScreens({Key? key, this.color}) : super(key: key);

  @override
  _TestScreensState createState() => _TestScreensState();
}

class _TestScreensState extends State<TestScreens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [widget.color ?? Colors.blueAccent, Colors.white]
        ),
      ),
    );
  }
}

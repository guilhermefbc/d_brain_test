import 'package:flutter/material.dart';

class SimpleCustomButton extends StatefulWidget {
  Widget child;
  Function()? onTap;
  Color color;

  SimpleCustomButton({Key? key, required this.child, this.onTap, required this.color}) : super(key: key);

  @override
  _SimpleCustomButtonState createState() => _SimpleCustomButtonState();
}

class _SimpleCustomButtonState extends State<SimpleCustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 130.0,
        padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 3.0, bottom: 3.0),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}

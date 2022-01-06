import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleIconButton extends StatefulWidget {
   Function()? function;
   Widget? icon1;
   Widget? icon2;
   bool selectIcon1;

  SimpleIconButton({
    Key? key,
    @required this.function,
    @required this.icon1,
    this.icon2,
    this.selectIcon1 = true
  }) : super(key: key);

  @override
  _SimpleIconButtonState createState() => _SimpleIconButtonState();
}

class _SimpleIconButtonState extends State<SimpleIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.selectIcon1 ? widget.icon1 : widget.icon2,
      onTap: widget.function ,
    );
  }
}

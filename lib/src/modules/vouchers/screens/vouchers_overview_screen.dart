import 'package:flutter/material.dart';

class VouchersOverviewScreen extends StatefulWidget {
  const VouchersOverviewScreen({Key? key}) : super(key: key);

  @override
  _VouchersOverviewScreenState createState() => _VouchersOverviewScreenState();
}

class _VouchersOverviewScreenState extends State<VouchersOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.white]
        ),
      ),
    );
  }
}

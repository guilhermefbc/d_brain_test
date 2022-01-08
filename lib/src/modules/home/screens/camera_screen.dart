import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CameraCamera(
            onFile: (file) {
              _file = file;
              print(_file);
              Modular.to.pop();
            },
        )
    );
  }
}

import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:d_brain_test/src/modules/camera/controllers/camera/my_camera_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final MyCameraController _myCameraController = Modular.get<MyCameraController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CameraCamera(
            onFile: (file) {
              _myCameraController.photo = file;
              _myCameraController.showPhoto();
            },
        )
    );
  }
}

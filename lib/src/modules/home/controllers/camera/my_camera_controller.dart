import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'my_camera_controller.g.dart';

class MyCameraController = _MyCameraController with _$MyCameraController;

abstract class _MyCameraController with Store {
  @observable
  File? photo;

  takePhoto(int index) {
    if(index == 2) {
      Modular.to.pushNamed('/home/camera');
    }
  }

  showPhoto() async {
    bool? hasPhoto = await Modular.to.pushNamed('/home/photo');
    if(hasPhoto ?? true){
      Modular.to.pop();
    }
  }
}
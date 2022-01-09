import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

part 'my_camera_controller.g.dart';

class MyCameraController = _MyCameraController with _$MyCameraController;

abstract class _MyCameraController with Store {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  @observable
  File? photo;

  navigateBetweenScreens(int index) {
    switch(index) {
      case 0: Modular.to.navigate("/home/voucher/"); break;
      case 1: Modular.to.navigate("/home/test1"); break;
      case 2: Modular.to.pushNamed('/home/camera'); break;
      case 3: Modular.to.navigate("/home/test2"); break;
      case 4: Modular.to.navigate("/home/test3"); break;
    }
  }

  showPhoto() async {
    bool? hasPhoto = await Modular.to.pushNamed('/home/photo');
    if(hasPhoto ?? false){
      // putPhoto();
      Modular.to.pop();
    }
  }

  //  putPhoto() async {
  //   try {
  //     String ref = 'images/img-${DateTime.now().toString()}.jpg';
  //
  //     return await firebase_storage.FirebaseStorage.instance
  //         .ref(ref)
  //         .putFile(photo!);
  //   } on firebase_core.FirebaseException catch (e) {
  //     // e.g, e.code == 'canceled'
  //   }
  // }
}
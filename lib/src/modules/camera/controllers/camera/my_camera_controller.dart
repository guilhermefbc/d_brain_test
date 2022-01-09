import 'dart:io';

import 'package:d_brain_test/src/modules/vouchers/controllers/vouchers/vouchers_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

part 'my_camera_controller.g.dart';

class MyCameraController = _MyCameraController with _$MyCameraController;

abstract class _MyCameraController with Store {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  final VouchersController _vouchersController = Modular.get<VouchersController>();

  @observable
  File? photo;

  showPhoto() async {
    bool? hasPhoto = await Modular.to.pushNamed('/home/camera/photo');
    if(hasPhoto ?? false){
      _vouchersController.createNewVoucher(photo!);
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
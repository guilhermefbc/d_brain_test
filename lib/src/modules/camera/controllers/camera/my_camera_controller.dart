import 'dart:io';

import 'package:d_brain_test/src/modules/vouchers/controllers/vouchers/vouchers_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'my_camera_controller.g.dart';

class MyCameraController = _MyCameraController with _$MyCameraController;

abstract class _MyCameraController with Store {
  final VouchersController _vouchersController = Modular.get<VouchersController>();

  @observable
  File? photo;

  showPhoto() async {
    bool? hasPhoto = await Modular.to.pushNamed('/home/camera/photo');
    if(hasPhoto ?? false){
      _vouchersController.createNewVoucher(photo!);
      Modular.to.pop();
    }
  }

}
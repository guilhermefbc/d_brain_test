
import 'package:d_brain_test/src/modules/camera/screens/camera_screen.dart';
import 'package:d_brain_test/src/modules/camera/screens/show_photo_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CameraModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => super.binds;

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const CameraScreen(),),
    ChildRoute('/photo', child: (context, args) => const ShowPhotoScreen(),),
  ];


}
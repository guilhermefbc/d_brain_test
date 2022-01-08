import 'package:d_brain_test/src/modules/home/screens/camera_screen.dart';
import 'package:d_brain_test/src/modules/home/screens/home_screen.dart';
import 'package:d_brain_test/src/modules/home/screens/show_photo_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/camera/my_camera_controller.dart';
import 'controllers/home/home_controller.dart';

class HomeModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    Bind.factory((i) => HomeController()),
    Bind.lazySingleton((i) => MyCameraController()),
  ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomeScreen(),),
    ChildRoute('/camera', child: (context, args) => const CameraScreen(),),
    ChildRoute('/photo', child: (context, args) => const ShowPhotoScreen(),),
  ];
}
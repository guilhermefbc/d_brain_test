import 'package:d_brain_test/src/modules/auth/screen/login_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => super.binds;

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const LoginScreen()),
  ];
}
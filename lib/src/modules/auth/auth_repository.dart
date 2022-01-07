import 'package:d_brain_test/src/modules/auth/screens/login_screen.dart';
import 'package:d_brain_test/src/modules/home/home_module.dart';
import 'package:d_brain_test/src/shared/repositories/authLogin/auth_login_controller.dart';
import 'package:d_brain_test/src/shared/repositories/auth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AuthModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    Bind((i) => AuthLoginController()),
    Bind((i) => AuthFirebaseRepository())
  ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const LoginScreen()),
    ModuleRoute('/home', module: HomeModule())
  ];
}
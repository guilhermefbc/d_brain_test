import 'package:d_brain_test/src/modules/auth/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => super.binds;

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: AuthModule()),
  ];

}
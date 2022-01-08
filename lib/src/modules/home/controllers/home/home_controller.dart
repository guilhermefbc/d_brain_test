import 'package:d_brain_test/src/shared/repositories/authLogin/auth_login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {

  logOut() async {
    await Modular.get<AuthLoginController>().logOut();
    Modular.to.pushReplacementNamed('/login');
  }

  navigateToScreens(int index) {
    if(index == 2) {
      Modular.to.pushNamed('/home/camera');
    }
  }
}
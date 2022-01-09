import 'package:d_brain_test/src/shared/repositories/authLogin/auth_login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {

  navigateBetweenScreens(int index) {
    switch(index) {
      case 0: Modular.to.navigate("/home/voucher/"); break;
      case 1: Modular.to.navigate("/home/test1"); break;
      case 2: Modular.to.pushNamed('/home/camera/'); break;
      case 3: Modular.to.navigate("/home/test2"); break;
      case 4: Modular.to.navigate("/home/test3"); break;
    }
  }

  logOut() async {
    await Modular.get<AuthLoginController>().logOut();
    Modular.to.pushReplacementNamed('/login');
  }

}
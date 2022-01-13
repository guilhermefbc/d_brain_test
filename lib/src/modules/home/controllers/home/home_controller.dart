import 'package:d_brain_test/src/shared/notifications/main_notifications.dart';
import 'package:d_brain_test/src/shared/repositories/authLogin/auth_login_controller.dart';
import 'package:d_brain_test/src/shared/sharedPreferences/my_shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  bool withNotification = false;

  enableBackgroundNotification() {
    MySharedPreferences.setWhetherHasPendingVouchers(withNotification);
    if(withNotification) {
      MainNotifications.showCustomPushNotification(
        "Background notification",
        "Background notification was activated"
      );
    }else {
      MainNotifications.showCustomPushNotification(
          "Background notification",
          "Background notification was disabled"
      );
    }
  }

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
    Modular.to.navigate("/");
  }

}
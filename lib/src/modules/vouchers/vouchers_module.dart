
import 'package:d_brain_test/src/modules/vouchers/screens/vouchers_overview_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/vouchers/vouchers_controller.dart';

class VouchersModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => VouchersController()),
  ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const VouchersOverviewScreen(),),
  ];
}
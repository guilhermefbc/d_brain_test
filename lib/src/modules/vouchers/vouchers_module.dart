
import 'package:d_brain_test/src/modules/vouchers/screens/vouchers_overview_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class VouchersModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => super.binds;

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const VouchersOverviewScreen(),),
  ];
}
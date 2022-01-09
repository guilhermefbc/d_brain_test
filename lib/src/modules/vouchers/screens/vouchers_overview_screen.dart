import 'package:d_brain_test/src/modules/vouchers/controllers/vouchers/vouchers_controller.dart';
import 'package:d_brain_test/src/modules/vouchers/widgets/voucher_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class VouchersOverviewScreen extends StatefulWidget {
  const VouchersOverviewScreen({Key? key}) : super(key: key);

  @override
  _VouchersOverviewScreenState createState() => _VouchersOverviewScreenState();
}

class _VouchersOverviewScreenState extends State<VouchersOverviewScreen> {
  final VouchersController _vouchersController = Modular.get<VouchersController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.white]
        ),
      ),
      child: ListView.builder(
          itemCount: _vouchersController.voucherList.length,
          itemBuilder: (context, index) {
            return VoucherItemWidget(voucherController: _vouchersController.voucherList[index],);
          },
      ),
    );
  }
}

import 'dart:io';

import 'package:d_brain_test/src/modules/vouchers/controllers/voucher/voucher_controller.dart';
import 'package:mobx/mobx.dart';
part 'vouchers_controller.g.dart';

class VouchersController = _VouchersController with _$VouchersController;

abstract class _VouchersController with Store {
  ObservableList<VoucherController> voucherList = ObservableList<VoucherController>();

  @action
  void _addVoucher(VoucherController voucher) {
    voucherList.insert(0, voucher);
  }

  createNewVoucher(File file) {
    VoucherController newVoucher = VoucherController(date: DateTime.now(), file: file);
    _addVoucher(newVoucher);
  }
}
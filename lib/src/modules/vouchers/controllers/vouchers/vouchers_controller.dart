import 'dart:io';

import 'package:d_brain_test/src/modules/vouchers/controllers/voucher/voucher_controller.dart';
import 'package:d_brain_test/src/modules/vouchers/services/vouchers_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'vouchers_controller.g.dart';

class VouchersController = _VouchersController with _$VouchersController;

abstract class _VouchersController with Store {
  ObservableList<VoucherController> voucherList = ObservableList<VoucherController>();

  final VoucherServices _voucherServices = VoucherServices();

  @action
  void _addVoucher(VoucherController voucher) {
    voucherList.insert(0, voucher);
  }

  createNewVoucher(File file) async {
    VoucherController newVoucher = VoucherController(date: DateTime.now(), file: file);
    _addVoucher(newVoucher);
    UploadTask? progress = await _voucherServices.putPhoto(file);
    newVoucher.uploadStatus(progress);
  }
}
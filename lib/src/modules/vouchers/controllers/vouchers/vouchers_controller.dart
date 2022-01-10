import 'dart:io';

import 'package:d_brain_test/src/modules/vouchers/controllers/voucher/voucher_controller.dart';
import 'package:d_brain_test/src/modules/vouchers/services/vouchers_storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'vouchers_controller.g.dart';

class VouchersController = _VouchersController with _$VouchersController;

abstract class _VouchersController with Store {
  final VouchersStorageService _voucherServices = VouchersStorageService();

  ObservableList<VoucherController> voucherList = ObservableList<VoucherController>();

  @observable
  bool loading = true;

  @action
  void _addVoucher(VoucherController voucher) {
    voucherList.insert(0, voucher);
  }

  createNewVoucher(File file) {
    VoucherController newVoucher = VoucherController(date: DateTime.now(), file: file);
    _addVoucher(newVoucher);
    UploadTask? progress = _voucherServices.putPhoto(newVoucher.file!, newVoucher.date.toString());
    newVoucher.uploadStatus(progress);
  }

  @action
  getAllVouchers() async {
    if(voucherList.isEmpty) {
      List<Map<String,String?>> vouchersData = await _voucherServices.getAllVouchersRefs();
      vouchersData.forEach((voucherData) {
        _addVoucher(VoucherController(
            link: voucherData["link"],
            date: DateTime.parse(voucherData["date"]!),
            status: VoucherStatus.uploaded
        ));
      });
    }
    loading = false;
  }
}
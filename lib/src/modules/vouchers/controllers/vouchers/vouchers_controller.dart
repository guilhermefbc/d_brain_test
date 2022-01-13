import 'dart:io';

import 'package:d_brain_test/src/modules/vouchers/controllers/voucher/voucher_controller.dart';
import 'package:d_brain_test/src/modules/vouchers/services/vouchers_firestore_service.dart';
import 'package:d_brain_test/src/modules/vouchers/services/vouchers_storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'vouchers_controller.g.dart';

class VouchersController = _VouchersController with _$VouchersController;

abstract class _VouchersController with Store {
   static VouchersStorageService _voucherServices = VouchersStorageService();
   static VouchersFirestoreService _vouchersFirestoreService = VouchersFirestoreService();

  ObservableList<VoucherController> voucherList = ObservableList<VoucherController>();

  @observable
  bool loading = true;

  @action
  void _addVoucher(VoucherController voucher) {
    voucherList.insert(0, voucher);
  }

  String _getVoucherFileName(String dateNow) {
    return "img-$dateNow.jpg";
  }


  createNewVoucher(File file) {
    DateTime dateNow = DateTime.now();

    VoucherController newVoucher = VoucherController(date: dateNow, file: file, name: _getVoucherFileName(dateNow.toString()));
    _addVoucher(newVoucher);
    _vouchersFirestoreService.addVoucher(newVoucher);
    UploadTask? progress = _voucherServices.putVoucher(newVoucher);
    newVoucher.uploadStatus(progress);
  }

  getAllVouchers() async {
    if(voucherList.isEmpty) {
      List<Map<String, dynamic>>? maps = await _vouchersFirestoreService.getAllVouchers();

      maps?.forEach((map) {
        print(map.toString());
        _addVoucher(VoucherController(
            date: DateTime.parse(map["date"]),
            name: map["name"],
            status: VoucherStatus.uploaded
        ));
      });
    }
    loading = false;

    ///Get all vouchers by firebase storage
    // if(voucherList.isEmpty) {
    //   List<Map<String,String?>> vouchersData = await _voucherServices.getAllVouchersRefs();
    //   vouchersData.forEach((voucherData) {
    //     _addVoucher(VoucherController(
    //         link: voucherData["link"],
    //         date: DateTime.parse(voucherData["date"]!),
    //         status: VoucherStatus.uploaded,
    //         name: 'Document'
    //     ));
    //   });
    // }
  }

}
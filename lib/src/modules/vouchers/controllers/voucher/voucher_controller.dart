import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
part 'voucher_controller.g.dart';

class VoucherController = _VoucherController with _$VoucherController;

abstract class _VoucherController with Store {
  File? file;
  String? link;
  DateTime date;

  @observable
  VoucherStatus status;

  _VoucherController({
    this.file,
    this.link,
    this.status = VoucherStatus.pendent,
    required this.date
  });

  @action
  uploadStatus(UploadTask? progress) {
    progress?.snapshotEvents.listen((TaskSnapshot snapshot) {
      switch(snapshot.state) {
        case TaskState.running: status = VoucherStatus.loading; break;
        case TaskState.success: status = VoucherStatus.uploaded; break;
        case TaskState.error: status = VoucherStatus.failed; break;
        case TaskState.canceled: status = VoucherStatus.failed; break;
        case TaskState.paused: status = VoucherStatus.pendent; break;
      }
    });
  }
}

enum VoucherStatus {
 uploaded, pendent, failed, loading
}
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
part 'voucher_controller.g.dart';

class VoucherController = _VoucherController with _$VoucherController;

abstract class _VoucherController with Store {
  File file;
  DateTime date;

  @observable
  VoucherStatus status = VoucherStatus.noUploaded;

  _VoucherController({
    required this.file,
    required this.date
  });
}

enum VoucherStatus {
 uploaded, noUploaded, withProblem
}
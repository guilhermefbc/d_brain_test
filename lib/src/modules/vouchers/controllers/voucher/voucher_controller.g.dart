// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VoucherController on _VoucherController, Store {
  final _$statusAtom = Atom(name: '_VoucherController.status');

  @override
  VoucherStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(VoucherStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$_VoucherControllerActionController =
      ActionController(name: '_VoucherController');

  @override
  dynamic uploadStatus(UploadTask? progress) {
    final _$actionInfo = _$_VoucherControllerActionController.startAction(
        name: '_VoucherController.uploadStatus');
    try {
      return super.uploadStatus(progress);
    } finally {
      _$_VoucherControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}

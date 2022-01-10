// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vouchers_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VouchersController on _VouchersController, Store {
  final _$loadingAtom = Atom(name: '_VouchersController.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_VouchersControllerActionController =
      ActionController(name: '_VouchersController');

  @override
  void _addVoucher(VoucherController voucher) {
    final _$actionInfo = _$_VouchersControllerActionController.startAction(
        name: '_VouchersController._addVoucher');
    try {
      return super._addVoucher(voucher);
    } finally {
      _$_VouchersControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}

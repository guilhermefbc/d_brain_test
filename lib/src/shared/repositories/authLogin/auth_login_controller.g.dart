// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthLoginController on _AuthLoginController, Store {
  final _$_userAtom = Atom(name: '_AuthLoginController._user');

  @override
  User? get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(User? value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  final _$statusAtom = Atom(name: '_AuthLoginController.status');

  @override
  AuthStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$_setUserAsyncAction = AsyncAction('_AuthLoginController._setUser');

  @override
  Future _setUser(User? user) {
    return _$_setUserAsyncAction.run(() => super._setUser(user));
  }

  final _$loginWithEmailAsyncAction =
      AsyncAction('_AuthLoginController.loginWithEmail');

  @override
  Future loginWithEmail(String email, String password) {
    return _$loginWithEmailAsyncAction
        .run(() => super.loginWithEmail(email, password));
  }

  final _$logOutAsyncAction = AsyncAction('_AuthLoginController.logOut');

  @override
  Future logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}

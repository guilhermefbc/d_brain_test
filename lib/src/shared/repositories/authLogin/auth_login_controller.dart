import 'package:d_brain_test/src/shared/repositories/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'auth_login_controller.g.dart';

class AuthLoginController = _AuthLoginController with _$AuthLoginController;

abstract class _AuthLoginController with Store {
  final AuthFirebaseRepository _authFirebaseRepository = Modular.get<AuthFirebaseRepository>();

  @observable
  User? _user;

  @observable
  AuthStatus status = AuthStatus.loading;

  _AuthLoginController() {
    _setUser(_authFirebaseRepository.getUser());
  }

  @action
  _setUser(User? user) async {
    _user = user;
    await Future.delayed(const Duration(seconds: 2));
    status = user == null ? AuthStatus.logoff : AuthStatus.login;
  }

  @action
  loginWithEmail(String email, String password) async {
    try{
      _user = await _authFirebaseRepository.signInWithEmailAndPassword(email, password);
    }catch(e){
      throw Exception(e);
    }
  }

  @action
  logOut() async {
    _user = null;
    status = AuthStatus.logoff;
    await _authFirebaseRepository.logOut();
  }

}

enum AuthStatus {
  loading, login, logoff
}
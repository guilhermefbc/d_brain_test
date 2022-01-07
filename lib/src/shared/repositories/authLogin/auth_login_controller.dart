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

  _AuthLoginController() {
    _user = _authFirebaseRepository.getUser();
  }

  @action
  loginWithEmail(String email, String password) async {
    try{
      _user = await _authFirebaseRepository.signInWithEmailAndPassword(email, password);
    }catch(e){
      throw Exception(e);
    }
  }



}
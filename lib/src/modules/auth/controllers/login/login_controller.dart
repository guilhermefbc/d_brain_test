
import 'package:d_brain_test/src/shared/repositories/authLogin/auth_login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final AuthLoginController _authLoginController = Modular.get<AuthLoginController>();

  @observable
  String _email = "";

  @observable
  String _password = "";

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool _loggedIn = false;

  @observable
  String? emailError;

  @observable
  String? passwordError;

  @action
  togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  setEmail(String email) => _email = email;

  @action
  setPassword(String password) => _password = password;

  @action
  _cleanLoginValuesAfterLogin() {
    _password = "";
    _email = "";
  }

  @action
  login() async {
    try{
      loading = true;
      await _authLoginController.loginWithEmail(_email, _password);
      _cleanLoginValuesAfterLogin();
      Modular.to.pushReplacementNamed('/home/');
      loading = false;
      _loggedIn = true;
      _cleanErrorMessage();
    } catch(_){
      loading = false;
      _buildErrorMessage();
    }
  }

  @action
  _buildErrorMessage() {
    if(_email.trim() == "") {
      emailError = "Email is empty";
    }else if(!isEmailValid) {
      emailError = "Email not valid";
    }

    if(_password.trim() == "") {
      passwordError = "Password is empty";
    }else if(!isPasswordValid) {
      passwordError = "Password less than 6 characters";
    }
  } 

  @action
  _cleanErrorMessage() {
    emailError = null;
    passwordError = null;
  }

  @computed
  bool get loggedIn => _loggedIn;

  @computed
  bool get isEmailValid =>
      RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(_email);

  @computed
  bool get isPasswordValid => _password.length > 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

  @computed
  get loginPressed => (isFormValid && !loading) ? login : (){};

}
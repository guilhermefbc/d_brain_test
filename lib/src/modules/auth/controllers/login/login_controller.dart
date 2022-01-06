
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  // final FirebaseAuthController _firebaseAuthController = FirebaseAuthController();

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

  @action
  togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  setEmail(String email) => _email = email;

  @action
  setPassword(String password) => _password = password;

  @action
  login() async {
    try{
      loading = true;
      // await _firebaseAuthController.login(_email, _password);
      Modular.to.navigate('/home');
      loading = false;
      _loggedIn = true;
    } catch(_){
      loading = false;
    }
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
  get loginPressed => (isFormValid && !loading) ? login : null;
}
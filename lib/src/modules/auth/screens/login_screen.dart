import 'package:d_brain_test/src/modules/auth/controllers/login/login_controller.dart';
import 'package:d_brain_test/src/shared/widgets/buttons/simple_custom_button.dart';
import 'package:d_brain_test/src/shared/widgets/buttons/simple_icon_button.dart';
import 'package:d_brain_test/src/shared/widgets/text_fields/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0039A5), Colors.white]
            ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "DBrain",
                style: TextStyle(
                  fontSize: 54.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300
                ),
              ),
              const SizedBox(height: 50,),
              Observer(
                  builder: (_) {
                    return LoginTextField(
                      hint: "E-mail",
                      prefix: const Icon(Icons.account_circle),
                      textInputType: TextInputType.emailAddress,
                      onChanged: _loginController.setEmail,
                      enabled: !_loginController.loading,
                      errorText: _loginController.emailError,
                    );
                  }
              ),
              const SizedBox(height: 10.0,),
              Observer(
                  builder: (_) {
                    return LoginTextField(
                      hint: "Password",
                      prefix: const Icon(Icons.lock),
                      obscure: _loginController.passwordVisible,
                      textInputType: TextInputType.visiblePassword,
                      onChanged: _loginController.setPassword,
                      enabled: !_loginController.loading,
                      errorText: _loginController.passwordError,
                      suffix: SimpleIconButton(
                          icon1: const Icon(Icons.visibility),
                          icon2: const Icon(Icons.visibility_off),
                          selectIcon1: _loginController.passwordVisible,
                          function: _loginController.togglePasswordVisibility
                      ),
                    );
                  }
              ),
              const SizedBox(height: 16,),
              Observer(
                  builder: (_) {
                    return SizedBox(
                      height: 44,
                      child: SimpleCustomButton(
                        child: _loginController.loading
                              ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)
                              : const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                        onTap: _loginController.login,
                        color: const Color(0xFF125EED),
                      ),
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}

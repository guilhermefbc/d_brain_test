import 'package:d_brain_test/src/shared/repositories/authLogin/auth_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ReactionDisposer _disposer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _disposer = autorun((_) {
      final auth = Modular.get<AuthLoginController>();

      if(auth.status == AuthStatus.login) {
        Modular.to.pushReplacementNamed('/home/');
      }else if(auth.status == AuthStatus.logoff){
        Modular.to.pushReplacementNamed('/login');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0039A5), Colors.white]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator()
        ],
      ),
    );
  }
}


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:d_brain_test/src/modules/home/controllers/home/home_controller.dart';
import 'package:d_brain_test/src/shared/repositories/authLogin/auth_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final HomeController _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arquivos"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => _homeController.logOut(),
              icon: const Icon(Icons.exit_to_app)
          )
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.cloud_upload),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 60.0,
        items: <Widget>[
          const Icon(Icons.home, size: 30),
          const Icon(Icons.list, size: 30),
          Container(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle
              ),
              child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Icon(Icons.photo_camera, size: 40)
              )
          ),
          const Icon(Icons.call_split, size: 30),
          const Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: Colors.white,
        // animationCurve: Curves.easeInCirc,
        // animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            print(index);
            _page = index;
          });
        },
        letIndexChange: (index) => index != 2,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, Colors.white]
          ),
        ),
      ),
    );
  }
}

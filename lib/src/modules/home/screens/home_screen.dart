import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:d_brain_test/src/modules/home/controllers/home/home_controller.dart';
import 'package:d_brain_test/src/shared/backgroundOperations/my_backgroundFetch_config.dart';
import 'package:d_brain_test/src/shared/notifications/main_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final HomeController _homeController = Modular.get<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeController.navigateBetweenScreens(0);
    MyBackgroundFetchConfig.initBackgroundFetch(mounted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Documents", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),),
        centerTitle: true,
        backgroundColor: const Color(0xFF0039A5),
        actions: [
          IconButton(
              onPressed: () => _homeController.logOut(),
              icon: const Icon(Icons.exit_to_app)
          )
        ],
        leading: Observer(
          builder: (context) => Switch(
            value: _homeController.withNotification,
            onChanged: (bool value) {
              _homeController.withNotification = value;
              _homeController.enableBackgroundNotification();
            },
            activeColor: Colors.white,
          ),
        )
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          const Icon(Icons.home, size: 30),
          const Icon(Icons.list, size: 30),
          Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0039A5),
                shape: BoxShape.circle
              ),
              child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: const Icon(Icons.photo_camera, size: 40)
              )
          ),
          const Icon(Icons.call_split, size: 30),
          const Icon(Icons.perm_identity, size: 30),
        ],
        color: const Color(0xFF0039A5),
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        onTap: (index) {
            print(index);
        },
        letIndexChange: (index) {
          _homeController.navigateBetweenScreens(index);
          return true;
        },
      ),
      body: RouterOutlet(),
    );
  }
}

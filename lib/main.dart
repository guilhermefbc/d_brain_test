import 'package:background_fetch/background_fetch.dart';
import 'package:d_brain_test/src/app_module.dart';
import 'package:d_brain_test/src/app_widget.dart';
import 'package:d_brain_test/src/shared/backgroundOperations/my_backgroundFetch_config.dart';
import 'package:d_brain_test/src/shared/notifications/main_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';



void main() async {
  // Firebase core initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Notifications initialization
  await MainNotifications.initNotifications();

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));

  // BackgroundFetch config
  BackgroundFetch.registerHeadlessTask(MyBackgroundFetchConfig.backgroundFetchHeadlessTask);
}






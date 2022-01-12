import 'package:background_fetch/background_fetch.dart';
import 'package:d_brain_test/src/shared/notifications/main_notifications.dart';

class MyBackgroundFetchConfig {

  static void backgroundFetchHeadlessTask(HeadlessTask task) async {
    var taskId = task.taskId;
    var timeout = task.timeout;
    if (timeout) {
      print("[BackgroundFetch] Headless task timed-out: $taskId");
      BackgroundFetch.finish(taskId);
      return;
    }

    print("[BackgroundFetch] Headless event received: $taskId");
    BackgroundFetch.finish(taskId);

    // var timestamp = DateTime.now();
    //
    // var prefs = await SharedPreferences.getInstance();

    // Read fetch_events from SharedPreferences
    // var events = <String>[];
    // var json = prefs.getString(EVENTS_KEY);
    // if (json != null) {
    //   events = jsonDecode(json).cast<String>();
    // }
    // // Add new event.
    // events.insert(0, "$taskId@$timestamp [Headless]");
    // // Persist fetch events in SharedPreferences
    // prefs.setString(EVENTS_KEY, jsonEncode(events));

    // if (taskId == 'flutter_background_fetch') {
      /* DISABLED:  uncomment to fire a scheduleTask in headlessTask.
    BackgroundFetch.scheduleTask(TaskConfig(
        taskId: "com.transistorsoft.customtask",
        delay: 5000,
        periodic: false,
        forceAlarmManager: false,
        stopOnTerminate: false,
        enableHeadless: true
    ));
     */
    // }
  }

  static void initBackgroundFetch(bool mounted) async {

    // Configure BackgroundFetch.
    try{
      int status = await BackgroundFetch.configure(BackgroundFetchConfig(
        minimumFetchInterval: 15,
        forceAlarmManager: false,
        stopOnTerminate: false,
        startOnBoot: true,
        enableHeadless: true,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: NetworkType.NONE,
      ), _onBackgroundFetch, _onBackgroundFetchTimeout);
      print('[BackgroundFetch] configure success: $status');


      // Schedule a "one-shot" custom-task in 10000ms.
      // These are fairly reliable on Android (particularly with forceAlarmManager) but not iOS,
      // where device must be powered (and delay will be throttled by the OS).
      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "com.transistorsoft.customtask",
          delay: 10000,
          periodic: false,
          forceAlarmManager: true,
          stopOnTerminate: false,
          enableHeadless: true
      ));
    } on Exception catch(e) {
      print("[BackgroundFetch] configure ERROR: $e");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  static void _onBackgroundFetch(String taskId) async {
    print("BackgroundFetch on: " + DateTime.now().toString());

    MainNotifications.showNotification();

    // IMPORTANT:  You must signal completion of your fetch task or the OS can punish your app
    // for taking too long in the background.
    BackgroundFetch.finish(taskId);
  }

  static void _onBackgroundFetchTimeout(String taskId) {
    print("[BackgroundFetch] TIMEOUT: $taskId");
    BackgroundFetch.finish(taskId);
  }
}
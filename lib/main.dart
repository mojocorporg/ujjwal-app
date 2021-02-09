import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';


import 'helper/routes.dart';
import 'helper/shared_prefs.dart';
import 'helper/strings.dart';
import 'locale/LocalizationService.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
BehaviorSubject<String>();

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

int notiId = 0;


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  UserPreferences().init();

  runApp(
    GetMaterialApp(
      title: Strings.app_name,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      getPages: Routes.route,
      initialRoute: '/splash',
      textDirection: TextDirection.ltr,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      theme: ThemeData(
        primaryColor: Color(0xFF373A4C),
        primaryColorDark: Color(0xFF444966),
        primaryColorLight: Colors.pink[300],
        accentColor: Colors.pinkAccent,
        backgroundColor: Color(0xFF214151),
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black45,
        primaryColorDark: Colors.black87,
      ),
      themeMode: ThemeMode.light,
    ),
  );
}




void configureFirebase(){
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      renderNotificationType(message);
    },
    onBackgroundMessage: myBackgroundMessageHandler,
    onLaunch: (Map<String, dynamic> message) async {
      print("firebase onLaunch: $message");
    },
    onResume: (Map<String, dynamic> message) async {
      print("firebase onResume: $message");
    },
  );
  _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(
          sound: true, badge: true, alert: true, provisional: true));
  _firebaseMessaging.onIosSettingsRegistered
      .listen((IosNotificationSettings settings) {
    print("Settings registered: $settings");
  });
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    renderNotificationType(message);
  }
  if (message.containsKey('notification')) {
    final dynamic notification = message['notification'];
  }
}

void renderNotificationType(Map<String, dynamic> message){
  final dynamic data = message['data'];
  print('notidata : $data');
  String section = data['section'];
  String image = data['image'];

  notiId++;

  if(image!=null){
    _showBigPictureNotificationHiddenLargeIcon(message);
  }else{
    _showNotification(message);
  }
}

Future<void> _showNotification(Map<String, dynamic> message) async {

  final dynamic data = message['data'];

  String title = data['title'];
  String body = data['body'];
  String image = data['image'];
  String url = data['url'];
  String section = data['section'];
  String id = data['id'];


  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
      '101', 'Guilt & Happiness', 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker');
  const NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      notiId, title, body, platformChannelSpecifics,
      payload: jsonEncode(message));
}

Future<void> _showBigPictureNotificationHiddenLargeIcon(Map<String, dynamic> message) async {
  final dynamic data = message['data'];

  String title = data['title'];
  String body = data['body'];
  String image = data['image'];
  String url = data['url'];
  String section = data['section'];
  String id = data['id'];


  final String largeIconPath = await _downloadAndSaveFile(
      image, 'largeIcon');
  final String bigPicturePath = await _downloadAndSaveFile(
      image, 'bigPicture');
  final BigPictureStyleInformation bigPictureStyleInformation =
  BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
      hideExpandedLargeIcon: true,
      contentTitle: title,
      htmlFormatContentTitle: true,
      summaryText: body,
      htmlFormatSummaryText: true);
  final AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails('102',
      'gnh-image', 'big text channel description',
      largeIcon: FilePathAndroidBitmap(largeIconPath),
      styleInformation: bigPictureStyleInformation);
  final NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      notiId, title, body, platformChannelSpecifics,
      payload: jsonEncode(message));
}

Future<String> _downloadAndSaveFile(String url, String fileName) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/$fileName';
  final http.Response response = await http.get(url);
  final File file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}


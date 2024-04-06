import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  debugPrint('Handling a background message ${message.messageId}');
  if (message.notification == null) {
    if (_flutterLocalNotificationsPlugin == null) {
      _setUpLocalNotification();
    }
    _showNotificationWithCustomSound(message: message);
  }
}

void setUpFirebase() async {
  await Firebase.initializeApp();
  // await Permission.notification.isDenied.then((value) {
  //   if (value) {
  //     Permission.notification.request();
  //   }
  // });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (_flutterLocalNotificationsPlugin == null) {
    _setUpLocalNotification();
  }
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: false,
    badge: false,
    sound: false,
  );
  _firebaseCloudMessagingListeners();
}

_firebaseCloudMessagingListeners() async {
  await FirebaseMessaging.instance
      .requestPermission(sound: true, badge: true, alert: true);
  FirebaseMessaging.instance.getToken().then((token) {
    if (token != null) {
     // Themes.saveFirebaseToken(token);
    }
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('on message ${message.notification}');
    // _showLocalNotification(message:message);
    _showNotificationWithCustomSound(message: message);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
    print('${message.notification?.title}');
    if (message.notification != null) {
      navigateToNotificationPage(message.data);
    }
  });
  FirebaseMessaging.instance.getInitialMessage().then((message) {
    print('Tapped on notification on terminated state $message');
    if (message != null) {
      print('${message.notification?.title}');
      if (message.notification != null) {
        navigateToNotificationPage(message.data);
      }
    }
  });
}

_setUpLocalNotification() async {
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  var details =
      await _flutterLocalNotificationsPlugin!.getNotificationAppLaunchDetails();
  if (details!.didNotificationLaunchApp) {
    print(
        'Clicked when terminated, details: ${details.notificationResponse?.payload}');
    navigateToNotificationPage(details.notificationResponse?.payload ?? '{}');
  } else {
    print('No notification launch app  $details');
  }
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('mipmap/ic_launcher');
  DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
          onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin);

  // _flutterLocalNotificationsPlugin!.initialize(initializationSettings,
  //     onSelectNotification: _onSelectNotification);
  _flutterLocalNotificationsPlugin!.initialize(
    initializationSettings,
    onDidReceiveBackgroundNotificationResponse:
        onDidReceiveBackgroundNotificationResponse,
    onDidReceiveNotificationResponse: (details) async {
      print('onDidReceiveNotificationResponse: ${details.payload}');
      navigateToNotificationPage(details.payload ?? '{}');
    },
  );
}

void onDidReceiveBackgroundNotificationResponse(
    NotificationResponse details) async {
  print('onDidReceiveBackgroundNotificationResponse');
  final payload = details.payload;
  if (payload != null) {
    print('Notification payload: $payload');
    navigateToNotificationPage(payload);
  }
}

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async {
  print("*****onSelectNotification*****");
  if (payload != null) {
    print("*****Payload*****$payload");
    navigateToNotificationPage(json.decode(payload));
  }
}

Future<void> _showNotificationWithCustomSound(
    {required RemoteMessage message}) async {
  // RemoteNotification? notification = message.notification;
  // AndroidNotification? android = message.notification?.android;
  HapticFeedback.vibrate();
  AndroidNotificationChannel androidNotificationChannel =
      AndroidNotificationChannel(
          UniqueKey().toString(), 'High Importance Notifications', // title
          importance: Importance.high,
          playSound: true);
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          androidNotificationChannel.id, androidNotificationChannel.name,
          playSound: true,
          enableVibration: true,
          priority: Priority.high,
          importance: Importance.max,
          sound: const RawResourceAndroidNotificationSound('alert'));
  DarwinNotificationDetails darwinNotificationDetails =
      const DarwinNotificationDetails(sound: 'alert.aiff');
  String title = '';
  String body = '';
  if (message.data.containsKey('title') && message.data.containsKey('body')) {
    title = message.data['title'];
    body = message.data['body'];
  } else {
    title = message.notification?.title ?? '';
    body = message.notification?.body ?? '';
  }
  int messageId = 1;
  _flutterLocalNotificationsPlugin!.show(
      messageId,
      title,
      body,
      NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: darwinNotificationDetails),
      payload: json.encode(message.data));
}

void navigateToNotificationPage(dynamic message) {
  if (message.data['identifier'] == "NEW_ORDER" &&
      message.data['order_id'] != "") {
    log('yess');
  //   Themes.navigatorKey.currentState?.push(MaterialPageRoute(
  //       builder: (context) => OrderDetails(
  //             orderId: message.data['order_id'],
  //             fromNotification: true,
  //           )));
  // } else if (message.data.containsKey('order_id') &&
  //     message.data['identifier'] == "NEW_ORDER_SALES" &&
  //     message.data['order_id'] != "") {
  //   Themes.navigatorKey.currentState?.push(MaterialPageRoute(
  //       builder: (context) => OrderDetails(
  //             orderId: message.data['order_id'],
  //             fromNotification: true,
  //           )));
  // } else if (message.data['identifier'] == "STOCK_UPDATION") {
  //   Themes.navigatorKey.currentState?.push(MaterialPageRoute(
  //       builder: (context) => ProductDetailScreen(
  //             itemcode: message.data['item_code'],
  //             fromNotification: true,
  //           )));
  // } else if (message.data['identifier'] == 'WALLET_UPDATES') {
  //   Themes.navigatorKey.currentState?.push(MaterialPageRoute(
  //       builder: (context) => const WalletScreen(
  //             fromNotification: true,
  //           )));
  // } else if (message.data['identifier'] == 'MODIFY_QUANTITY') {
  //   Themes.navigatorKey.currentState?.push(MaterialPageRoute(
  //       builder: (context) => OrderDetails(
  //             orderId: message.data['order_id'],
  //             fromNotification: true,
  //           )));
  // } else if (message.data['identifier'] == 'ORDER_STATUS_UPDATE') {
  //   Themes.navigatorKey.currentState?.push(MaterialPageRoute(
  //       builder: (context) => OrderDetails(
  //             orderId: message.data['order_id'],
  //             fromNotification: true,
  //           )));
  } else {
    log("onMessageInApp: $message.data");
  }
}

/*


final StreamController<String?> selectNotificationStream =
StreamController<String?>.broadcast();

class NotificationHelper {

  static Future<void> initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse: (details) async {
      log('open1');
          var response = json.decode(details.payload!);
          log("onMessageApp123: ${details.payload}");
      log("onMessageApp123: $response");
      log("onMessageApp123: ${response['identifier']}");

          if (
              response['identifier'] == "NEW_ORDER" &&
              response['order_id'] != "") {
            log('yess');
            Themes.navigatorKey.currentState?.push(MaterialPageRoute(
                builder: (context) =>OrderDetails(orderId: response['order_id'],fromNotification: true,)));
          }
          else if (response.containsKey('order_id') &&
              response['identifier'] == "NEW_ORDER_SALES" &&
              response['order_id'] != "") {
            Themes.navigatorKey.currentState?.push(MaterialPageRoute(
                builder: (context) =>OrderDetails(orderId: response['order_id'],fromNotification: true,)));
          }
          else if(response['identifier'] == "STOCK_UPDATION"){
            Themes.navigatorKey.currentState?.push(MaterialPageRoute(
                builder: (context) =>ProductDetailScreen(itemcode:response['item_code'] ,fromNotification: true,)));
          }
          else if(response['identifier']=='WALLET_UPDATES'){
            Themes.navigatorKey.currentState?.push(MaterialPageRoute(
                builder: (context) =>const WalletScreen(fromNotification: true,)));
          }
          else if(response['identifier']=='MODIFY_QUANTITY'){
            Themes.navigatorKey.currentState?.push(MaterialPageRoute(
                builder: (context) =>OrderDetails(orderId: response['order_id'],fromNotification: true,)));
          }
          else if(response['identifier']=='ORDER_STATUS_UPDATE'){
            Themes.navigatorKey.currentState?.push(MaterialPageRoute(
                builder: (context) =>OrderDetails(orderId: response['order_id'],fromNotification: true,)));
          }
          else {
            log("onMessageInApp: $response");

          }
    });


    // void _configureSelectNotificationSubject() {
    //   selectNotificationStream.stream.listen((String? payload) async  {
    //     log('open1');
    //     var response = json.decode(payload!);
    //     log("onMessageApp123: $payload");
    //     log("onMessageApp123: $response");
    //     log("onMessageApp123: ${response['identifier']}");
    //
    //     if (
    //     response['identifier'] == "NEW_ORDER" &&
    //         response['order_id'] != "") {
    //       log('yess');
    //       Themes.navigatorKey.currentState?.push(MaterialPageRoute(
    //           builder: (context) =>OrderDetails(orderId: response['order_id'],fromNotification: true,)));
    //     }
    //     else if (response.containsKey('order_id') &&
    //         response['identifier'] == "NEW_ORDER_SALES" &&
    //         response['order_id'] != "") {
    //       Themes.navigatorKey.currentState?.push(MaterialPageRoute(
    //           builder: (context) =>OrderDetails(orderId: response['order_id'],fromNotification: true,)));
    //     }
    //     else if(response['identifier'] == "STOCK_UPDATION"){
    //       Themes.navigatorKey.currentState?.push(MaterialPageRoute(
    //           builder: (context) =>ProductDetailScreen(itemcode:response['item_code'] ,fromNotification: true,)));
    //     }
    //     else if(response['identifier']=='WALLET_UPDATES'){
    //       Themes.navigatorKey.currentState?.push(MaterialPageRoute(
    //           builder: (context) =>const WalletScreen(fromNotification: true,)));
    //     }
    //     else if(response['identifier']=='MODIFY_QUANTITY'){
    //       Themes.navigatorKey.currentState?.push(MaterialPageRoute(
    //           builder: (context) =>OrderDetails(orderId: response['order_id'],fromNotification: true,)));
    //     }
    //     else if(response['identifier']=='ORDER_STATUS_UPDATE'){
    //       Themes.navigatorKey.currentState?.push(MaterialPageRoute(
    //           builder: (context) =>OrderDetails(orderId: response['order_id'],fromNotification: true,)));
    //     }
    //     else {
    //       log("onMessageInApp: $response");
    //
    //     }
    //   });
    // }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        log("onMessage: ${message.data}");
      NotificationHelper.showTextNotification(
          message, flutterLocalNotificationsPlugin);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('open2');
        log("onMessageApp: ${message.data}");
        if (message.data.containsKey('order_id') &&
            message.data['identifier'] == "NEW_ORDER" &&
            message.data['order_id'] != "") {
          Themes.navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (context) =>OrderDetails(orderId: message.data['order_id'],fromNotification: true,)));
        }
      else if (message.data.containsKey('order_id') &&
          message.data['identifier'] == "NEW_ORDER_SALES" &&
          message.data['order_id'] != "") {
        Themes.navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) =>OrderDetails(orderId: message.data['order_id'],fromNotification: true,)));
      }
      else if(message.data['identifier'] == "STOCK_UPDATION"){
        Themes.navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) =>ProductDetailScreen(itemcode:message.data['item_code'] ,fromNotification: true,)));
      }
      else if(message.data['identifier']=='WALLET_UPDATES'){
        Themes.navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) =>const WalletScreen(fromNotification: true,)));
      }
        else if(message.data['identifier']=='MODIFY_QUANTITY'){
          Themes.navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (context) =>OrderDetails(orderId: message.data['order_id'],fromNotification: true,)));
        }
        else if(message.data['identifier']=='ORDER_STATUS_UPDATE'){
          Themes.navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (context) =>OrderDetails(orderId: message.data['order_id'],fromNotification: true,)));
        }
      else {
        log("onMessageInApp: ${message.data}");

      }
    });
  }

//   static Future<void> showTextNotification(
//       RemoteMessage message, FlutterLocalNotificationsPlugin fln) async {
//     String? title = message.notification?.title;
//     String? body = message.notification?.body;
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       channelDescription: 'your channel description',
//       ticker: 'ticker',
//       sound: RawResourceAndroidNotificationSound('notification'),
//       enableLights: true,
//       enableVibration: true,
//       priority: Priority.high,
//       importance: Importance.max,
//       styleInformation: MediaStyleInformation(
//         htmlFormatContent: true,
//         htmlFormatTitle: true,
//       ),
//       playSound: true,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     log('llo${message.data['order_id']}');
//     await fln.show(int.parse(message.data['order_id']), message.notification?.title ?? "",
//         message.notification?.body ?? "", platformChannelSpecifics,
//         payload: jsonEncode(message.data));
//   }
//
//   static Future<void>? _navigateToDetailPage(Map<String, dynamic> message) {
//     return null;
//   }
//
// }
//
// Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
//   print('iOSbackground: ${message.data}}');
//   var androidInitialize =  AndroidInitializationSettings('@mipmap/ic_launcher');
//   var iOSInitialize =  DarwinInitializationSettings();
//   var initializationsSettings = InitializationSettings(
//       android: androidInitialize, iOS: iOSInitialize);
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   flutterLocalNotificationsPlugin.initialize(initializationsSettings);
//   // NotificationHelper.showTextNotification(
//   //     message.data, flutterLocalNotificationsPlugin);
// }

*/

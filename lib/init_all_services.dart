import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app/data/network.dart';
import 'app/models/user_model.dart';
import 'app/modules/authentication/controllers/auth_controller.dart';
import 'app/modules/webview/custom_webview.dart';
import 'app/services/api_services/api_services.dart';
import 'app/services/storage_services/storage_services.dart';
import 'app/services/translation/translation_service.dart';

Future<void> initAllServices() async {
  Get.put(NetworkController(), permanent: true);
  Get.put(StorageService(), permanent: true);
  Get.put(TranslationService(), permanent: true);
  Get.put(ApiServices(), permanent: true);
  // Get.put(DailyBurbleController(), permanent: true);
  // Get.put(ProfileController(), permanent: true);
  // Get.put(SubscribeController(), permanent: true);
  // Get.put(ChatBotController(), permanent: true);
}

Future<void> init() async {
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
      announcement: true,
      carPlay: true,
      criticalAlert: true);
  await FirebaseMessaging.instance.requestPermission();

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  await Permission.notification.request();

  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  await FirebaseMessaging.instance.subscribeToTopic('allriders');
  await FirebaseMessaging.instance.subscribeToTopic('allusers');

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.data.isEmpty == false) {
      Future.delayed(const Duration(seconds: 2));
      // if (message.data['screen'] == '1') {
      //   if (message.data['url'] == 'home') {
      //     final homeController = Get.find<HomeController>();
      //     homeController.selectedBottomBarIndex.value = 0;
      //     homeController.update();
      //     Get.offAll(() => const HomeView());
      //   } else if (message.data['url'] == 'dailyburbles') {
      //     final homeController = Get.find<HomeController>();
      //     homeController.selectedBottomBarIndex.value = 0;
      //     homeController.update();
      //     Get.offAll(() => const HomeView());
      //     Future.delayed(const Duration(microseconds: 1000));
      //     Get.to(() => const DailyBurbleView());
      //   } else if (message.data['url'] == 'myaccount') {
      //     Get.to(() => const MyAccountView());
      //   }
      // } else {
      //   Get.to(() => Custome_Webview(
      //         url: message.data['url'],
      //         paymentURL: false,
      //       ));
      // }
    }
  });

  if (Platform.isAndroid == true) {
    RemoteNotification? notification;
    AndroidNotification? android;
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      const InitializationSettings initializationSettings =
          InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      );
      final FlutterLocalNotificationsPlugin notificationsPlugin =
          FlutterLocalNotificationsPlugin();
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        notification = message.notification;
        android = message.notification?.android;
        const AndroidNotificationDetails androidPlatformChannelSpecifics =
            AndroidNotificationDetails(
          'pushnotificationapp',
          'pushnotificationapp',
          icon: "@mipmap/ic_stat_white_logo_fevi_removebg_preview",
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          channelShowBadge: true,
          onlyAlertOnce: true,
          color: Color(0xfffff0f0f0),
        );

        if (notification != null && android != null) {
          notificationsPlugin.show(
              notification.hashCode,
              message.notification!.title,
              message.notification!.body,
              const NotificationDetails(
                  android: androidPlatformChannelSpecifics,
                  iOS: DarwinNotificationDetails(
                      presentAlert: true,
                      presentBadge: true,
                      presentSound: true,
                      presentBanner: true)));

          notificationsPlugin.initialize(initializationSettings,
              onDidReceiveNotificationResponse: (data) async {
            if (message.data.isEmpty == false) {
              // if (message.data['screen'] == '1') {
              //   if (message.data['url'] == 'home') {
              //     final homeController = Get.find<HomeController>();
              //     homeController.selectedBottomBarIndex.value = 0;
              //     homeController.update();
              //     Get.offAll(() => const HomeView());
              //   }
              //   else if (message.data['url'] == 'dailyburbles') {
              //     final homeController = Get.find<HomeController>();
              //     homeController.selectedBottomBarIndex.value = 0;
              //     homeController.update();
              //     Get.offAll(() => const HomeView());
              //     Future.delayed(const Duration(microseconds: 1000));
              //     Get.to(() => const DailyBurbleView());
              //   } else if (message.data['url'] == 'myaccount') {
              //     Get.to(() => const MyAccountView());
              //   }
              // } else {
              //   Get.to(() => Custome_Webview(
              //         url: message.data['url'],
              //         paymentURL: false,
              //       ));
              // }
            }
          });
        }
      });
    });
  }

  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null && message.data.isNotEmpty) {
      Future.delayed(const Duration(seconds: 2));

      // if (message.data['screen'] == '1') {
      //   if (message.data['url'] == 'home') {
      //     final homeController = Get.find<HomeController>();
      //     homeController.selectedBottomBarIndex.value = 0;
      //     homeController.update();
      //     Get.offAll(() => const HomeView());
      //   } else if (message.data['url'] == 'dailyburbles') {
      //     final homeController = Get.find<HomeController>();
      //     homeController.selectedBottomBarIndex.value = 0;
      //     homeController.update();
      //     // Get.offAll(() => const HomeView());
      //     Future.delayed(const Duration(microseconds: 1000));
      //     // Get.to(() => const DailyBurbleView());
      //   } else if (message.data['url'] == 'myaccount') {
      //     // Get.to(() => const MyAccountView());
      //   }
      // } else {
      //   Get.to(() => Custome_Webview(
      //         url: message.data['url'],
      //         paymentURL: false,
      //       ));
      // }
    }
  });
  await FirebaseMessaging.instance.getToken();
}

Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

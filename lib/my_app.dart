import 'dart:async';
import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/modules/authentication/controllers/auth_controller.dart';

import 'app/data/app_colors.dart';
// import 'app/modules/subscribe/controllers/subscribe_controller.dart';
// import 'app/modules/subscribe/views/new_pay_wall_screen.dart';
import 'app/data/utils.dart';
import 'app/routes/app_pages.dart';
import 'app/services/deeplink/deep_link_service.dart';
import 'app/services/translation/app_translation.dart';
import 'app/services/translation/translation_service.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;
  final translationService = Get.find<TranslationService>();
  final _deepLinkService = DeepLinkService();
  @override
  void initState() {
    if (Platform.isAndroid) {
      final appLinks = AppLinks();

      appLinks.uriLinkStream.listen((uri) {
        _handleNavigation(uri);
      });
    } else if (Platform.isIOS) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) async {
          await _deepLinkService.initDeepLink();

          _deepLinkService.deepLinkStream.listen(
            (event) {
              _handleNavigation(Uri.parse(event));
            },
          );
        },
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _envConfig.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: AppTranslation(),
      locale: Locale(translationService.langCode.value),
      fallbackLocale: const Locale('en_US'),
      builder: (context, child) {
        initResponsiveValues(context);
        return EasyLoading.init()(context, child);
      },
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.appBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appBackgroundColor,
        ),
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            color: AppColors.headingColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        dialogTheme: const DialogThemeData().copyWith(
          backgroundColor: AppColors.appBackgroundColor,
        ),
        fontFamily: 'Comfortaa',
        splashColor: AppColors.appBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  _handleNavigation(Uri uri) {
    Timer(const Duration(seconds: 1), () async {
      if (uri.toString().contains('subscription')) {
        final authController = Get.put(AuthController());
        // Get.put(SubscribeController());
        bool isAutologin = await authController.checkAutoLogin();
        Future.delayed(const Duration(seconds: 1), () {
          // Get.to(() => SubscribeView1(
          //       isNotLooged: !isAutologin,
          //     ));
        });

        // if (authController.userData.value.userData!.email!.isEmpty) {
        //   Get.to(() => const SubscribeView1());
        // } else {
        //   if (authController.userData.value.userData!.membershipActive ==
        //       false) {
        //     Get.to(() => const SubscribeView1());
        //   }
        // }
      } else if (uri.toString().contains('token=')) {
        final authController = Get.put(AuthController());
      }
    });
  }
}

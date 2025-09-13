import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/my_app.dart';
import 'app/data/global_constant.dart';
import 'firebase_options.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';
import 'init_all_services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  EnvConfig devConfig = EnvConfig(
    appName: GlobalConstant.appNameDev.tr,
    burble_life_url: GlobalConstant.mailUrl,
    beat_brain_url: GlobalConstant.mailUrl,
  );

  BuildConfig.instantiate(
    envType: Environment.development,
    envConfig: devConfig,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initAllServices();
  // init();


  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

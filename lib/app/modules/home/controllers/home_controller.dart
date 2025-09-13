import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../data/global_constant.dart';
import '../../../data/storage_key.dart';
import '../../../data/utils.dart';
import '../../../models/check_subscription_model.dart';
import '../../../models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_services/api_services.dart';
import '../../../services/storage_services/storage_services.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/custome_dialog.dart';
import '../../webview/custom_webview.dart';

class HomeController extends GetxController {





  final RxBool _isPickMeUp =false.obs;

  RxBool get isPickMeUp => _isPickMeUp;


}
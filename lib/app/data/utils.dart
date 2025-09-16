import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_colors.dart';
import 'app_images.dart';

double kHeight = Get.mediaQuery.size.height;
double kWidth = Get.mediaQuery.size.width;
double kShortestSide = Get.mediaQuery.size.shortestSide;

bool kIsSmallestWidth = (Get.mediaQuery.size.shortestSide <= 380 &&
        Get.mediaQuery.size.shortestSide >= 340)
    ? true
    : false;
bool kIsMediumWidth = (Get.mediaQuery.size.shortestSide <= 410 &&
        Get.mediaQuery.size.shortestSide >= 381)
    ? true
    : false;
bool kIsIPad = kShortestSide >= 600;

double kHeightRatio = kHeight / 932; // According to design in iPhone 15 Pro Max
double kWidthRatio = kWidth / 430;

String postCacheKey({required String id}) {
  return "post_$id".toLowerCase();
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$";
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return 'emailIsRequired'.tr;
  } else if (!regex.hasMatch(value)) {
    return 'enterValidEmail'.tr;
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'passwordIsRequired'.tr;
  } else if (value.length < 6) {
    return 'passwordMinLength'.tr;
  } else if (!regex.hasMatch(value)) {
    return 'enterValidPassword'.tr;
  }
  return null;
}

String? validateOtp(String? value) {
  String pattern = r'^\d{6}$';

  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'otpRequired'.tr;
  } else if (value.length < 6) {
    return 'otpLength'.tr;
  }
  return null;
}

String? validateConfirmPassword(String? value, String? value2) {
  String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$';

  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'enterconfimpassword'.tr;
  } else if (value.length < 8) {
    return 'passwordMinLength'.tr;
  } else if (!regex.hasMatch(value)) {
    return 'enterValidPassword'.tr;
  } else if (value != value2) {
    return 'passwordMismatch'.tr;
  }
  return null;
}

String? validatePhone(String? value) {
  String pattern = r'^\+?[0-9\s\-()]*$';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'phonenumber'.tr;
  } else if (!regex.hasMatch(value)) {
    return 'enterValidMobile'.tr;
  }
  return null;
}

void loading({required bool show, String title = "Loading.."}) {
  if (show) {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..maskColor = AppColors.headingColor.withOpacity(.2)

      /// custom style
      ..loadingStyle = EasyLoadingStyle.custom
      ..progressColor = AppColors.headingColor
      ..indicatorColor = AppColors.primaryColor
      ..backgroundColor = AppColors.appLightColor
      ..textColor = AppColors.blackColor

      ///
      ..userInteractions = false
      ..animationStyle = EasyLoadingAnimationStyle.offset
      ..dismissOnTap = kDebugMode;
    EasyLoading.show(
      maskType: EasyLoadingMaskType.custom,
      status: title,
      dismissOnTap: false,
    );
  } else {
    EasyLoading.dismiss();
  }
}

void progressLoading(
    {required bool show, double progress = 0.0, String title = "Progress.."}) {
  assert(
    progress >= 0.0 && progress <= 1.0,
    'progress value should be 0.0 ~ 1.0',
  );

  if (show) {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..maskColor = AppColors.secondaryColor.withOpacity(.2)

      /// custom style
      ..loadingStyle = EasyLoadingStyle.custom
      ..progressColor = AppColors.secondaryColor
      ..indicatorColor = AppColors.secondaryColor
      ..backgroundColor = AppColors.appWhiteColor
      ..textColor = Colors.black

      ///
      ..userInteractions = false
      ..animationStyle = EasyLoadingAnimationStyle.offset
      ..dismissOnTap = kDebugMode;
    EasyLoading.showProgress(
      progress,
      status: title,
      maskType: EasyLoadingMaskType.custom,
    );
  } else {
    EasyLoading.dismiss();
  }
}

Widget errorInfoIcon() {
  return Container(
      height: 16,
      width: 16,
      padding: const EdgeInsets.all(12),
      child: SvgPicture.asset(
        AppImages.errorInfo,
        fit: BoxFit.contain,
        width: 16,
        height: 16,
      ));
}

String generaateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

open_mail_app(String subjectValue, emailValue) {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    query: encodeQueryParameters(
        <String, String>{'subject': subjectValue, 'body': emailValue}),
  );
  launchApplication(emailLaunchUri);
}

launchApplication(Uri url) {
  launchUrl(url, mode: LaunchMode.externalApplication);
}

enum socialMediaType { google, facebook, manuel, apple }

String getTodaysDate() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MM-yyyy').format(now);
  return formattedDate;
}

import '../../flavors/build_config.dart';

class GlobalConstant {
  static const String mailUrl =
      "https://burble.life/index.php?option=com_burble&task=api.";
  static const String appName = "Go burble";
  static const String appNameDev = "Go burble";
  static const String appNameDevSmall = "Go burble";
}

/// ************************[Use for logging]******************************************************
var appLogger = BuildConfig.instance.config.logger;

/// ******************************************************************************

class ApiEndpoints {
  static const String login = "login";
  static const String registration = "registration";
  static const String forgotUsername = "forgotUsername";
  static const String forgotPassword = "forgotPassword";
  static const String resendActivationLink = "resendActivationLink";
  static const String Resetpassword = "Resetpassword";
  static const String thrivePopupStatusUpdate = "thrivePopupStatusUpdate";
  static const String activateAccount = "activateAccount";
  static const String validateEmailLinks = "validateEmailLinks";
}

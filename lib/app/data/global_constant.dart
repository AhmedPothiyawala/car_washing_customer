import '../../flavors/build_config.dart';

class GlobalConstant {
  static const String mailUrl = "https://pickup.introdizajn.com/api/";
  static const String domainUrl = "https://pickup.introdizajn.com/";
  static const String appName = "Go burble";
  static const String appNameDev = "Go burble";
  static const String appNameDevSmall = "Go burble";
}

/// ************************[Use for logging]******************************************************
var appLogger = BuildConfig.instance.config.logger;

/// ******************************************************************************

class ApiEndpoints {
  static const String login = "login";
  static const String registration = "registeration";
  static const String validateOtp = "validateOTP";
  static const String resendOtp = "resendOTP";
  static const String forgotUsername = "forgotUsername";
  static const String forgotPassword = "forgetPassword";
  static const String resendActivationLink = "resendActivationLink";
  static const String Changepassword = "createNewpassword";
  static const String thrivePopupStatusUpdate = "thrivePopupStatusUpdate";
  static const String activateAccount = "activateAccount";
  static const String validateEmailLinks = "validateEmailLinks";
  static const String homeContent = "getHomepageContent";
  static const String upcomingBooking = "upcomingBooking";
}

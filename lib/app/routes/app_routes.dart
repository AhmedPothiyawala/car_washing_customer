part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const CHANGE_PASSWORD = _Paths.CHANGE_PASSWORD;
  static const ACTIVATION_LINK = _Paths.ACTIVATION_LINK;
  static const HOME_VIEW = _Paths.HOME_VIEW;
  static const SPLASH = _Paths.SPLASH;
  static const OTP_VIEW = _Paths.OTP_VIEW;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const CHANGE_PASSWORD = '/change-password';
  static const ACTIVATION_LINK = '/activation-link';
  static const HOME_VIEW = '/home-view';
  static const OTP_VIEW = '/otp-view';
}

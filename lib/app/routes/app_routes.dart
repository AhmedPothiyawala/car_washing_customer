part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const FORGOT_USERNAME = _Paths.FORGOT_USERNAME;
  static const ACTIVATION_LINK = _Paths.ACTIVATION_LINK;
  static const HOME_VIEW = _Paths.HOME_VIEW;
  static const SPLASH = _Paths.SPLASH;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const FORGOT_USERNAME = '/forgot-username';
  static const ACTIVATION_LINK = '/activation-link';
  static const HOME_VIEW = '/home-view';
}

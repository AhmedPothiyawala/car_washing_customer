import 'package:get/get.dart';
import 'package:go_burble_new/app/modules/authentication/bindings/auth_binding.dart';
import 'package:go_burble_new/app/modules/authentication/views/forgot_password/forgot_password_view.dart';
import 'package:go_burble_new/app/modules/authentication/views/login/login_view.dart';
import 'package:go_burble_new/app/modules/authentication/views/register/register_view.dart';
import 'package:go_burble_new/app/modules/authentication/views/splash_view.dart';

import '../modules/authentication/views/change_password_view/change_password_view.dart';
import '../modules/authentication/views/otp_view/otp_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  // static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VIEW,
      page: () => const OtpView(),
      binding: AuthBinding(),
    ),
  ];
}

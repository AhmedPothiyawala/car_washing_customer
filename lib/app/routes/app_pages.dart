import 'package:get/get.dart';
import 'package:go_burble_new/app/modules/authentication/bindings/auth_binding.dart';
import 'package:go_burble_new/app/modules/authentication/views/forgot_password/forgot_password_view.dart';
import 'package:go_burble_new/app/modules/authentication/views/login/login_view.dart';
import 'package:go_burble_new/app/modules/authentication/views/register/register_view.dart';
import 'package:go_burble_new/app/modules/authentication/views/splash_view.dart';
import 'package:go_burble_new/app/modules/bottomnavigationbar/bindings/bottom_nav_bar_binding.dart';
import 'package:go_burble_new/app/modules/bottomnavigationbar/views/bottom_nav_bar_view.dart';

import '../modules/authentication/views/change_password_view/change_password_view.dart';
import '../modules/authentication/views/otp_view/otp_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pickmeup/views/customer_detail_view.dart';
import '../modules/pickmeup/views/driver_detail_view.dart';
import '../modules/pickmeup/views/order_summary_view.dart';
import '../modules/pickmeup/views/pick_me_up_view.dart';
import '../modules/pickmeup/views/select_rider.dart';
import '../modules/pickmeup/views/trip_detail_view.dart';

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
    GetPage(
      name: _Paths.BOTTOM_APP_BAR_VIEW,
      page: () => const BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.HOME_VIEW,
      page: () => const HomeView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.PICK_ME_UP_VIEW,
      page: () =>  PickMeUpView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_RIDER_VIEW,
      page: () => const SelectRiderView(),
    ),
    GetPage(
      name: _Paths.ORDER_SUMMARY_VIEW,
      page: () => const OrderSummaryView(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_DETAIL_VIEW,
      page: () => CustomerDetailView(),
      binding: BottomNavBarBinding(),
    ),

    GetPage(
      name: _Paths.DRIVER_DETAIL_VIEW,
      page: () => DriverDetailView(),
    ),
    GetPage(
      name: _Paths.TRIP_DETAIL_VIEW,
      page: () => TripDetailView(),
    ),
  ];
}

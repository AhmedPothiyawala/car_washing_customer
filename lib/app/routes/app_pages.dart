import 'package:get/get.dart';
import 'package:go_burble_new/app/modules/authentication/bindings/auth_binding.dart';
import 'package:go_burble_new/app/modules/authentication/views/forgot_password/forgot_password_view.dart';
import 'package:go_burble_new/app/modules/authentication/views/login/login_view.dart';
import 'package:go_burble_new/app/modules/authentication/views/register/register_view.dart';
import 'package:go_burble_new/app/modules/authentication/views/splash_view.dart';
import 'package:go_burble_new/app/modules/bottomnavigationbar/bindings/bottom_nav_bar_binding.dart';
import 'package:go_burble_new/app/modules/bottomnavigationbar/views/bottom_nav_bar_view.dart';
import 'package:go_burble_new/app/modules/home/bindings/home_binding.dart';

import '../modules/authentication/views/change_password_view/change_password_view.dart';
import '../modules/authentication/views/location_view/location_view.dart';
import '../modules/authentication/views/otp_view/otp_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/notification_view.dart';
import '../modules/pickmeup/views/cancel_booking_view.dart';
import '../modules/pickmeup/views/customer_detail_view.dart';
import '../modules/pickmeup/views/driver_detail_view.dart';
import '../modules/pickmeup/views/order_summary_view.dart';
import '../modules/pickmeup/views/pick_me_up_view.dart';
import '../modules/pickmeup/views/ride_success_view.dart';
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
        binding: BottomNavBarBinding()),
    GetPage(
      name: _Paths.HOME_VIEW,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PICK_ME_UP_VIEW,
      page: () => PickMeUpView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_RIDER_VIEW,
      page: () => SelectRiderView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_SUMMARY_VIEW,
      page: () => const OrderSummaryView(),
    ),
    GetPage(
        name: _Paths.CUSTOMER_DETAIL_VIEW,
        page: () => CustomerDetailView(),
        binding: HomeBinding()),
    GetPage(
      name: _Paths.DRIVER_DETAIL_VIEW,
      page: () => const DriverDetailView(),
    ),
    GetPage(
        name: _Paths.TRIP_DETAIL_VIEW,
        page: () => TripDetailView(),
        binding: HomeBinding()),
    GetPage(
      name: _Paths.LOCATIN_VIEW,
      page: () => const LocationView(),
    ),
    GetPage(
      name: _Paths.CANCEL_BOOKING_VIEW,
      page: () => const CancelBookingView(),
    ),
    GetPage(
      name: _Paths.RIDE_SUCCESS_VIEW,
      page: () => const RideSuccessView(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_VIEW,
      page: () => NotificationView(),
    ),
  ];
}

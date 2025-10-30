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
  static const BOTTOM_APP_BAR_VIEW = _Paths.BOTTOM_APP_BAR_VIEW;
  static const PICK_ME_UP_VIEW = _Paths.PICK_ME_UP_VIEW;
  static const SELECT_RIDER_VIEW = _Paths.SELECT_RIDER_VIEW;
  static const ORDER_SUMMARY_VIEW = _Paths.ORDER_SUMMARY_VIEW;
  static const CUSTOMER_DETAIL_VIEW = _Paths.CUSTOMER_DETAIL_VIEW;
  static const DRIVER_DETAIL_VIEW = _Paths.DRIVER_DETAIL_VIEW;
  static const TRIP_DETAIL_VIEW = _Paths.TRIP_DETAIL_VIEW;
  static const LOCATIN_VIEW = _Paths.LOCATIN_VIEW;
  static const CANCEL_BOOKING_VIEW = _Paths.CANCEL_BOOKING_VIEW;
  static const RIDE_SUCCESS_VIEW = _Paths.RIDE_SUCCESS_VIEW;
  static const NOTIFICATION_VIEW = _Paths.NOTIFICATION_VIEW;
  static const SEACH_VIEW = _Paths.SEARCH_VIEW;
  static const GET_STARTED_ONE = _Paths.GET_STARTED_ONE;
  static const GET_STARTED_TWO = _Paths.GET_STARTED_TWO;
  static const GET_STARTED_THREE =_Paths.GET_STARTED_THREE;
  static const RIDE_DRIVER_DETAIL = _Paths.RIDE_DRIVER_DETAIL;

  static const MY_PROFILE = _Paths.MY_PROFILE;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const ACCOUNT_CHANGE_PASSWORD = _Paths.ACCOUNT_CHANGE_PASSWORD;
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
  static const BOTTOM_APP_BAR_VIEW = '/bottom-app-bar-view';
  static const PICK_ME_UP_VIEW = '/pick-me-up-view';
  static const SELECT_RIDER_VIEW = '/select-riders-view';
  static const ORDER_SUMMARY_VIEW = '/order-summary-view';
  static const CUSTOMER_DETAIL_VIEW = '/customer-detail-view';
  static const DRIVER_DETAIL_VIEW = "/driver-detail-view";
  static const TRIP_DETAIL_VIEW = "/trip-detail-view";
  static const LOCATIN_VIEW = "/location-view";
  static const CANCEL_BOOKING_VIEW = "/cancel-booking-view";
  static const RIDE_SUCCESS_VIEW = "/ride-success-view";
  static const NOTIFICATION_VIEW = "/notification-view";
  static const SEARCH_VIEW = "/search-view";
  static const GET_STARTED_ONE = "/get-started-one";
  static const GET_STARTED_TWO = "/get-started-two";
  static const GET_STARTED_THREE = "/get-started-three";
  static const RIDE_DRIVER_DETAIL = "/favourite-drive-view";

  static const MY_PROFILE = "/my-profile-view";
  static const EDIT_PROFILE = "/edit-profile-view";
  static const ACCOUNT_CHANGE_PASSWORD = "/change-password-view";

}

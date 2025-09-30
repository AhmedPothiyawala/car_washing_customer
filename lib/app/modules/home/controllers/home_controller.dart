import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_burble_new/app/data/app_images.dart';
import 'package:go_burble_new/app/models/cancel_booking_model.dart';
import 'package:go_burble_new/app/models/confirm_booking_model.dart';
import 'package:go_burble_new/app/models/get_calculated_rate_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/app_colors.dart';
import '../../../data/global_constant.dart';
import '../../../data/storage_key.dart';
import '../../../data/utils.dart';
import '../../../models/booking_detail_model.dart';
import '../../../models/home_model.dart';
import '../../../models/upcoming_booking_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_services/api_services.dart';
import '../../../services/storage_services/storage_services.dart';
import '../../../widgets/custom_snackbar.dart';

class HomeControllers extends GetxController {
  final RxBool _isPickMeUp = false.obs;

  RxBool get isPickMeUp => _isPickMeUp;
  final RxBool _isLoding = false.obs;
  RxBool get isLoding => _isLoding;
  final RxBool _isLoding2 = false.obs;
  RxBool get isLoding2 => _isLoding2;
  final RxString _isselectedDate = "".obs;
  final RxString _isselectedTime = "".obs;
  final Rx<Position?> _currentPosition = Rx<Position?>(null);
  final Rx<Placemark?> _currentAddress = Rx<Placemark?>(null);
  RxString get isselectedDate => _isselectedDate;
  RxString get isselectedTime => _isselectedTime;
  final Rx<HomeModel> _homeData = HomeModel().obs;
  final Rx<UpcomingBookingModel> _bookingData = UpcomingBookingModel().obs;
  final Rx<CancelBookingModel> _cancelbookingData = CancelBookingModel().obs;

  final Rx<ConfirmBookingModel> _confirmBookingData = ConfirmBookingModel().obs;
  final Rx<BookingDetailModel> _bookingDetail = BookingDetailModel().obs;

  final RxInt _isselectedCar = 0.obs;
  final RxInt _groupvalue = 0.obs;
  final RxString _cancelreson = "".obs;
  final Rx<GetCalculatedRateModel> _getCalculatedPriceData =
      GetCalculatedRateModel().obs;
  Rx<Position?> get currentPosition => _currentPosition;
  Rx<Placemark?> get currentAddress => _currentAddress;
  Rx<HomeModel> get homeData => _homeData;
  Rx<UpcomingBookingModel> get bookingData => _bookingData;
  Rx<ConfirmBookingModel> get confirmBookingData => _confirmBookingData;
  Rx<GetCalculatedRateModel> get getCalculatedPriceData =>
      _getCalculatedPriceData;
  Rx<BookingDetailModel> get bookingDetail => _bookingDetail;
  Rx<CancelBookingModel> get cancelbookingData => _cancelbookingData;

  final _pickupLocationController = TextEditingController();
  var pickupFocusNode = FocusNode().obs;
  final _apiService = Get.find<ApiServices>();
  final _storageService = Get.find<StorageService>();
  final RxList<FocusNode> dropfocus = [FocusNode()].obs;
  final RxList<Map<String, double>> _pickup = <Map<String, double>>[].obs;
  final RxList<Map<String, double>> _drop = <Map<String, double>>[].obs;
  final RxList<TextEditingController> _dropController =
      [TextEditingController()].obs;
  TextEditingController get pickupLocationController =>
      _pickupLocationController;
  RxList<Map<String, double>> get pickup => _pickup;
  RxList<Map<String, double>> get drop => _drop;
  RxInt get isselectedCar => _isselectedCar;
  RxInt get groupvalue => _groupvalue;
  RxString get cancelreson => _cancelreson;
  RxList<TextEditingController> get dropController => _dropController;
  final RxSet<Circle> circles = <Circle>{}.obs;
  final RxSet<Marker> markers = <Marker>{}.obs;
  final RxSet<Marker> routeMarkers = <Marker>{}.obs;
  final RxSet<Polyline> routePolylines = <Polyline>{}.obs;
  final RxSet<Circle> circles2 =
      <Circle>{}.obs; // Used for the route map pickup circle

  // GoogleMapController fields
  GoogleMapController? mapController1; // For the current location map
  GoogleMapController? mapController2; // For the route map
  final globalFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final surNameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final remarkController = TextEditingController();

  final companyName = TextEditingController();

  final supplementController = TextEditingController();

  final streetNumberController = TextEditingController();

  final placeController = TextEditingController();

  final addressController = TextEditingController();

  final cantonController = TextEditingController();

  final postalCodeController = TextEditingController();

  final landController = TextEditingController();

  final dispatcherNameController = TextEditingController();

  final dispatcherPhoneController = TextEditingController();

  final orderNumberController = TextEditingController();

  final customerNameController = TextEditingController();

  final customerPhoneController = TextEditingController();
  final double _LATITUDE_UPWARD_SHIFT = 0.005;

  // New methods to be called from GoogleMap's onMapCreated in the views
  void onMapCreated1(GoogleMapController controller) {
    mapController1 = controller;
  }

  void onMapCreated2(GoogleMapController controller) {
    mapController2 = controller;
  }

  // Rx CameraPosition
  final Rx<CameraPosition> currentPositionMap = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  ).obs;

  // Call this when location updates
  Future<void> updateCircle(double lat, double long) async {
    circles.value = {
      Circle(
        circleId: const CircleId("pickup_area"),
        center: LatLng(lat, long),
        radius: 30, // in meters
        fillColor: AppColors.primaryColor.withValues(alpha: 0.15),
        strokeColor: AppColors.primaryColor.withValues(alpha: 0.58),
        strokeWidth: 1,
      ),
    };

    // ⚠️ Updated how BitmapDescriptor is loaded
    final icon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(33, 33)), AppImages.markerIcon);

    markers.value = {
      Marker(
        markerId: const MarkerId("current_location"),
        position: LatLng(lat, long),
        icon: icon,
        infoWindow: const InfoWindow(title: "Your Location"),
      ),
    };
  }

  // home_controllers.dart - Locate and replace your existing updateCamerapost method

  // home_controllers.dart - Locate and replace your existing updateCamerapost method

  Future<void> updateCamerapost(double lat, double long) async {
    if (mapController1 != null) {
      final LatLng center = LatLng(lat, long);

      await mapController1!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 192.8334901395799,
            target: center,
            tilt: 59.440717697143555,
            // Use a simple, stable zoom level
            zoom: 18.5,
          ),
        ),
      );
    }
  }
  Future<void> updateRouteMarkers() async {
    if (_pickup.isEmpty) return;

    final pickup = LatLng(_pickup[0]["lat"]!, _pickup[0]["long"]!);

    // 1. Setup Circle for Pickup (as requested)
    circles2.value = {
      Circle(
        circleId: const CircleId("pickup_area"),
        center: pickup,
        radius: 30, // in meters
        fillColor: AppColors.primaryColor.withValues(alpha: 0.15),
        strokeColor: AppColors.primaryColor.withValues(alpha: 0.58),
        strokeWidth: 1,
      ),
      Circle(
        circleId: const CircleId("pickup_area"),
        center: pickup,
        radius: 15, // in meters
        fillColor: AppColors.primaryColor.withValues(alpha: 0.15),
        strokeColor: AppColors.primaryColor.withValues(alpha: 0.58),
        strokeWidth: 1,
      ),
    };

    // Load the custom car marker icon once (Ensuring vertical orientation is in the PNG asset itself)
    final BitmapDescriptor dropCarIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(33, 33)), // Adjusted size
        AppImages.dropCarImage);
    final BitmapDescriptor pickupIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(10, 10)), // Adjusted size
        AppImages.markerIcon2);
    final Set<Marker> markers = {
      Marker(
        markerId: const MarkerId("pickup"),
        position: pickup,
        icon: pickupIcon,
        infoWindow: InfoWindow(title: pickupLocationController.text),
      ),
    };
    for (int i = 0; i < _drop.length; i++) {
      final drop = LatLng(_drop[i]["lat"]!, _drop[i]["long"]!);

      markers.add(
        Marker(
          markerId: MarkerId("drop_$i"),
          position: drop,
          icon: dropCarIcon,
          infoWindow: InfoWindow(title: dropController[i].text),
          // Set anchor to bottom center to properly align vertical icons
          anchor: const Offset(0.5, 1.0),
        ),
      );
    }

    routeMarkers.value = markers;
  }

  void drawRoutePolyline() {
    if (_pickup.isEmpty) return;

    final List<LatLng> points = [];

    // Add pickup point first
    points.add(LatLng(_pickup[0]["lat"]!, _pickup[0]["long"]!));

    // Add all drop points
    for (final drop in _drop) {
      points.add(LatLng(drop["lat"]!, drop["long"]!));
    }

    routePolylines.value = {
      Polyline(
        polylineId: const PolylineId("route"),
        color: AppColors.primaryColor,
        width: 5,
        points: points,
      ),
    };
  }

  // Inside HomeControllers.dart

// Inside HomeControllers.dart

  Future<void> fitMapToAllPoints() async {
    if (mapController2 == null) return;

    // Check if the pickup location is available
    if (_pickup.isEmpty) {
      return;
    }

    // Get the pickup coordinates
    final LatLng pickupLocation =
        LatLng(_pickup[0]["lat"]!, _pickup[0]["long"]!);

    // Define the specific high-zoom, bearing, and tilt used on the first map page
    const double targetZoom = 18.5;
    const double targetBearing = 192.8334901395799;
    const double targetTilt = 59.440717697143555;

    // Animate the camera directly to the pickup location using the desired settings
    await mapController2!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: pickupLocation, // Center on pickup location
          zoom: targetZoom, // Apply desired high zoom
          bearing: targetBearing,
          tilt: targetTilt,
        ),
      ),
    );
  }

  Future<Position> determinePosition() async {
    Geolocator.requestPermission();
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    // Check if service is disabled or permission is not granted
    if (!serviceEnabled ||
        permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      final result = await Get.toNamed(Routes.LOCATIN_VIEW);
      if (result == true) {
        return await determinePosition();
      } else {
        return Future.error('Location permission not granted');
      }
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    );
  }

  Future<void> getlocation() async {
    _currentPosition(await determinePosition());
    updateCircle(
        _currentPosition.value!.latitude, _currentPosition.value!.longitude);
    List<Placemark> placemarks = await placemarkFromCoordinates(
      _currentPosition.value!.latitude,
      _currentPosition.value!.longitude,
    );

    if (mapController1 != null) {
      updateCircle(
          _currentPosition.value!.latitude, _currentPosition.value!.longitude);

      await mapController1!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(
              _currentPosition.value!.latitude,
              _currentPosition.value!.longitude,
            ),
            tilt: 59.440717697143555,
            zoom: 18.5,
          ),
        ),
      );
    } else {
      print("Map Controller 1 is null. Cannot animate camera.");
    }

    if (placemarks.isNotEmpty) {
      _currentAddress(placemarks[0]);
      print(_currentAddress.value);
    }

    // --- 2. NOTIFICATION PERMISSION CHECK ---
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      appLogger.i('FCM Notification permission granted.');
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      appLogger.w('FCM Notification permission denied by user.');
    } else {
      // AuthorizationStatus.notDetermined
      appLogger.w('FCM Notification permission status undetermined.');
    }
  }

  Future<void> selectdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      _isselectedDate(
          "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}");
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickedTime != null) {
      _isselectedTime("${pickedTime.hour}:${pickedTime.minute}");
    }
  }

  Future<void> homecontent() async {
    _isLoding(true);
    try {
      var data = {
        'user_id': await _storageService.readString(StorageKey.userId)
      };

      final response = await _apiService.post(
          endPoint: ApiEndpoints.homeContent, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;

          if (jsonMap['status'] == true) {
            _homeData.value = HomeModel.fromJson(jsonMap);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message_en']);
          }

          _isLoding(false);
        }
      }
    } on dio.DioException catch (ex) {
      _isLoding(false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } catch (e) {
      _isLoding(false);
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      appLogger.e(e.toString());
    } finally {
      _isLoding(false);
    }
  }

  Future<void> getbookingcalculatedprice(
    String transferType,
  ) async {
    loading(show: true, title: "Sending...");
    try {
      print(transferType);
      print(_isselectedDate.value);
      print(_isselectedTime.value);
      print(_pickup);
      print(_drop);

      var data = _drop.length > 1
          ? {
              'user_id': await _storageService.readString(StorageKey.userId),
              'service': _isPickMeUp.value == true ? "pickmeup" : "pickupmycar",
              'transfer_type': transferType.toString().toLowerCase(),
              'booking_date': _isselectedDate.value,
              'booking_time': _isselectedTime.value,
              'pickup': jsonEncode(_pickup),
              'drops': jsonEncode(_drop)
            }
          : {
              'user_id': await _storageService.readString(StorageKey.userId),
              'service': _isPickMeUp.value == true ? "pickmeup" : "pickupmycar",
              'transfer_type': transferType.toString().toLowerCase(),
              'booking_date': _isselectedDate.value,
              'booking_time': _isselectedTime.value,
              'pickup': jsonEncode(_pickup),
              'drop': jsonEncode(_drop)
            };

      final response = await _apiService.post(
          endPoint: ApiEndpoints.getCalculatedRate, reqData: data);

      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;

          if (jsonMap['success'] == true) {
            _getCalculatedPriceData.value =
                GetCalculatedRateModel.fromJson(jsonMap);
            updateRouteMarkers();
            drawRoutePolyline();
            Get.toNamed(Routes.SELECT_RIDER_VIEW, arguments: {
              'service': _isPickMeUp.value == true ? "pickmeup" : "pickupmycar",
              'transfer_type': transferType.toString().toLowerCase(),
              'booking_date': _isselectedDate.value,
              'booking_time': _isselectedTime.value,
              'pickup': _pickupLocationController,
              'drop': _dropController,
              'pickuplat': _pickup,
              'droplat': _drop
            });
          } else {
            CustomSnackBar.errorSnackBar(
                message: jsonMap['message_en'],
                backgroundColor: AppColors.primaryColor,
                textcolor: AppColors.appBackgroundColor);
          }
        } else {
          CustomSnackBar.errorSnackBar(
              message: "Failed to load data.",
              backgroundColor: AppColors.primaryColor,
              textcolor: AppColors.appBackgroundColor);
        }
        loading(show: false);
        _isLoding(false);
      }
    } on dio.DioException catch (ex) {
      _isLoding(false);
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr,
            backgroundColor: AppColors.primaryColor,
            textcolor: AppColors.appBackgroundColor);
        print(data["errors_de"]);
      } else {
        CustomSnackBar.errorSnackBar(
            message: "somethingWentWrong".tr,
            backgroundColor: AppColors.primaryColor,
            textcolor: AppColors.appBackgroundColor);
      }
    } catch (e) {
      _isLoding(false);
      CustomSnackBar.errorSnackBar(
          message: "somethingWentWrong".tr,
          backgroundColor: AppColors.primaryColor,
          textcolor: AppColors.appBackgroundColor);
      appLogger.e(e.toString());
    } finally {
      loading(show: false);
    }
  }

  Future<void> upcomingbooking() async {
    _isLoding2(true);
    try {
      var data = {
        'user_id': await _storageService.readString(StorageKey.userId)
      };

      final response = await _apiService.post(
          endPoint: ApiEndpoints.upcomingBooking, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;

          if (jsonMap['status'] == true) {
            _bookingData.value = UpcomingBookingModel.fromJson(jsonMap);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message_en']);
          }

          _isLoding2(false);
        }
      }
    } on dio.DioException catch (ex) {
      _isLoding2(false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } catch (e) {
      _isLoding2(false);
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      appLogger.e(e.toString());
    } finally {
      _isLoding2(false);
    }
  }

  Future<void> confirmbooking(
      String service,
      transferType,
      bookingDate,
      bookingTime,
      List<Map<String, double>> pickup,
      List<Map<String, double>> drop,
   ) async {
    loading(show: true, title: "Sending...");
    try {
      var data = drop.length > 1
          ? {
              'user_id': await _storageService.readString(StorageKey.userId),
              'service': service,
              'transfer_type': transferType.toString().toLowerCase(),
              'booking_date': bookingDate,
              'booking_time': bookingTime,
              'pickup': jsonEncode(pickup),
              'drops': jsonEncode(drop),
              'car_class': _getCalculatedPriceData
                  .value.data![_isselectedCar.value].carClassId,
              'total_distance': _getCalculatedPriceData
                  .value.data![_isselectedCar.value].totalDistance,
              'base_rate': _getCalculatedPriceData
                  .value.data![_isselectedCar.value].baseRate,
              'vat_value': _getCalculatedPriceData
                  .value.data![_isselectedCar.value].vatValue,
              'our_fees': _getCalculatedPriceData
                  .value.data![_isselectedCar.value].ourFees,
              'customer_name': nameController.text,
              'customer_surname': surNameController.text,
              'customer_email': emailController.text,
              'customer_phone': phoneController.text,
              'customer_remarks': remarkController.text,
              'billing_address_flag': 1,
              'dispatcher_name': dispatcherNameController.text,
              'customer_name2': customerNameController.text,
              'customer_phone2': customerPhoneController.text,
              'billing_company_name': companyName.text,
              'billing_supplement': supplementController.text,
              'billing_street_no': streetNumberController.text,
              'billing_place': placeController.text,
              'billing_address': addressController.text,
              'billing_canton': cantonController.text,
              'billing_postal_code': postalCodeController.text,
              'billing_land': landController.text,
              'dispatcher_phone': dispatcherPhoneController.text,
              'dispatcher_order_number': orderNumberController.text,
            }
          : {
              'user_id': await _storageService.readString(StorageKey.userId),
              'service': _isPickMeUp.value == true ? "pickmeup" : "pickupmycar",
              'transfer_type': transferType.toString().toLowerCase(),
              'booking_date': bookingDate,
              'booking_time': bookingTime,
              'pickup': jsonEncode(pickup),
              'drop': jsonEncode(drop),
              'car_class': _getCalculatedPriceData
                  .value.data![_isselectedCar.value].carClassId,
              'total_distance': _getCalculatedPriceData
                  .value.data![_isselectedCar.value].totalDistance,
              'base_rate': _getCalculatedPriceData
                  .value.data![_isselectedCar.value].baseRate,
              'vat_value': _getCalculatedPriceData
                  .value.data![_isselectedCar.value].vatValue,
              'our_fees': _getCalculatedPriceData
                  .value.data![_isselectedCar.value].ourFees,
        'customer_name': nameController.text,
        'customer_surname': surNameController.text,
        'customer_email': emailController.text,
        'customer_phone': phoneController.text,
        'customer_remarks': remarkController.text,
        'billing_address_flag': 1,
        'dispatcher_name': dispatcherNameController.text,
        'customer_name2': customerNameController.text,
        'customer_phone2': customerPhoneController.text,
        'billing_company_name': companyName.text,
        'billing_supplement': supplementController.text,
        'billing_street_no': streetNumberController.text,
        'billing_place': placeController.text,
        'billing_address': addressController.text,
        'billing_canton': cantonController.text,
        'billing_postal_code': postalCodeController.text,
        'billing_land': landController.text,
        'dispatcher_phone': dispatcherPhoneController.text,
        'dispatcher_order_number': orderNumberController.text,
            };

      final response = await _apiService.post(
          endPoint: ApiEndpoints.confirmBooking, reqData: data);

      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;

          if (jsonMap['status'] == true) {
            _confirmBookingData.value = ConfirmBookingModel.fromJson(jsonMap);
            CustomSnackBar.errorSnackBar(
                message: jsonMap['message_en'],
                backgroundColor: AppColors.primaryColor,
                textcolor: AppColors.appBackgroundColor);
            bookingdetail(jsonMap['data']['booking_unique_id']);
            Get.toNamed(Routes.TRIP_DETAIL_VIEW);
          } else {
            CustomSnackBar.errorSnackBar(
                message: jsonMap['message_en'],
                backgroundColor: AppColors.primaryColor,
                textcolor: AppColors.appBackgroundColor);
          }
        } else {
          CustomSnackBar.errorSnackBar(
              message: "Failed to load data.",
              backgroundColor: AppColors.primaryColor,
              textcolor: AppColors.appBackgroundColor);
        }
        loading(show: false);
        _isLoding(false);
      }
    } on dio.DioException catch (ex) {
      _isLoding(false);
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr,
            backgroundColor: AppColors.primaryColor,
            textcolor: AppColors.appBackgroundColor);
        print(data["errors_de"]);
      } else {
        CustomSnackBar.errorSnackBar(
            message: "somethingWentWrong".tr,
            backgroundColor: AppColors.primaryColor,
            textcolor: AppColors.appBackgroundColor);
      }
    } catch (e) {
      _isLoding(false);
      CustomSnackBar.errorSnackBar(
          message: "somethingWentWrong".tr,
          backgroundColor: AppColors.primaryColor,
          textcolor: AppColors.appBackgroundColor);
      appLogger.e(e.toString());
    } finally {
      loading(show: false);
    }
  }

  Future<void> bookingdetail(String bookingId) async {
    _isLoding2(true);
    try {
      var data = {
        'user_id': await _storageService.readString(StorageKey.userId),
        'booking_id': bookingId
      };

      final response = await _apiService.post(
          endPoint: ApiEndpoints.bookingDetail, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;

          if (jsonMap['status'] == true) {
            _bookingDetail.value = BookingDetailModel.fromJson(jsonMap);
            final dynamic decoded = jsonDecode(jsonMap['pickup_points']);

            List<Map<String, dynamic>> pickuppoints = [];
            pickuppoints = List<Map<String, dynamic>>.from(decoded);

            for (var point in pickuppoints) {
              double lat = point['lat'];
              double lng = point['long'];

              List<Placemark> placemarks =
                  await placemarkFromCoordinates(lat, lng);

              if (placemarks.isNotEmpty) {
                final p = placemarks.first;
                final address = "${p.name}, ${p.locality}, ${p.country}";
                _pickupLocationController.text = address;
              }
            }

            final dynamic decoded2 = jsonDecode(jsonMap['drop_points']);

            List<Map<String, dynamic>> droppoints = [];
            droppoints = List<Map<String, dynamic>>.from(decoded2);

            for (var point in droppoints) {
              double lat = point['lat'];
              double lng = point['long'];

              List<Placemark> placemarks =
                  await placemarkFromCoordinates(lat, lng);

              if (placemarks.isNotEmpty) {
                final p = placemarks.first;
                final address = "${p.name}, ${p.locality}, ${p.country}";
                _dropController.add(TextEditingController(text: address));
              }
            }
          } else {
            CustomSnackBar.errorSnackBar(
                message: jsonMap['message_en'],
                backgroundColor: AppColors.primaryColor,
                textcolor: AppColors.appBackgroundColor);
          }

          _isLoding2(false);
        }
      }
    } on dio.DioException catch (ex) {
      _isLoding2(false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr,
            backgroundColor: AppColors.primaryColor,
            textcolor: AppColors.appBackgroundColor);
        print(data["errors_de"]);
      } else {
        CustomSnackBar.errorSnackBar(
            message: "somethingWentWrong".tr,
            backgroundColor: AppColors.primaryColor,
            textcolor: AppColors.appBackgroundColor);
      }
    } catch (e) {
      _isLoding2(false);
      CustomSnackBar.errorSnackBar(
          message: "somethingWentWrong".tr,
          backgroundColor: AppColors.primaryColor,
          textcolor: AppColors.appBackgroundColor);
      appLogger.e(e.toString());
    } finally {
      _isLoding2(false);
    }
  }

  Future<void> cancelbooking() async {
    loading(show: true, title: "Cancelling.");

    try {
      var data = {
        'user_id': await _storageService.readString(StorageKey.userId),
        'booking_id': _bookingDetail.value.bookings!.bookingId,
        'cancel_reason': _cancelreson.value.toString().toLowerCase()
      };

      final response = await _apiService.post(
          endPoint: ApiEndpoints.cancelBooking, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;

          if (jsonMap['status'] == true) {
            _cancelbookingData.value = CancelBookingModel.fromJson(jsonMap);
            CustomSnackBar.errorSnackBar(
                message: jsonMap['message_en'],
                backgroundColor: AppColors.primaryColor,
                textcolor: AppColors.appBackgroundColor);
            Get.toNamed(Routes.BOTTOM_APP_BAR_VIEW);
          } else {
            CustomSnackBar.errorSnackBar(
                message: jsonMap['message_en'],
                backgroundColor: AppColors.primaryColor,
                textcolor: AppColors.appBackgroundColor);
          }

          loading(show: false);
        }
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr,
            backgroundColor: AppColors.primaryColor,
            textcolor: AppColors.appBackgroundColor);
        print(data["errors_de"]);
      } else {
        CustomSnackBar.errorSnackBar(
            message: "somethingWentWrong".tr,
            backgroundColor: AppColors.primaryColor,
            textcolor: AppColors.appBackgroundColor);
      }
    } catch (e) {
      loading(show: false);
      CustomSnackBar.errorSnackBar(
          message: "somethingWentWrong".tr,
          backgroundColor: AppColors.primaryColor,
          textcolor: AppColors.appBackgroundColor);
      appLogger.e(e.toString());
    } finally {
      loading(show: false);
    }
  }

  @override
  void onInit() {
    homecontent();
    upcomingbooking();
    getlocation();
    pickupFocusNode.value.requestFocus();

    super.onInit();
  }
}

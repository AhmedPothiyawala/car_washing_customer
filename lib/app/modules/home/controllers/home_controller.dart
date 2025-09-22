import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_burble_new/app/models/confirm_booking_model.dart';
import 'package:go_burble_new/app/models/get_calculated_rate_model.dart';

import '../../../data/app_colors.dart';
import '../../../data/global_constant.dart';
import '../../../data/storage_key.dart';
import '../../../data/utils.dart';
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
  final Rx<ConfirmBookingModel> _confirmBookingData = ConfirmBookingModel().obs;
  final RxInt _isselectedCar = 0.obs;
  final Rx<GetCalculatedRateModel> _getCalculatedPriceData =
      GetCalculatedRateModel().obs;
  Rx<Position?> get currentPosition => _currentPosition;
  Rx<Placemark?> get currentAddress => _currentAddress;
  Rx<HomeModel> get homeData => _homeData;
  Rx<UpcomingBookingModel> get bookingData => _bookingData;
  Rx<ConfirmBookingModel> get confirmBookingData => _confirmBookingData;
  Rx<GetCalculatedRateModel> get getCalculatedPriceData =>
      _getCalculatedPriceData;
  final _pickupLocationController = TextEditingController();
  var  pickupFocusNode = FocusNode().obs;
  final _apiService = Get.find<ApiServices>();
  final _storageService = Get.find<StorageService>();
  final RxList<FocusNode> dropfocus =[FocusNode()].obs;
  final RxList<Map<String, double>> _pickup =<Map<String, double>>[].obs;
  final RxList<Map<String, double>> _drop =<Map<String, double>>[].obs;
  final RxList<TextEditingController> _dropController = [TextEditingController()].obs;
  TextEditingController get pickupLocationController => _pickupLocationController;
  RxList<Map<String, double>> get pickup => _pickup;
  RxList<Map<String, double>> get drop => _drop;
  RxInt get isselectedCar => _isselectedCar;
  RxList<TextEditingController>  get dropController => _dropController;
  Future<Position> determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    LocationPermission permission = await Geolocator.checkPermission();

    // Check if service is disabled or permission is not granted
    if (!serviceEnabled ||
        permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // Navigate to settings screen and wait for result
      final result = await Get.toNamed(Routes.LOCATIN_VIEW);

      // If user came back and granted permission, retry
      if (result == true) {
        return await determinePosition(); // 🔁 Retry recursively
      } else {
        return Future.error('Location permission not granted');
      }
    }

    // ✅ All good: get the position
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    );
  }

  Future<void> getlocation() async {
    _currentPosition(await determinePosition());
    List<Placemark> placemarks = await placemarkFromCoordinates(
      _currentPosition.value!.latitude,
      _currentPosition.value!.longitude,
    );
    if (placemarks.isNotEmpty) {
      _currentAddress(placemarks[0]);
      print(_currentAddress);
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

  Future<void> getbookingcalculatedprice(String transfer_type,
     ) async {
    loading(show: true, title: "Sending...");
    try {
      var data =
      _drop.length>1?


      {
        'user_id': await _storageService.readString(StorageKey.userId),
        'service': _isPickMeUp.value == true ? "pickmeup" : "pickupmycar",
        'transfer_type': transfer_type.toString().toLowerCase(),
        'booking_date': _isselectedDate.value,
        'booking_time': _isselectedTime.value,
        'pickup':jsonEncode( _pickup),

      'drops': jsonEncode( _drop)
      }:  {
        'user_id': await _storageService.readString(StorageKey.userId),
        'service': _isPickMeUp.value == true ? "pickmeup" : "pickupmycar",
        'transfer_type': transfer_type.toString().toLowerCase(),
        'booking_date': _isselectedDate.value,
        'booking_time': _isselectedTime.value,
        'pickup': jsonEncode( _pickup),

        'drop': jsonEncode( _drop)
      };

      final response = await _apiService.post(
          endPoint: ApiEndpoints.getCalculatedRate, reqData: data);

      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;

          if (jsonMap['success'] == true) {
            _getCalculatedPriceData.value = GetCalculatedRateModel.fromJson(jsonMap);
            Get.toNamed(Routes.SELECT_RIDER_VIEW, arguments: {'service': _isPickMeUp.value == true ? "pickmeup" : "pickupmycar", 'transfer_type': transfer_type.toString().toLowerCase(),'booking_date': _isselectedDate.value, 'booking_time': _isselectedTime.value,'pickup':  _pickupLocationController,'drop':_dropController,'pickuplat':  _pickup,'droplat':_drop});
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message_en'],backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
          }
        } else {
          CustomSnackBar.errorSnackBar(message: "Failed to load data.",backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
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
            message: data['message_en'] ?? "somethingWentWrong".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
            print(data["errors_de"]);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
      }
    } catch (e) {
      _isLoding(false);
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
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


  Future<void> confirmbooking(String transfer_type,booking_date,booking_time,List<Map<String, double>> pickup,List<Map<String, double>> drop,
     String car_class,customer_name,customer_surname,customer_email,customer_phone,customer_remarks,dispatcher_name,customer_name2,customer_phone2,
      billing_company_name,billing_supplement,billing_street_no,billing_place,billing_address,billing_canton
      ,billing_postal_code,billing_land,dispatcher_phone,dispatcher_order_number
      ) async {
    loading(show: true, title: "Sending...");
    try {
      var data =drop.length>1?

      {
        'user_id': await _storageService.readString(StorageKey.userId),
        'service': _isPickMeUp.value == true ? "pickmeup" : "pickupmycar",
        'transfer_type': transfer_type.toString().toLowerCase(),
        'booking_date': booking_date,
        'booking_time': booking_time,
        'pickup': jsonEncode( pickup),
        'drops': jsonEncode(drop),
        'car_class': _getCalculatedPriceData.value.data![_isselectedCar.value].carClassId,
        'total_distance': _getCalculatedPriceData.value.data![_isselectedCar.value].totalDistance,
        'base_rate': _getCalculatedPriceData.value.data![_isselectedCar.value].baseRate,
        'vat_value': _getCalculatedPriceData.value.data![_isselectedCar.value].vatValue,
        'our_fees': _getCalculatedPriceData.value.data![_isselectedCar.value].ourFees,
        'customer_name': customer_name,
        'customer_surname': customer_surname,
        'customer_email': customer_email,
        'customer_phone': customer_phone,
        'customer_remarks': customer_remarks,
        'billing_address_flag': 1,
        'dispatcher_name': dispatcher_name,
        'customer_name2': customer_name2,
        'customer_phone2': customer_phone2,
        'billing_company_name': billing_company_name,
        'billing_supplement': billing_supplement,
        'billing_street_no': billing_street_no,
        'billing_place': billing_place,
        'billing_address': billing_address,
        'billing_canton': billing_canton,
        'billing_postal_code': billing_postal_code,
        'billing_land': billing_land,
        'dispatcher_phone': dispatcher_phone,
        'dispatcher_order_number': dispatcher_order_number,
      }
          :
    {
        'user_id': await _storageService.readString(StorageKey.userId),
        'service': _isPickMeUp.value == true ? "pickmeup" : "pickupmycar",
        'transfer_type': transfer_type.toString().toLowerCase(),
        'booking_date': booking_date,
        'booking_time': booking_time,
        'pickup': jsonEncode( pickup),
         'drop': jsonEncode(drop),
      'car_class': _getCalculatedPriceData.value.data![_isselectedCar.value].carClassId,
      'total_distance': _getCalculatedPriceData.value.data![_isselectedCar.value].totalDistance,
      'base_rate': _getCalculatedPriceData.value.data![_isselectedCar.value].baseRate,
      'vat_value': _getCalculatedPriceData.value.data![_isselectedCar.value].vatValue,
      'our_fees': _getCalculatedPriceData.value.data![_isselectedCar.value].ourFees,
      'customer_name': customer_name,
      'customer_surname': customer_surname,
      'customer_email': customer_email,
      'customer_phone': customer_phone,
      'customer_remarks': customer_remarks,
      'billing_address_flag': 1,
      'dispatcher_name': dispatcher_name,
      'customer_name2': customer_name2,
      'customer_phone2': customer_phone2,
      'billing_company_name': billing_company_name,
      'billing_supplement': billing_supplement,
      'billing_street_no': billing_street_no,
      'billing_place': billing_place,
      'billing_address': billing_address,
      'billing_canton': billing_canton,
      'billing_postal_code': billing_postal_code,
      'billing_land': billing_land,
      'dispatcher_phone': dispatcher_phone,
      'dispatcher_order_number': dispatcher_order_number,
      };

      final response = await _apiService.post(
          endPoint: ApiEndpoints.confirmBooking, reqData: data);

      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;

          if (jsonMap['success'] == true) {
            _confirmBookingData.value = ConfirmBookingModel.fromJson(jsonMap);
            Get.toNamed(Routes.RIDE_SUCCESS_VIEW);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message_en'],backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
          }
        } else {
          CustomSnackBar.errorSnackBar(message: "Failed to load data.",backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
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
            message: data['message_en'] ?? "somethingWentWrong".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
        print(data["errors_de"]);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
      }
    } catch (e) {
      _isLoding(false);
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
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

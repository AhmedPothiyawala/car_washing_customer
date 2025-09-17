import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../../data/global_constant.dart';
import '../../../data/storage_key.dart';
import '../../../data/utils.dart';
import '../../../models/home_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_services/api_services.dart';
import '../../../services/storage_services/storage_services.dart';
import '../../../widgets/custom_snackbar.dart';
class HomeControllers extends GetxController {
  final RxBool _isPickMeUp = false.obs;

  RxBool get isPickMeUp => _isPickMeUp;
  final RxBool _isLoding = false.obs;
  RxBool get isLoding => _isLoding;
  final RxString _isselectedDate = "".obs;
  final RxString _isselectedTime = "".obs;
  final Rx<Position?> _currentPosition = Rx<Position?>(null);
  final Rx<Placemark?> _currentAddress = Rx<Placemark?>(null);
  RxString get isselectedDate => _isselectedDate;
  RxString get isselectedTime => _isselectedTime;
  final Rx<HomeModel> _homeData = HomeModel().obs;
  Rx<Position?> get currentPosition => _currentPosition;
  Rx<Placemark?> get currentAddress => _currentAddress;
  Rx<HomeModel> get homeData => _homeData;
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    permission = await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get.toNamed(Routes.LOCATIN_VIEW);
      return Future.error('Location services are disabled.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.toNamed(Routes.LOCATIN_VIEW);
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.toNamed(Routes.LOCATIN_VIEW);
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
        ));
  }
  final _apiService = Get.find<ApiServices>();
  final _storageService = Get.find<StorageService>();
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
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}");
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


  Future<void> homecontent(
    ) async {
   _isLoding(true);
    try {
      var data =  {
        'user_id': _storageService.readString(StorageKey.userId)
      };

      final response =
      await _apiService.post(endPoint: ApiEndpoints.homeContent, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;

          if (jsonMap['status'] == true) {
            _homeData.value =HomeModel.fromJson(jsonMap);


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

  @override
  void onInit() {
    homecontent();
    getlocation();
    super.onInit();
  }
}

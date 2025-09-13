import 'dart:async';
import 'dart:convert';

import '../../../flavors/build_config.dart';
import '../../data/global_constant.dart';
import '../../data/network.dart';
import '../../data/storage_key.dart';
import '../storage_services/storage_services.dart';
import 'custom_interceptor.dart';
import 'package:dio/dio.dart';

import 'package:dio/src/response.dart' as dioResp;

import 'package:get/get.dart';

class ApiServices extends GetxService {
  static final String _burble_life_url =
      BuildConfig.instance.config.burble_life_url;
  // final String _burble_life_url_chat =
  //     "https://burble.life/index.php?option=com_burble&view=apistaging&task=apistaging.";
  static final String _burble_app = BuildConfig.instance.config.beat_brain_url;

  final _networkController = Get.find<NetworkController>();

  late Dio dio;

  CancelToken cancelToken = CancelToken();

  // Rx<String> _myToken = "".obs;

  @override
  onInit() {
    initProductApiServices();

    super.onInit();
  }

  Future<ApiServices> initProductApiServices() async {
    // var token = await _storage.read('token');

    // var headers = {
    //   "accept": "*/*",
    //   "content-type": "application/json",
    //   "authorization": "Basic ${token}",
    // };

    dio = Dio(
      BaseOptions(
        baseUrl: _burble_life_url,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),

        // headers: headers,
      ),
    )..interceptors.addAll([
        CustomInterceptor(cancelToken),
        LogInterceptor(
          responseBody: false,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: true,
          requestBody: false,
        )
      ]);

    return this;
  }

  Future<dioResp.Response?> getWithoutToken({required String endPoint}) async {
    try {
      if (_networkController.isConnected.value) {
        final url = "$_burble_life_url$endPoint";
        final response = await dio.get(
          url,
          options: Options(
              // headers: {
              //   "accept": "*/*",
              //   "content-type": "application/json",
              //   // "authorization": "Basic ${token}",
              // },
              ),
          cancelToken: cancelToken,
        );

        return response;
      } else {
        return null;
      }
    } on DioException catch (dioErr) {
      if (dioErr.type == DioExceptionType.cancel) {
        return null;
      } else {
        rethrow;
      }
    } catch (e) {
      appLogger.e(e.toString(), error: e);
      rethrow;
    }
  }

  Future<dioResp.Response?> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    bool isCustomUrl = false,
    String? customUrl,
    ResponseType? responseType,
  }) async {
    try {
      if (_networkController.isConnected.value) {
        final url = isCustomUrl ? customUrl! : "$_burble_life_url$endPoint";
        final storage = Get.find<StorageService>();
        var token = await storage.readString(StorageKey.token);
        // Filter out null values from queryParameters
        queryParameters?.removeWhere(
            (key, value) => value == null || value == '' || value == "");
        final response = await dio.get(
          url,
          options: Options(
            headers: {
              "accept": "text/plain",
              "content-type": "application/json",
              "authorization": "Bearer $token",
            },
            responseType: responseType,
          ),
          cancelToken: cancelToken,
          queryParameters: queryParameters,
        );
        return response;
      } else {
        return null;
      }
    } on DioException catch (dioErr) {
      if (dioErr.type == DioExceptionType.cancel) {
        return null;
      } else {
        rethrow;
      }
    } catch (e) {
      appLogger.e(e.toString(), error: e);
      rethrow;
    }
  }

  Future<dioResp.Response?> post({
    required String endPoint,
  Map<String, dynamic>? reqData,
    Map<String, dynamic>? extraHeaders,
  }) async {
    try {
      if (_networkController.isConnected.value) {
        final url = "$_burble_life_url$endPoint";
        final storage = Get.find<StorageService>();


        List<int> stringBytes = utf8.encode("JnBpY2t1cCojMjA0MA:QHNja3FuUHM2cGlja3Vw");
        var token = base64.encode(stringBytes);
        final Map<String, dynamic> headers = {
          "accept": "text/plain",
          "content-type": "application/json",
          "authorization": "Bearer $token",
        };
        if (extraHeaders != null) {
          headers.addAll(extraHeaders);
        }
        final response = await dio.post(
          url,
          queryParameters: reqData,
          options: Options(
            headers: headers,
          ),
          cancelToken: cancelToken,
        );
        return response;
      } else {
        return null;
      }
    } on DioException catch (dioErr) {
      if (dioErr.type == DioExceptionType.cancel) {
        return null;
      } else {
        rethrow;
      }
    } catch (e) {
      appLogger.e(e.toString(), error: e);
      rethrow;
    }
  }

  Future<dioResp.Response?> postWithoutToken(
      {required String endPoint,
      Object? reqData,
      bool isStaging = false}) async {
    try {
      if (_networkController.isConnected.value) {
        // final url = isStaging
        //     ? "${GlobalConstant.burble_life_urlstaging}$endPoint"
        //     : "$_burble_life_url$endPoint";

        final url = "$_burble_life_url$endPoint";

        final response = await dio.request(
          url,
          data: reqData,
          options: Options(
            method: "POST",
          ),
          cancelToken: cancelToken,
        );
        return response;
      } else {
        _networkController.showOfflineSnackbar();
        return null;
      }
    } on DioException catch (dioErr) {
      if (dioErr.type == DioExceptionType.cancel) {
        return null;
      } else {
        rethrow;
      }
    } catch (e) {
      appLogger.e(e.toString(), error: e);
      rethrow;
    }
  }

  Future<dioResp.Response?> chatPostWithoutToken({
    required String endPoint,
    Object? reqData,
  }) async {
    try {
      if (_networkController.isConnected.value) {
        final url = "$_burble_life_url$endPoint";
        final response = await dio.request(
          url,
          data: reqData,
          options: Options(
            method: "POST",
          ),
          cancelToken: cancelToken,
        );
        return response;
      } else {
        _networkController.showOfflineSnackbar();
        return null;
      }
    } on DioException catch (dioErr) {
      if (dioErr.type == DioExceptionType.cancel) {
        return null;
      } else {
        rethrow;
      }
    } catch (e) {
      appLogger.e(e.toString(), error: e);
      rethrow;
    }
  }

  Future<dioResp.Response?> put({
    required String endPoint,
    Object? reqData,
    Map<String, dynamic>? extraHeaders,
  }) async {
    try {
      if (_networkController.isConnected.value) {
        final url = "$_burble_life_url$endPoint";
        final storage = Get.find<StorageService>();
        var token = await storage.readString('token');
        final Map<String, dynamic> headers = {
          "accept": "text/plain",
          "content-type": "application/json",
          "authorization": "Bearer $token",
        };

        if (extraHeaders != null) {
          headers.addAll(extraHeaders);
        }
        final response = await dio.put(
          url,
          data: reqData,
          options: Options(
            headers: headers,
          ),
          cancelToken: cancelToken,
        );

        return response;
      } else {
        return null;
      }
    } on DioException catch (dioErr) {
      if (dioErr.type == DioExceptionType.cancel) {
        return null;
      } else {
        rethrow;
      }
    } catch (e) {
      appLogger.e(e.toString(), error: e);
      rethrow;
    }
  }

  Future<dioResp.Response?> delete({
    required String endPoint,
    Object? reqData,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (_networkController.isConnected.value) {
        final url = "$_burble_life_url$endPoint";
        final storage = Get.find<StorageService>();
        var token = await storage.readString('token');

        final response = await dio.delete(
          url,
          data: reqData,
          queryParameters: queryParameters,
          options: Options(
            headers: {
              "accept": "text/plain; x-api-version=1.0",
              "content-type": "application/json",
              "authorization": "Bearer $token",
            },
          ),
          cancelToken: cancelToken,
        );

        return response;
      } else {
        return null;
      }
    } on DioException catch (dioErr) {
      if (dioErr.type == DioExceptionType.cancel) {
        return null;
      } else {
        rethrow;
      }
    } catch (e) {
      appLogger.e(e.toString(), error: e);
      rethrow;
    }
  }
}

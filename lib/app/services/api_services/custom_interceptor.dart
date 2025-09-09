import 'dart:io';
import 'package:dio/dio.dart';
import '../../../flavors/build_config.dart';
import '../../data/global_constant.dart';
import '../../widgets/custom_snackbar.dart';
import 'dio_exception.dart';

class CustomInterceptor extends Interceptor {
  static late String errorMessage;
  // final _storage = Get.find<StorageService>();

  final CancelToken cancelToken;
  CustomInterceptor(this.cancelToken);

  var logger = BuildConfig.instance.config.logger;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // final options = err.requestOptions;
    // final requestPath = options.baseUrl;
    // var errorType = err.type;
    String myErrorMsg = "";

    if (err.error is SocketException) {
      // if(
      //   err.message
      // ){}
      myErrorMsg = "NO INTERNET CONNECTION";
      CustomSnackBar.errorSnackBar(message: myErrorMsg);
      // cancelToken.cancel([myErrorMsg]);
    } else {
      myErrorMsg = await MyDioException.myDioError(err, cancelToken);
    }
    DioException myErr =
        err.copyWith(message: myErrorMsg, response: err.response);

    logger.e(myErr);

    // if (myErr.response != null) {
    //   if (myErr.response!.statusCode == 401) {
    //     myErr.requestOptions.cancelToken!.cancel();
    //   }
    // }

    // throw myErrorMsg;
    return super.onError(myErr, handler);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final requestPath = options.baseUrl;
    // var token = await _storage.read('token');
    // if (token == null) {
    //   return null;
    // }
    // appLogger.d(token, name: "token");
    // final basicAuth = 'Basic $token';
    //
    // options.headers.addAll({
    //   "accept": "*/*",
    //   "content-type": "application/json",
    //   // 'Authorization': basicAuth,
    // });
    appLogger.d('${options.method} request => $requestPath');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // appLogger.d('StatusCode: ${response.statusCode}, Data: ${response.data.toString()}');
    logger.d(response);
    return super.onResponse(response, handler);
  }
}

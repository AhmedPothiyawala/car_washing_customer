import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../data/global_constant.dart';
import '../../modules/authentication/controllers/auth_controller.dart';

class MyDioException implements Exception {
  static late String errorMessage;

  static Future<String> myDioError(
      DioException dioError, CancelToken cancelToken) async {
    // if (dioError.type == DioErrorType.badResponse) {
    //   if (dioError.response!.statusCode! == 404) {
    //     errorMessage = 'The requested resource does not exist.';
    //   }
    //   errorMessage = _handleStatusCode(dioError.response!.statusCode!);
    // }

    switch (dioError.type) {
      case DioExceptionType.cancel:
        return errorMessage = 'Request to the server was cancelled.';

      case DioExceptionType.connectionTimeout:
        return errorMessage = 'Connection timed out.';

      case DioExceptionType.receiveTimeout:
        return errorMessage = 'Receiving timeout occurred.';

      case DioExceptionType.sendTimeout:
        return errorMessage = 'Request send timeout.';
      case DioExceptionType.connectionError:
        return errorMessage = 'no internet connection.';

      case DioExceptionType.badResponse:
        return errorMessage = await _handleStatusCode(dioError, cancelToken);

      case DioExceptionType.unknown:
        // if (dioError.error == SocketException) {
        //   return errorMessage = 'No Internet.';
        // } else if (dioError.message!.contains('SocketException')) {
        //   errorMessage = 'No Internet.';
        // } else if (dioError.message!.contains('Authentication'.toLowerCase())) {
        //   errorMessage = 'Authentication failed.';
        // }

        return errorMessage = 'Unexpected error occurred.';

      default:
        return errorMessage = "somethingWentWrong".tr;
    }
  }

  static Future<String> _handleStatusCode(
      DioException dioError, CancelToken cancelToken) async {
    if (dioError.response!.statusCode! >= 400 ||
        dioError.response!.statusCode! < 500) {
      ///Check if not login then logout....
      if (!dioError.requestOptions.uri.path.contains(ApiEndpoints.login)) {
        if (dioError.response != null && dioError.response!.statusCode == 401) {
          cancelToken.cancel(["Cancel req.. Unauthenticated user"]);

          /// That means token is invalid or expired
          /// Call logout method
          final controller = Get.find<AuthController>();
        }
      }

      if (dioError.response!.data != null) {
        if (dioError.response!.data is Map) {
          if (dioError.response!.data['message'] != null) {
            final data = dioError.response!.data;
            return data['message'];
          } else {
            return "somethingWentWrong".tr;
          }
        } else {
          return "somethingWentWrong".tr;
        }
      } else {
        return "somethingWentWrong".tr;
      }
    } else if (dioError.response!.statusCode! >= 500 ||
        dioError.response!.statusCode! < 600) {
      if (dioError.response!.data != null) {
        if (dioError.response!.data is Map) {
          if (dioError.response!.data['message'] != null) {
            final data = dioError.response!.data;
            return data['message'];
          } else {
            return "somethingWentWrong".tr;
          }
        } else {
          return "somethingWentWrong".tr;
        }
      } else {
        return "somethingWentWrong".tr;
      }
    } else {
      return "somethingWentWrong".tr;
    }

    // switch (statusCode) {
    //   case 400:
    //     return 'Bad request.';
    //   case 401:
    //     return 'Authentication failed.';
    //   case 403:
    //     return 'Invalid Credentials.';
    //   case 404:
    //     return 'The requested resource does not exist.';
    //   case 405:
    //     return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
    //   case 415:
    //     return 'Unsupported media type. The requested content type or version number is invalid.';
    //   case 422:
    //     return 'Data validation failed.';
    //   case 429:
    //     return 'Too many requests.';
    //   case 500:
    //     return 'Internal server error.';
    //   default:
    //     return 'Oops something went wrong!';
    // }
  }

  @override
  String toString() => errorMessage;
}

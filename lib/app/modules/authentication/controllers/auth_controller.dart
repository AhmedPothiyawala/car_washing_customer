import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/models/change_password_model.dart';
import 'package:go_burble_new/app/models/forgot_password_model.dart';
import 'package:go_burble_new/app/models/otp_verfiy_model.dart';
import 'package:go_burble_new/app/models/register_model.dart';
import 'package:go_burble_new/app/models/resend_otp_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../data/global_constant.dart';
import '../../../data/storage_key.dart';
import '../../../data/utils.dart';
import '../../../models/check_subscription_model.dart';
import '../../../models/login_model.dart'as loginmodel;
import '../../../models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_services/api_services.dart';
import '../../../services/storage_services/storage_services.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/custome_dialog.dart';
import '../../webview/custom_webview.dart';
import 'dart:async';
class AuthController extends GetxController {
  final _apiService = Get.find<ApiServices>();
  final _storageService = Get.find<StorageService>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Rx<UserModel> _userData = UserModel().obs;
  final Rx<loginmodel.LoginModel> _loginData = loginmodel.LoginModel().obs;
  final Rx<RegisterModel> _registerData = RegisterModel().obs;
  final Rx<OtpVerfiyModel> _otpData = OtpVerfiyModel().obs;
  final Rx<ResendOtpModel> _resendData = ResendOtpModel().obs;
  final Rx<ForgotPasswordModel> _forgotPasswordData = ForgotPasswordModel().obs;
  final Rx<ChangePasswordModel> _changePasswordData = ChangePasswordModel().obs;
  final Rx<CheckSubscriptionModel> _checkSubscriptionModel =
      CheckSubscriptionModel().obs;

  Rx<UserModel> get userData => _userData;
  Rx<loginmodel.LoginModel> get loginData => _loginData;
  Rx<RegisterModel> get registerData => _registerData;
  Rx<OtpVerfiyModel> get otpData => _otpData;
  Rx<ResendOtpModel> get resendData => _resendData;
  Rx<ForgotPasswordModel> get forgotPasswordData => _forgotPasswordData;
  Rx<ChangePasswordModel> get changePasswordData => _changePasswordData;

  Rx<CheckSubscriptionModel> get checkSubscriptionModel =>
      _checkSubscriptionModel;

  final RxBool _isRegisterPasswordObscureText = true.obs;

  RxBool get isRegisterPasswordObscureText => _isRegisterPasswordObscureText;

  final RxBool _isRegisterConfirmPasswordObscureText = true.obs;
  final RxBool _isTermsCondition = false.obs;
  RxBool get isTermsCondition => _isTermsCondition;
  RxBool get isRegisterConfirmPasswordObscureText =>
      _isRegisterConfirmPasswordObscureText;

  final RxBool _isLoginPasswordObscureText = true.obs;

  RxBool get isLoginPasswordObscureText => _isLoginPasswordObscureText;

  // Add below variables in your AuthController class
  final RxInt _resendOtpTimer = 30.obs;
  final RxBool _isResendOtpDisabled = true.obs;
  Timer? _timer;

  RxInt get resendOtpTimer => _resendOtpTimer;
  RxBool get isResendOtpDisabled => _isResendOtpDisabled;
  void startOtpTimer() {
    _resendOtpTimer.value = 30;
    _isResendOtpDisabled.value = true;

    _timer?.cancel(); // cancel existing timer if any
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendOtpTimer.value > 0) {
        _resendOtpTimer.value--;
      } else {
        _isResendOtpDisabled.value = false;
        timer.cancel();
      }
    });
  }

  void stopOtpTimer() {
    _timer?.cancel();
    _isResendOtpDisabled.value = false;
  }


  Future<void> clearWebViewCache() async {
    final WebViewCookieManager cookieManager = WebViewCookieManager();
    await cookieManager.clearCookies();
  }

  Future<void> loginWithEmailPassword({
    required String username,
     String? password,
     String? logintype

  }) async {
    loading(show: true, title: "Authenticating...");
    try {

      var data =
      logintype!=null?
      {
        'username': username,
        'usertype':"customer",
        'login_type':logintype
      }
          :
      {
        'username': username,
        'password': password,
        'usertype':"customer"

      };

      final response = await _apiService.post(
          endPoint: ApiEndpoints.login, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {

          Map<String, dynamic> jsonMap = response.data;

          if (jsonMap['status'] == true) {
            _loginData.value = loginmodel.LoginModel.fromJson(jsonMap);
            await setUserData(data: jsonMap).then((value) async {
              if (value = true) {

               Get.offAllNamed(Routes.BOTTOM_APP_BAR_VIEW);

              }
            });

            CustomSnackBar.successSnackBar(message: jsonMap['message_en']);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message_en']);
          }

          loading(show: false);
        }
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } catch (e) {
      loading(show: false);
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      appLogger.e(e.toString());
    } finally {
      loading(show: false);
    }
  }

  // app_developer3
  // 12345678

  Future thrivePopupStatusUpdate() async {
    loading(show: true, title: "Loading...");
    var data = dio.FormData.fromMap({
      'user_id': userData.value.userData!.id,
    });

    try {
      final response = await _apiService.postWithoutToken(
          endPoint: ApiEndpoints.thrivePopupStatusUpdate, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          userData.value.userData!.thrivePopupStatus = 0;
          update();
          setUserData(data: '');

          return true;
        }
      } else {
        loading(show: false);
        return false;
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
      return false;
    } catch (e) {
      loading(show: false);
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      appLogger.e(e.toString());
      return false;
    } finally {
      loading(show: false);
    }
  }

  Future<void> register_new_account({
    required String name,
    required String gender,
    required String email,
    // required String username,
    required String phone,
    required String password,


  }) async {

    loading(show: true, title: "Sending Otp");
    try {

      var data = {
        'name': name,
        'gender': gender.toString().toLowerCase(),
        'email':email,
        'phone': phone,
        'password': password,
        'confirm_password': password,
        'usertype':"1"
      };
      final response = await _apiService.post(
          endPoint: ApiEndpoints.registration, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {

          Map<String, dynamic> jsonMap = response.data;
          if (jsonMap['status'] == true) {
            _registerData.value = RegisterModel.fromJson(jsonMap);
            Get.toNamed(Routes.OTP_VIEW,arguments: {
              'username': phone,
              'forgotpassword':false

            } );
            startOtpTimer();
            CustomSnackBar.successSnackBar(message: "Otp Send Successfully");
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message_en']);
          }
          loading(show: false);
        }
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        print(data);
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } finally {
      loading(show: false);
    }
  }

  Future<void> validate_otp({
    required String username,
    required String otp,
    required bool forgotpassword,



  }) async {

    loading(show: true, title: "Verifying");
    try {

      var data = {
        'username': username,
        'otp': otp

      };
      final response = await _apiService.post(
          endPoint: ApiEndpoints.validateOtp, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {

          Map<String, dynamic> jsonMap = response.data;
          if (jsonMap['status'] == true) {
            _otpData.value = OtpVerfiyModel.fromJson(jsonMap);
            if(forgotpassword==true)
              {
                Get.toNamed(Routes.CHANGE_PASSWORD,arguments: {
                  'username': username,


                } );
              }
           else{
              Get.offAllNamed(Routes.LOGIN);
            }
            CustomSnackBar.successSnackBar(message: jsonMap['message_en']);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message_en']);
          }
          loading(show: false);
        }
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } finally {
      loading(show: false);
    }
  }

  Future<void> resend_otp({
    required String username,




  }) async {

    loading(show: true, title: "sending otp");
    try {

      var data = {
        'username': username


      };
      final response = await _apiService.post(
          endPoint: ApiEndpoints.resendOtp, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {

          Map<String, dynamic> jsonMap = response.data;
          if (jsonMap['status'] == true) {
            _resendData.value = ResendOtpModel.fromJson(jsonMap);
            startOtpTimer();
            CustomSnackBar.successSnackBar(message:jsonMap['message_en']);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message_en']);
          }
          loading(show: false);
        }
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } finally {
      loading(show: false);
    }
  }

  Future<bool> checkAutoLogin() async {
    String? token = await _storageService.readString(StorageKey.userId);
    bool? isLogin = await _storageService.readBool(StorageKey.isLogin);
    if (isLogin != null && isLogin) {
      if (token != null && token.isNotEmpty) {
        String? s;
        s = await _storageService.readString(StorageKey.userData);
        _loginData.value = loginmodel.LoginModel.fromJson(jsonDecode(s!));
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> forgotUsername({
    required String email,
  }) async {
    loading(show: true, title: "Loading...");
    try {
      var data = dio.FormData.fromMap({'email': email});

      final response = await _apiService.postWithoutToken(
          endPoint: ApiEndpoints.forgotUsername, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          String jsonString = response.data;
          Map<String, dynamic> jsonMap = jsonDecode(jsonString);

          if (jsonMap['status'] == 200) {
            Get.offAllNamed(Routes.LOGIN);
            CustomSnackBar.successSnackBar(message: jsonMap['message']);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message']);
          }
          loading(show: false);
        }
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } catch (e) {
      loading(show: false);
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      appLogger.e(e.toString());
    } finally {
      loading(show: false);
    }
  }


  Future<void> forgot_password({
    required String username,

    required bool forgotpassword,



  }) async {

    loading(show: true, title: "Loding...");
    try {

      var data = {
        'username': username,


      };
      final response = await _apiService.post(
          endPoint: ApiEndpoints.forgotPassword, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {

          Map<String, dynamic> jsonMap = response.data;
          if (jsonMap['status'] == true) {
            _forgotPasswordData.value = ForgotPasswordModel.fromJson(jsonMap);

              Get.toNamed(Routes.OTP_VIEW,arguments: {
              'username': username,
              'forgotpassword':true

              });
            startOtpTimer();

            CustomSnackBar.successSnackBar(message: jsonMap['message_en']);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message_en']);
          }
          loading(show: false);
        }
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } finally {
      loading(show: false);
    }
  }
  Future<void> validateAPI({
    required String token,
  }) async {
    loading(show: true, title: "Loading...");
    try {
      var data = dio.FormData.fromMap({'token': token});

      final response = await _apiService.postWithoutToken(
          endPoint: ApiEndpoints.validateEmailLinks, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          String jsonString = response.data;
          Map<String, dynamic> jsonMap = jsonDecode(jsonString);

          if (jsonMap['status'] == 200) {
            if (jsonMap['email_link_type'] == 1 ||
                jsonMap['email_link_type'] == 3) {
              loading(show: false);
              activateAccount(
                  user_id: jsonMap['user_id'].toString(), token: token);
            } else if (jsonMap['email_link_type'] == 2) {
              // showDialog(
              //   context: Get.context!,
              //   builder: (context) => DeeplinkpasswordCustomDialogBox(
              //     userId: jsonMap['user_id'].toString(),
              //   ),
              // );
            }
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message']);
          }
          loading(show: false);
        }
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } catch (e) {
      loading(show: false);
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      appLogger.e(e.toString());
    } finally {
      loading(show: false);
    }
  }

  Future<void> activateAccount({
    required String user_id,
    required String token,
  }) async {
    loading(show: true, title: "Loading...");
    try {
      var data = dio.FormData.fromMap({'user_id': user_id, 'token': token});

      final response = await _apiService.postWithoutToken(
          endPoint: ApiEndpoints.activateAccount, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          String jsonString = response.data;
          Map<String, dynamic> jsonMap = jsonDecode(jsonString);
          if (jsonMap['status'] == 200) {
            CustomSnackBar.successSnackBar(message: jsonMap['message']);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message']);
          }
          loading(show: false);
        }
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } catch (e) {
      loading(show: false);
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      appLogger.e(e.toString());
    } finally {
      loading(show: false);
    }
  }

  Future<void> change_password({
    required String username,
    required String password,
    required String confirm_password,




  }) async {

    loading(show: true, title: "Loding...");
    try {

      var data = {
        'username': username,
        'password': password,
        'confirm_password':confirm_password

      };
      final response = await _apiService.post(
          endPoint: ApiEndpoints.Changepassword, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {

          Map<String, dynamic> jsonMap = response.data;
          if (jsonMap['status'] == true) {
            _changePasswordData.value = ChangePasswordModel.fromJson(jsonMap);

            Get.toNamed(Routes.LOGIN);


            CustomSnackBar.successSnackBar(message: jsonMap['message_en']);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message_en']);
          }
          loading(show: false);
        }
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message_en'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } finally {
      loading(show: false);
    }
  }

  Future<void> resendActivationLink({
    required String email,
  }) async {
    loading(show: true, title: "Loading...");
    try {
      var data = dio.FormData.fromMap({'email': email});

      final response = await _apiService.postWithoutToken(
          endPoint: ApiEndpoints.resendActivationLink, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          String jsonString = response.data;
          Map<String, dynamic> jsonMap = jsonDecode(jsonString);

          if (jsonMap['status'] == 200) {
            Get.offAllNamed(Routes.LOGIN);
            CustomSnackBar.successSnackBar(message: jsonMap['message']);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message']);
          }
          loading(show: false);
        }
      }
    } on dio.DioException catch (ex) {
      loading(show: false);
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } catch (e) {
      loading(show: false);
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      appLogger.e(e.toString());
    } finally {
      loading(show: false);
    }
  }

  Future<bool> setUserData({
    required data,
  }) async {
    _storageService.writeString(
        key: StorageKey.userId, value: loginData.value.user!.id.toString());
    _storageService.writeBool(key: StorageKey.isLogin, value: true);
    _storageService.writeString(
        key: StorageKey.userData, value: jsonEncode(loginData.value));

    return true;
  }

  Future<void> logout({bool? forceLogout = false}) async {
    loading(show: true, title: "Logging out...");
    Future.delayed(const Duration(milliseconds: 2000));
    _storageService.writeBool(key: StorageKey.isLogin, value: false);
    List<String> clearStorageList = [];
    await clearWebViewCache();
    await FirebaseMessaging.instance.deleteToken();
    clearStorageList = [];
    clearStorageList.addAll([
      StorageKey.token,
      StorageKey.chatHistory,
      StorageKey.chatSession,
      StorageKey.userData,
      StorageKey.isLogin
    ]);
    await _storageService.removeFromStorageKeys(listKey: clearStorageList);
    await _storageService.clearStorage();
    await _storageService.clearStorage();
    _apiService.cancelToken = dio.CancelToken();
    _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
    loading(show: false);
  }

  Future<void> normalLogout({bool? forceLogout = false}) async {
    _googleSignIn.signOut();
    List<String> clearStorageList = [];
    await clearWebViewCache();
    await FirebaseMessaging.instance.deleteToken();
    clearStorageList = [];
    clearStorageList.addAll([
      StorageKey.token,
      StorageKey.chatHistory,
      StorageKey.chatSession,
      StorageKey.userData,
      StorageKey.isLogin
    ]);
    await _storageService.removeFromStorageKeys(listKey: clearStorageList);
    await _storageService.clearStorage();
    await _storageService.clearStorage();
  }

  Future<User?> signInWithGoogle() async {
    try {

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();


      if (googleUser == null) {

        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;


      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;
      if (user != null) {



        await loginWithEmailPassword(
          username: user.email!,
          logintype: "google",
        );

        return user;
      } else {

        return null;
      }
    } catch (e) {

      CustomSnackBar.errorSnackBar(message: "Google sign-in failed.");
      return null;
    }
  }


  // Future<void> aloginWithFacebook() async {
  //   try {
  //     // Trigger the sign-in flow
  //     final LoginResult result = await FacebookAuth.instance.login();
  //
  //     if (result.status == LoginStatus.success) {
  //       // Create a credential from the access token
  //       final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
  //
  //       // Once signed in, return the UserCredential
  //       final UserCredential userCredential = await _auth.signInWithCredential(facebookAuthCredential);
  //     }
  //   } catch (e) {
  //   }
  // }

  // Future<void> loginWithFacebook() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();
  //     if (result.status == LoginStatus.success) {
  //       // Firebase authentication Proof
  //       final AccessToken accessToken = result.accessToken!;
  //
  //       // Get user's data using the access token
  //       final profile = await FacebookAuth.i.getUserData();
  //     } else {
  //     }
  //   } catch (e) {
  //   }
  // }

  loginWithApple() async {
    final rawNonce = generaateNonce();
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final oauthCredential = OAuthProvider("apple.com").credential(
      accessToken: appleCredential.authorizationCode,
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    final result =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    if (result.user!.email!.isNotEmpty) {

    }
  }
}

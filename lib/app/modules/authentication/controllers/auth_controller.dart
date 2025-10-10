import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/models/change_password_model.dart';
import 'package:go_burble_new/app/models/forgot_password_model.dart';
import 'package:go_burble_new/app/models/otp_verfiy_model.dart';
import 'package:go_burble_new/app/models/register_model.dart';
import 'package:go_burble_new/app/models/resend_otp_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../data/global_constant.dart';
import '../../../data/storage_key.dart';
import '../../../data/utils.dart';
import 'package:flutter/material.dart';
import '../../../models/login_model.dart' as loginmodel;
import '../../../models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_services/api_services.dart';
import '../../../services/storage_services/storage_services.dart';
import '../../../widgets/custom_snackbar.dart';
import 'dart:async';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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

  Rx<UserModel> get userData => _userData;
  Rx<loginmodel.LoginModel> get loginData => _loginData;
  Rx<RegisterModel> get registerData => _registerData;
  Rx<OtpVerfiyModel> get otpData => _otpData;
  Rx<ResendOtpModel> get resendData => _resendData;
  Rx<ForgotPasswordModel> get forgotPasswordData => _forgotPasswordData;
  Rx<ChangePasswordModel> get changePasswordData => _changePasswordData;

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

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final userFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final usernmaeFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  // final usernameController = TextEditingController();
  final registerpasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final nameFocusNode = FocusNode();
  final genderFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final registerpasswordFocusNode = FocusNode();
  final globalFormKey = GlobalKey<FormState>();
  final forgotphoneController = TextEditingController();
  final forgotglobalFormKey = GlobalKey<FormState>();
  final forgotphoneFocusNode = FocusNode();
  final otpFocusNode = FocusNode();
  final otpFormKey = GlobalKey<FormState>();
  final FocusNode _pinFocusNode = FocusNode();
  final otpController = TextEditingController();
  final changeglobalFormKey = GlobalKey<FormState>();
  final changepasswordController = TextEditingController();
  final changeconfirmPasswordController = TextEditingController();
  final changepasswordFocusNode = FocusNode();
  final changeconfirmPasswordFocusNode = FocusNode();
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    userFocusNode.dispose();
    passwordFocusNode.dispose();
    usernmaeFormKey.currentState?.dispose();
    passwordFormKey.currentState?.dispose();
    confirmPasswordController.dispose();
    registerpasswordController.dispose();
  }

  @override
  void onInit() {
    FlutterNativeSplash.remove();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  void startOtpTimer() {
    _resendOtpTimer.value = 30;
    _isResendOtpDisabled.value = true;

    _timer?.cancel(); // cancel existing timer if any
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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

  Future<void> loginWithEmailPassword({String? logintype}) async {
    loading(show: true, title: "Authenticating...");
    try {
      var data = logintype != null
          ? {
              'username': userNameController.text,
              'usertype': "customer",
              'login_type': logintype
            }
          : {
              'username': userNameController.text,
              'password': passwordController.text,
              'usertype': "customer"
            };

      final response =
          await _apiService.post(endPoint: ApiEndpoints.login, reqData: data);
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

  Future<void> register_new_account() async {
    loading(show: true, title: "Sending Otp");
    try {
      var data = {
        'name': nameController.text,
        'gender': genderController.text.toLowerCase(),
        'email': emailController.text,
        'phone': phoneController.text,
        'password': registerpasswordController.text,
        'confirm_password': registerpasswordController.text,
        'usertype': "1"
      };
      final response = await _apiService.post(
          endPoint: ApiEndpoints.registration, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;
          if (jsonMap['status'] == true) {
            _registerData.value = RegisterModel.fromJson(jsonMap);
            Get.toNamed(Routes.OTP_VIEW, arguments: {
              'username': phoneController.text,
              'forgotpassword': false
            });
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
    required bool forgotpassword,
  }) async {
    loading(show: true, title: "Verifying");
    try {
      var data = {'username': username, 'otp': otpController.text};
      final response = await _apiService.post(
          endPoint: ApiEndpoints.validateOtp, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;
          if (jsonMap['status'] == true) {
            _otpData.value = OtpVerfiyModel.fromJson(jsonMap);
            if (forgotpassword == true) {
              Get.toNamed(Routes.CHANGE_PASSWORD, arguments: {
                'username': username,
              });
            } else {
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
      var data = {'username': username};
      final response = await _apiService.post(
          endPoint: ApiEndpoints.resendOtp, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;
          if (jsonMap['status'] == true) {
            _resendData.value = ResendOtpModel.fromJson(jsonMap);
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

  Future<void> forgot_password({
    required bool forgotpassword,
  }) async {
    loading(show: true, title: "Loding...");
    try {
      var data = {
        'username': forgotphoneController.text,
      };
      final response = await _apiService.post(
          endPoint: ApiEndpoints.forgotPassword, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonMap = response.data;
          if (jsonMap['status'] == true) {
            _forgotPasswordData.value = ForgotPasswordModel.fromJson(jsonMap);

            Get.toNamed(Routes.OTP_VIEW, arguments: {
              'username': forgotphoneController.text,
              'forgotpassword': true
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

  Future<void> change_password({
    required String username,
  }) async {
    loading(show: true, title: "Loding...");
    try {
      var data = {
        'username': username,
        'password': changepasswordController.text,
        'confirm_password': changeconfirmPasswordController.text
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

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;
      if (user != null) {
        userNameController.text = user.email!;
        await loginWithEmailPassword(
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
    if (result.user!.email!.isNotEmpty) {}
  }
}

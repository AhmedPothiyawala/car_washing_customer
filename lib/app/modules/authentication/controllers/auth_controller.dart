import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/widgets/update_alert_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../data/global_constant.dart';
import '../../../data/storage_key.dart';
import '../../../data/utils.dart';
import '../../../models/check_subscription_model.dart';
import '../../../models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_services/api_services.dart';
import '../../../services/storage_services/storage_services.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/custome_dialog.dart';
import '../../webview/custom_webview.dart';

class AuthController extends GetxController {
  final _apiService = Get.find<ApiServices>();
  final _storageService = Get.find<StorageService>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Rx<UserModel> _userData = UserModel().obs;
  final Rx<CheckSubscriptionModel> _checkSubscriptionModel =
      CheckSubscriptionModel().obs;

  Rx<UserModel> get userData => _userData;
  Rx<CheckSubscriptionModel> get checkSubscriptionModel =>
      _checkSubscriptionModel;

  final RxBool _isRegisterPasswordObscureText = true.obs;

  RxBool get isRegisterPasswordObscureText => _isRegisterPasswordObscureText;

  final RxBool _isRegisterConfirmPasswordObscureText = true.obs;

  RxBool get isRegisterConfirmPasswordObscureText =>
      _isRegisterConfirmPasswordObscureText;

  final RxBool _isLoginPasswordObscureText = true.obs;

  RxBool get isLoginPasswordObscureText => _isLoginPasswordObscureText;

  Future<void> clearWebViewCache() async {
    final WebViewCookieManager cookieManager = WebViewCookieManager();
    await cookieManager.clearCookies();
  }

  Future<void> loginWithEmailPassword({
    required String username,
    required String password,
  }) async {
    loading(show: true, title: "Authenticating...");
    try {
      String? tokenFirebase = await FirebaseMessaging.instance.getToken();
      await FirebaseMessaging.instance.setAutoInitEnabled(true);
      await FirebaseMessaging.instance.subscribeToTopic('allriders');
      await FirebaseMessaging.instance.subscribeToTopic('allusers');

      var data = dio.FormData.fromMap({
        'username': username,
        'password': password,
        'device_id': tokenFirebase
      });

      final response = await _apiService.postWithoutToken(
          endPoint: ApiEndpoints.login, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          String jsonString = response.data;
          Map<String, dynamic> jsonMap = jsonDecode(jsonString);

          if (jsonMap['status'] == 200) {
            _userData.value = UserModel.fromJson(jsonMap);
            await setUserData(data: jsonMap).then((value) async {
              if (value = true) {
                // final dailyBurbleController = Get.find<DailyBurbleController>();
                // dailyBurbleController.dailyBurbleController(
                //     userid: userData.value.userData!.id.toString());
                Get.offAllNamed(Routes.HOME_VIEW);
                if (_userData.value.userData!.isNew!) {
                  await Future.delayed(const Duration(milliseconds: 500),
                      () async {
                    // Get.to(() => const SubscribeView1());

                    Get.to(() => Custome_Webview(
                          url: 'https://goburble.com/welcome',
                          paymentURL: false,
                        ));
                  });

                  // Get.to(() => const SubscribeView1());
                } else if (!_userData.value.userData!.membershipActive!) {
                  await Future.delayed(const Duration(milliseconds: 500),
                      () async {
                    // Get.to(() => const SubscribeView1());
                  });
                }
              }
            });

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
    required String firstname,
    required String lastname,
    required String email,
    // required String username,
    required String password,
    required String phone,
    String? type,
  }) async {
    await Permission.notification.request();
    loading(show: true, title: "Saving...");
    try {
      String? tokenFirebase = await FirebaseMessaging.instance.getToken();
      await FirebaseMessaging.instance.setAutoInitEnabled(true);
      await FirebaseMessaging.instance.subscribeToTopic('allriders');
      await FirebaseMessaging.instance.subscribeToTopic('allusers');
      var data = dio.FormData.fromMap({
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'username': email,
        'password': password,
        'confirm_password': password,
        'phone': phone,
        'device_id': tokenFirebase,
        'type': type ?? socialMediaType.manuel.name.toString()
      });
      final response = await _apiService.postWithoutToken(
          endPoint: ApiEndpoints.registration, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          String jsonString = response.data;
          Map<String, dynamic> jsonMap = jsonDecode(jsonString);
          if (jsonMap['status'] == 200) {
            if (jsonMap['is_loggedin'] == true) {
              _userData.value = UserModel.fromJson(jsonMap);
              await setUserData(data: jsonMap).then((value) async {
                if (value = true) {
                  // final dailyBurbleController =
                  //     Get.find<DailyBurbleController>();
                  // dailyBurbleController.dailyBurbleController(
                  //     userid: userData.value.userData!.id.toString());
                  Get.offAllNamed(Routes.HOME_VIEW);
                  if (_userData.value.userData!.isNew!) {
                    await Future.delayed(const Duration(milliseconds: 500),
                        () async {
                      // Get.to(() => const SubscribeView1());
                      Get.to(() => Custome_Webview(
                            url: 'https://goburble.com/welcome',
                            paymentURL: false,
                          ));

                      // Get.to(() => const SubscribeView1());
                    });
                  } else if (!_userData.value.userData!.membershipActive!) {
                    await Future.delayed(const Duration(milliseconds: 500),
                        () async {
                      // Get.to(() => const SubscribeView1());
                    });
                  }
                }
              });
            } else {
              Get.offAllNamed(Routes.LOGIN);
              showDialog(
                context: Get.context!,
                builder: (context) => const CustomeDialog(),
              );
            }
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
        _userData.value = UserModel.fromJson(jsonDecode(s!));
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

  Future<void> forgotPassword({
    required String email,
  }) async {
    loading(show: true, title: "Loading...");
    try {
      var data = dio.FormData.fromMap({'email': email});

      final response = await _apiService.postWithoutToken(
          endPoint: ApiEndpoints.forgotPassword, reqData: data);
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

  Future<void> updatePassword({required String password, userid}) async {
    loading(show: true, title: "Loading...");
    try {
      var data = dio.FormData.fromMap({
        'userid': userid,
        'password': password,
        'confirmPassword': password,
      });
      final response = await _apiService.postWithoutToken(
          endPoint: ApiEndpoints.Resetpassword, reqData: data);
      if (response != null) {
        if (response.statusCode == 200) {
          String jsonString = response.data;
          Map<String, dynamic> jsonMap = jsonDecode(jsonString);
          if (int.parse(jsonMap['status'].toString()) == 200) {
            Get.back();
            update();
            CustomSnackBar.successSnackBar(message: jsonMap['message']);
          } else {
            CustomSnackBar.errorSnackBar(message: jsonMap['message']);
          }
        }
      }
    } on dio.DioException catch (ex) {
      if (ex.response != null) {
        final data = ex.response!.data;
        CustomSnackBar.errorSnackBar(
            message: data['message'] ?? "somethingWentWrong".tr);
      } else {
        CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      }
    } catch (e) {
      CustomSnackBar.errorSnackBar(message: "somethingWentWrong".tr);
      appLogger.e(e.toString());
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
        key: StorageKey.userId, value: userData.value.userData!.id.toString());
    _storageService.writeBool(key: StorageKey.isLogin, value: true);
    _storageService.writeString(
        key: StorageKey.userData, value: jsonEncode(userData.value));

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
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
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
      register_new_account(
          firstname: result.user!.displayName.toString(),
          lastname: "",
          email: result.user!.email.toString(),
          phone: result.user!.phoneNumber.toString(),
          password: result.user!.uid.toString(),
          type: socialMediaType.apple.name);
    }
  }
}

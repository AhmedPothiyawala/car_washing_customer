import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';
import 'package:go_burble_new/app/routes/app_pages.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../data/app_images.dart';
import '../../../../data/text_styles.dart';
import '../../../../data/utils.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../webview/custom_webview.dart';
import '../../controllers/auth_controller.dart';
import '../register/register_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class LoginView extends StatefulWidget {
  final bool? isNotLogged;
  const LoginView({super.key, this.isNotLogged});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final authController = Get.find<AuthController>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final userFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final usernmaeFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    FlutterNativeSplash.remove();

    if (widget.isNotLogged == null) {
      authController.normalLogout();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: Obx(
          () {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15.0),
                      child: Image.asset(
                        AppImages.burbleNewLogo,
                        width: 225,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    // padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: AppColors.appLightColor,
                        border: Border.all(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "Login",
                            style: comfortaaTextstyle.copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: AppColors.headingColor),
                          ),
                        ),
                        Form(
                          key: usernmaeFormKey,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 5, right: 10),
                            child: CustomTextFormField(
                              textInputAction: TextInputAction.next,
                              hintText: "Email",
                              focusNode: userFocusNode,
                              controller: userNameController,
                              fillColor: Colors.transparent,
                              validator: (string) {
                                if (string == null || string.isEmpty) {
                                  return "emailIsRequired".tr;
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                usernmaeFormKey.currentState!.validate();
                              },
                            ),
                          ),
                        ),
                        Form(
                          key: passwordFormKey,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 5, right: 10, top: 5),
                            child: CustomTextFormField(
                              hintText: "Password",
                              focusNode: passwordFocusNode,
                              onFieldSubmitted: (string) => loginSubmit(),
                              controller: passwordController,
                              fillColor: Colors.transparent,
                              validator: (string) {
                                if (string == null || string.isEmpty) {
                                  return "enterpassword".tr;
                                }
                                return null;
                              },
                              suffixIcon: GestureDetector(
                                onTap: () async {
                                  authController
                                          .isLoginPasswordObscureText.value =
                                      !authController
                                          .isLoginPasswordObscureText.value;
                                },
                                child: Icon(
                                  authController
                                          .isLoginPasswordObscureText.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.buttonBackgroundColor,
                                ),
                              ),
                              obscureText: authController
                                  .isLoginPasswordObscureText.value,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            Get.toNamed(Routes.FORGOT_PASSWORD);
                          },
                          child: Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              alignment: Alignment.center,
                              child: const Text("Forgot your password?",
                                  style: TextStyle(
                                      color: AppColors.subtitleColor,
                                      fontSize: 16))),
                        ),
                        GestureDetector(
                          onTap: () {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            Get.toNamed(Routes.ACTIVATION_LINK);
                          },
                          child: const Text("Didn't receive activation link?",
                              style: TextStyle(
                                  color: AppColors.subtitleColor,
                                  fontSize: 16)),
                        ),
                        CustomButton(
                          onPressed: () => loginSubmit(),
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.only(
                              left: 30, top: 10, bottom: 10, right: 30),
                          borderRadius: BorderRadius.circular(20),
                          childWidget:
                              Text("Login", style: customButtonTextstyle),
                        ),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5, top: 5),
                            alignment: Alignment.center,
                            child: const Text("OR",
                                style: TextStyle(
                                    color: AppColors.headingColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28))),
                        Platform.isIOS
                            ? CustomIconButton(
                                onPressed: () async {
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.hide');
                                  authController.loginWithApple();
                                },
                                bgColor: AppColors.appLightColor,
                                iconWidget: Image.asset(AppImages.appleIcon,
                                    height: 25),
                                margin:
                                    const EdgeInsets.only(bottom: 10, top: 0),
                                padding: const EdgeInsets.only(
                                    left: 28, top: 10, bottom: 10, right: 28),
                                borderRadius: BorderRadius.circular(20),
                                // iconData:  Image.asset(AppImages.googleIcon, height: 30),
                                borderColor: AppColors.subtitleColor,
                                childWidget: Text("\tLogin with Apple   ",
                                    style: customButtonTextstyle.copyWith(
                                        color: AppColors.subtitleColor)),
                              )
                            : const SizedBox.shrink(),
                        CustomIconButton(
                          onPressed: () async {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            User? user =
                                await authController.signInWithGoogle();
                            if (user != null) {
                              await authController.register_new_account(
                                  firstname: user.displayName
                                      .toString()
                                      .split(" ")
                                      .first
                                      .toString(),
                                  lastname: user.displayName
                                      .toString()
                                      .split(" ")
                                      .last
                                      .toString(),
                                  email: user.email.toString(),
                                  phone: user.phoneNumber.toString(),
                                  // username: user.email.toString(),
                                  password: "",
                                  type: socialMediaType.google.name);
                            }
                          },
                          bgColor: AppColors.appLightColor,
                          iconWidget:
                              Image.asset(AppImages.googleIcon, height: 25),
                          margin: const EdgeInsets.only(bottom: 10, top: 0),
                          padding: const EdgeInsets.only(
                              left: 34, top: 10, bottom: 10, right: 34),
                          borderRadius: BorderRadius.circular(20),
                          // iconData:  Image.asset(AppImages.googleIcon, height: 30),
                          borderColor: AppColors.subtitleColor,
                          childWidget: Text("Login with Google",
                              style: customButtonTextstyle.copyWith(
                                  color: AppColors.subtitleColor)),
                        ),
                        // CustomIconButton(
                        //   onPressed: () async {
                        //     authController.loginWithFacebook();
                        //   },
                        //   bgColor: AppColors.appLightColor,
                        //   iconWidget: Image.asset(AppImages.facebookIcon, height: 25),
                        //   margin: const EdgeInsets.only(bottom: 10, top: 0),
                        //   padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 30),
                        //   borderRadius: BorderRadius.circular(20),
                        //   // iconData:  Image.asset(AppImages.googleIcon, height: 30),
                        //   borderColor: AppColors.subtitleColor,
                        //   childWidget: Text("Login with Facebook", style: customButtonTextstyle.copyWith(color: AppColors.subtitleColor)),
                        // ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 15, top: 15),
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text:
                                    'By tapping Continue, Register or logging into an existing burble account, you agree to our ',
                                style: const TextStyle(
                                    color: AppColors.headingColor,
                                    fontSize: 14),
                                children: [
                                  TextSpan(
                                      text: 'Terms & Conditions',
                                      style: const TextStyle(
                                        color: AppColors.headingColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap =
                                            () => Get.to(() => Custome_Webview(
                                                  url:
                                                      'https://goburble.com/terms',
                                                  paymentURL: false,
                                                ))),
                                  const TextSpan(
                                    text:
                                        ' and acknowledge that you have read our ',
                                  ),
                                  TextSpan(
                                      text: 'Privacy Policy',
                                      style: const TextStyle(
                                        color: AppColors.headingColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap =
                                            () => Get.to(() => Custome_Webview(
                                                  url:
                                                      'https://goburble.com/privacy',
                                                  paymentURL: false,
                                                ))),
                                  const TextSpan(
                                    text:
                                        ', which explains how to opt out of offers and promos.',
                                  ),
                                ],
                              )),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Need an account?',
                                style: TextStyle(
                                    color: AppColors.subtitleColor,
                                    fontSize: 16)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomButton(
                            bgColor: AppColors.appLightColor,
                            borderColor: AppColors.headingColor,
                            onPressed: () {
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                              Get.to(() => (const RegisterView()));
                            },
                            margin: const EdgeInsets.only(bottom: 20, top: 5),
                            padding: const EdgeInsets.only(
                                left: 25, top: 10, bottom: 10, right: 20),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            childWidget: Text(
                              "REGISTER",
                              style: customButtonTextstyle.copyWith(
                                  color: AppColors.subtitleColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> loginSubmit() async {
    await Permission.notification.request();
    bool isEmailValid = usernmaeFormKey.currentState!.validate();
    bool isPasswordValid = passwordFormKey.currentState!.validate();
    if (isEmailValid && isPasswordValid) {
      ///login endpoint
      await authController
          .loginWithEmailPassword(
        username: userNameController.text.trim(),
        password: passwordController.text,
      )
          .then((_) {
        userFocusNode.unfocus();
        passwordFocusNode.unfocus();
        if (userNameController.text.isEmpty) {
          usernmaeFormKey.currentState?.reset();
          userNameController.text = "";
        }
        if (passwordController.text.isEmpty) {
          passwordController.text = "";
          passwordFormKey.currentState?.reset();
        }
      });
    }
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    userFocusNode.dispose();
    passwordFocusNode.dispose();
    usernmaeFormKey.currentState?.dispose();
    passwordFormKey.currentState?.dispose();
    super.dispose();
  }
}

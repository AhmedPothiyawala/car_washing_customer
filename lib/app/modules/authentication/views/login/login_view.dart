import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';
import 'package:go_burble_new/app/routes/app_pages.dart';

import '../../../../data/app_images.dart';
import '../../../../data/text_styles.dart';
import '../../../../data/utils.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../controllers/auth_controller.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/services.dart';

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

    // if (widget.isNotLogged == null) {
    //   authController.normalLogout();
    // }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (value1, value2) {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else {
          exit(0);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: Obx(
          () {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: kHeight * 0.35,
                    width: kWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.mainBg),
                            fit: BoxFit.fill)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppImages.appIcon))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SizedBox(
                            width: kWidth * 0.9,
                            child: Column(
                              children: [
                                Text(
                                  "loginTitle".tr,
                                  style: sfProBoldTextstyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SizedBox(
                            width: kWidth * 0.9,
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "loginSubTitle".tr,
                                    style: sfProMediumTextstyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: kHeight * 0.3),
                    child: Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: kWidth * 0.9,
                          decoration: BoxDecoration(
                              color: AppColors.appBackgroundColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: CustomIconButton(
                                    height: 50,
                                    width: kWidth * 0.8,
                                    onPressed: () async {
                                      authController.signInWithGoogle();
                                    },
                                    bgColor: AppColors.appBackgroundColor,
                                    borderRadius: BorderRadius.circular(12),
                                    // iconData:  Image.asset(AppImages.googleIcon, height: 30),
                                    borderColor:
                                        AppColors.iconButtonBorderColor,
                                    childWidget: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 18,
                                          width: 18,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      AppImages.googleIcon),
                                                  fit: BoxFit.fill)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "googleLogin".tr,
                                          style: sfProSemiBoldTextstyle,
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Platform.isIOS
                                  ? Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                          child: CustomIconButton(
                                              height: 50,
                                              width: kWidth * 0.8,
                                              onPressed: () async {},
                                              bgColor:
                                                  AppColors.appBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              // iconData:  Image.asset(AppImages.googleIcon, height: 30),
                                              borderColor: AppColors
                                                  .iconButtonBorderColor,
                                              childWidget: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 18,
                                                    width: 18,
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                AppImages
                                                                    .appleIcon),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "appleLogin".tr,
                                                    style:
                                                        sfProSemiBoldTextstyle,
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                      width: kWidth * 0.25,
                                      child: const Divider(
                                        color: AppColors.appWhiteGreyColor,
                                      )),
                                  Text(
                                    "loginWith".tr,
                                    style: sfProRegularTextstyle.copyWith(
                                        color: AppColors.blackColor),
                                  ),
                                  SizedBox(
                                      width: kWidth * 0.25,
                                      child: const Divider(
                                        color: AppColors.appWhiteGreyColor,
                                      )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: CustomTextFormField(
                                  textInputAction: TextInputAction.next,
                                  width: kWidth * 0.8,
                                  hintText: "email".tr,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z0-9@._\-+]'),
                                    ),
                                  ],
                                  borderRadiusAll: const BorderRadius.all(
                                      Radius.circular(12)),
                                  focusNode: userFocusNode,
                                  controller: userNameController,
                                  fillColor: AppColors.appBackgroundColor,
                                  borderColor: userFocusNode.hasFocus
                                      ? AppColors.primaryColor
                                      : AppColors.appWhiteGreyColor,
                                  validator: validateEmail,
                                  onFieldSubmitted: (value) {
                                    usernmaeFormKey.currentState!.validate();
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: CustomTextFormField(
                                  hintText: "password".tr,
                                  width: kWidth * 0.8,
                                  focusNode: passwordFocusNode,
                                  borderRadiusAll: const BorderRadius.all(
                                      Radius.circular(12)),
                                  controller: passwordController,
                                  fillColor: AppColors.appBackgroundColor,
                                  borderColor: passwordFocusNode.hasFocus
                                      ? AppColors.primaryColor
                                      : AppColors.appWhiteGreyColor,
                                  validator: validatePassword,
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      authController.isLoginPasswordObscureText
                                              .value =
                                          !authController
                                              .isLoginPasswordObscureText.value;
                                    },
                                    child: Icon(
                                      authController
                                              .isLoginPasswordObscureText.value
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  obscureText: authController
                                      .isLoginPasswordObscureText.value,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.FORGOT_PASSWORD);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "forgotPassword".tr,
                                      style: sfProSemiBoldTextstyle.copyWith(
                                          color: AppColors.primaryColor),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: CustomButton(
                                  onPressed: () => loginSubmit(),
                                  height: 50,
                                  width: kWidth * 0.8,
                                  borderRadius: BorderRadius.circular(12),
                                  bgColor: AppColors.primaryColor,
                                  childWidget: Center(
                                      child: Text("signIn".tr,
                                          style: sfProMediumTextstyle.copyWith(
                                              fontSize: 16))),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "notHaveAnAccount".tr,
                                    style: sfProMediumTextstyle.copyWith(
                                        color: AppColors.appWhiteGreyColor2),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.REGISTER);
                                      },
                                      child: Text(
                                        "signUp".tr,
                                        style: sfProSemiBoldTextstyle.copyWith(
                                            color: AppColors.primaryColor),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
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
    // bool isEmailValid = usernmaeFormKey.currentState!.validate();
    // bool isPasswordValid = passwordFormKey.currentState!.validate();
    // if (isEmailValid && isPasswordValid) {
    //   userFocusNode.unfocus();
    //   passwordFocusNode.unfocus();
    //
    //   await authController
    //       .loginWithEmailPassword(
    //         username: userNameController.text.trim(),
    //         password: passwordController.text,
    //       )
    //       .then((val) {});
    // }

    userFocusNode.unfocus();
    passwordFocusNode.unfocus();

    await authController
        .loginWithEmailPassword(
          username: userNameController.text.trim(),
          password: passwordController.text,
        )
        .then((val) {});
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

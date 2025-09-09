import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';
import 'package:go_burble_new/app/data/app_images.dart';
import 'package:go_burble_new/app/modules/authentication/controllers/auth_controller.dart';
import 'package:go_burble_new/app/routes/app_pages.dart';

import '../../../../data/text_styles.dart';
import '../../../../data/utils.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../webview/custom_webview.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final authController = Get.find<AuthController>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  // final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final globalFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordController.addListener(updateWidget);
    confirmPasswordController.addListener(updateWidget);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: Get.find<AuthController>(),
        builder: (controller) {
          return SafeArea(
            child: GestureDetector(
              onTap: () {
                passwordFocusNode.unfocus();
                confirmPasswordFocusNode.unfocus();
                authController.update();
              },
              child: Scaffold(
                backgroundColor: AppColors.appBackgroundColor,
                body: Obx(
                  () {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15.0),
                              child: Image.asset(
                                AppImages.burbleNewLogo,
                                width: 225,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            // padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: AppColors.appLightColor,
                                border: Border.all(color: AppColors.whiteColor),
                                borderRadius: BorderRadius.circular(20)),
                            child: Form(
                              key: globalFormKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Text(
                                      "Registration",
                                      style: comfortaaTextstyle.copyWith(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.headingColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 5, right: 10),
                                    child: CustomTextFormField(
                                      onChanged: (v) {
                                        passwordFocusNode.unfocus();
                                        confirmPasswordFocusNode.unfocus();
                                        authController.update();
                                      },
                                      hintText: "First Name",
                                      controller: firstNameController,
                                      fillColor: Colors.transparent,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "firstIsRequired".tr;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 5, right: 10, top: 5),
                                    child: CustomTextFormField(
                                      onChanged: (v) {
                                        passwordFocusNode.unfocus();
                                        confirmPasswordFocusNode.unfocus();
                                        authController.update();
                                      },
                                      hintText: "Last Name",
                                      controller: lastNameController,
                                      fillColor: Colors.transparent,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "lastIsRequired".tr;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 5, right: 10, top: 5),
                                    child: CustomTextFormField(
                                      onChanged: (v) {
                                        passwordFocusNode.unfocus();
                                        confirmPasswordFocusNode.unfocus();
                                        authController.update();
                                      },
                                      hintText: "Email",
                                      controller: emailController,
                                      fillColor: Colors.transparent,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) =>
                                          validateEmail(emailController.text),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 5, right: 10, top: 5),
                                    child: CustomTextFormField(
                                      onTapOutside: (a) {
                                        passwordFocusNode.unfocus();
                                        authController.update();
                                      },
                                      onFieldSubmitted: (v) {
                                        passwordFocusNode.unfocus();
                                        confirmPasswordFocusNode.requestFocus();
                                        authController.update();
                                      },
                                      onSaved: (v) {
                                        passwordFocusNode.unfocus();
                                        confirmPasswordFocusNode.requestFocus();
                                        authController.update();
                                      },
                                      onEditingComplete: () {
                                        passwordFocusNode.unfocus();
                                        authController.update();
                                      },
                                      hintText: "Choose a password",
                                      controller: passwordController,
                                      fillColor: Colors.transparent,
                                      focusNode: passwordFocusNode,
                                      validator: (password) => validatePassword(
                                          passwordController.text),
                                      textInputAction: TextInputAction.next,
                                      suffixIcon: GestureDetector(
                                        onTap: () async {
                                          authController
                                                  .isRegisterPasswordObscureText
                                                  .value =
                                              !authController
                                                  .isRegisterPasswordObscureText
                                                  .value;
                                        },
                                        child: Icon(
                                          authController
                                                  .isRegisterPasswordObscureText
                                                  .value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color:
                                              AppColors.buttonBackgroundColor,
                                        ),
                                      ),
                                      obscureText: authController
                                          .isRegisterPasswordObscureText.value,
                                    ),
                                  ),
                                  if (passwordController.text.isNotEmpty &&
                                      passwordFocusNode.hasPrimaryFocus == true)
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            bottom: 5,
                                            right: 10,
                                            top: 5),
                                        child: buildValidationList(
                                            passwordController)),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 5, right: 10, top: 5),
                                    child: CustomTextFormField(
                                      focusNode: confirmPasswordFocusNode,
                                      hintText: "Confirm your password",
                                      controller: confirmPasswordController,
                                      fillColor: Colors.transparent,
                                      textInputAction: TextInputAction.next,
                                      validator: (password) {
                                        if (confirmPasswordController
                                            .text.isEmpty) {
                                          return "confirmpasswordIsRequired".tr;
                                        }
                                        if (passwordController.text !=
                                            confirmPasswordController.text) {
                                          return "Password & Confirm Password must be same";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (v) {
                                        passwordFocusNode.unfocus();
                                        authController.update();
                                      },
                                      onTapOutside: (a) {
                                        confirmPasswordFocusNode.unfocus();
                                        authController.update();
                                      },
                                      onFieldSubmitted: (v) {
                                        confirmPasswordFocusNode.unfocus();

                                        authController.update();
                                      },
                                      onSaved: (v) {
                                        confirmPasswordFocusNode.unfocus();
                                        authController.update();
                                      },
                                      onEditingComplete: () {
                                        confirmPasswordFocusNode.unfocus();
                                        authController.update();
                                      },
                                      suffixIcon: GestureDetector(
                                        onTap: () async {
                                          authController
                                                  .isRegisterConfirmPasswordObscureText
                                                  .value =
                                              !authController
                                                  .isRegisterConfirmPasswordObscureText
                                                  .value;
                                        },
                                        child: Icon(
                                          authController
                                                  .isRegisterConfirmPasswordObscureText
                                                  .value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color:
                                              AppColors.buttonBackgroundColor,
                                        ),
                                      ),
                                      obscureText: authController
                                          .isRegisterConfirmPasswordObscureText
                                          .value,
                                    ),
                                  ),
                                  if (confirmPasswordController
                                          .text.isNotEmpty &&
                                      confirmPasswordFocusNode
                                              .hasPrimaryFocus ==
                                          true)
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            bottom: 5,
                                            right: 10,
                                            top: 5),
                                        child: buildValidationList(
                                            confirmPasswordController)),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 10, bottom: 0, right: 10, top: 5),
                                  //   child: CustomTextFormField(
                                  //     onChanged: (v) {
                                  //       passwordFocusNode.unfocus();
                                  //       confirmPasswordFocusNode.unfocus();
                                  //       authController.update();
                                  //     },
                                  //     hintText: "Phone Number",
                                  //     controller: phoneNumberController,
                                  //     maxLength: 10,
                                  //     keyboardType: TextInputType.number,
                                  //     fillColor: Colors.transparent,
                                  //     textInputAction: TextInputAction.done,
                                  //     onFieldSubmitted: (v) => RegisterSubmit(),
                                  //     validator: (value) {
                                  //       if (value == null || value.isEmpty) {
                                  //         return "phonenumber".tr;
                                  //       }
                                  //       if (value.length < 10) {
                                  //         return "phonenumberdigit".tr;
                                  //       }
                                  //       return null;
                                  //     },
                                  //   ),
                                  // ),
                                  CustomButton(
                                    onPressed: () => RegisterSubmit(),
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        top: 10,
                                        bottom: 10,
                                        right: 30),
                                    borderRadius: BorderRadius.circular(20),
                                    childWidget: Text(
                                      "REGISTER",
                                      style: customButtonTextstyle,
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 5),
                                      alignment: Alignment.center,
                                      child: const Text("OR",
                                          style: TextStyle(
                                              color: AppColors.headingColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28))),
                                  Platform.isIOS
                                      ? CustomIconButton(
                                          onPressed: () async {
                                            authController.loginWithApple();
                                          },
                                          bgColor: AppColors.appLightColor,
                                          iconWidget: Image.asset(
                                              AppImages.appleIcon,
                                              height: 25),
                                          margin: const EdgeInsets.only(
                                              bottom: 10, top: 0),
                                          padding: const EdgeInsets.only(
                                              left: 28,
                                              top: 10,
                                              bottom: 10,
                                              right: 28),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          // iconData:  Image.asset(AppImages.googleIcon, height: 30),
                                          borderColor: AppColors.subtitleColor,
                                          childWidget: Text(
                                              "\tContinue with Apple   ",
                                              style: customButtonTextstyle
                                                  .copyWith(
                                                      color: AppColors
                                                          .subtitleColor)),
                                        )
                                      : const SizedBox.shrink(),
                                  CustomIconButton(
                                    onPressed: () async {
                                      User? user = await authController
                                          .signInWithGoogle();
                                      if (user != null) {
                                        await authController
                                            .register_new_account(
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
                                                phone:
                                                    user.phoneNumber.toString(),
                                                // username: user.email.toString(),
                                                password: "",
                                                type: socialMediaType
                                                    .google.name);
                                      }
                                    },
                                    bgColor: AppColors.appLightColor,
                                    iconWidget: Image.asset(
                                        AppImages.googleIcon,
                                        height: 25),
                                    margin: const EdgeInsets.only(
                                        bottom: 10, top: 0),
                                    padding: const EdgeInsets.only(
                                        left: 34,
                                        top: 10,
                                        bottom: 10,
                                        right: 34),
                                    borderRadius: BorderRadius.circular(20),
                                    // iconData:  Image.asset(AppImages.googleIcon, height: 30),
                                    borderColor: AppColors.subtitleColor,
                                    childWidget: Text("Continue with Google",
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
                                  //   childWidget:
                                  //       Text("Continue with Facebook", style: customButtonTextstyle.copyWith(color: AppColors.subtitleColor)),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        bottom: 15,
                                        top: 15),
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
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () => Get.to(
                                                          () => Custome_Webview(
                                                                url:
                                                                    'https://goburble.com/terms',
                                                                paymentURL:
                                                                    false,
                                                              ))),
                                            const TextSpan(
                                              text:
                                                  ' and acknowledge that you have read our ',
                                            ),
                                            TextSpan(
                                                text: 'Privacy Policy',
                                                style: const TextStyle(
                                                  color: AppColors.headingColor,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () => Get.to(
                                                          () => Custome_Webview(
                                                                url:
                                                                    'https://goburble.com/privacy',
                                                                paymentURL:
                                                                    false,
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
                                        Get.offAllNamed(Routes.LOGIN);
                                      },
                                      margin: const EdgeInsets.only(
                                          bottom: 20, top: 5),
                                      padding: const EdgeInsets.only(
                                          left: 25,
                                          top: 10,
                                          bottom: 10,
                                          right: 20),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      childWidget: Text(
                                        "LOGIN",
                                        style: customButtonTextstyle.copyWith(
                                            color: AppColors.subtitleColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }

  Widget buildValidationList(TextEditingController textController) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Password must include:',
              style: TextStyle(color: AppColors.subtitleColor)),
          buildValidationItem(
              textController.text.length >= 8 &&
                  textController.text.length <= 20,
              '8-20 characters'),
          buildValidationItem(textController.text.contains(RegExp(r'[A-Z]')),
              'At least one capital letter'),
          buildValidationItem(textController.text.contains(RegExp(r'[0-9]')),
              'At least one number'),
          buildValidationItem(
              textController.text.contains(RegExp(r'[!@$%^&*(),.?":{}|<>]')),
              'At least one special character'),
          buildValidationItem(!textController.text.contains(' '),
              'Not allowed special characters: #, ~, `,'),
        ],
      ),
    );
  }

  Widget buildValidationItem(bool isValid, String text) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
          size: 16,
        ),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(color: AppColors.subtitleColor)),
      ],
    );
  }

  Future<void> RegisterSubmit() async {
    bool formkey = globalFormKey.currentState!.validate();

    if (formkey) {
      ///login endpoint
      await authController
          .register_new_account(
              firstname: firstNameController.text.trim(),
              lastname: lastNameController.text.trim(),
              email: emailController.text.trim(),
              phone: phoneNumberController.text.trim(),
              // username: usernameController.text.trim(),
              password: passwordController.text.trim(),
              type: socialMediaType.manuel.toString())
          .then((_) {});
    }
  }

  void updateWidget() {
    buildValidationList(passwordController);
    buildValidationList(confirmPasswordController);
    authController.update();
  }

  @override
  void dispose() {
    // passwordFocusNode.dispose();
    confirmPasswordController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

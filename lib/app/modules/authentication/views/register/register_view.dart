import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';
import 'package:go_burble_new/app/data/app_images.dart';
import 'package:go_burble_new/app/modules/authentication/controllers/auth_controller.dart';
import 'package:go_burble_new/app/routes/app_pages.dart';
import 'package:go_burble_new/app/widgets/custom_drop_down_form_field.dart';

import '../../../../data/text_styles.dart';
import '../../../../data/utils.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_snackbar.dart';
import '../../../../widgets/custom_text_form_field.dart';
import 'package:flutter/services.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: Get.find<AuthController>(),
        builder: (controller) {
          return GestureDetector(
            onTap: () {},
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 10),
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Align(
                                      alignment: Alignment.topLeft,
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: AppColors.appBackgroundColor,
                                      )),
                                ),
                              ),
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
                                        "signUpTitle".tr,
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
                                          "signUpSubTitle".tr,
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
                                child: Form(
                                  key: authController.globalFormKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text("name".tr,
                                            style:
                                                sfProMediumTextstyle.copyWith(
                                              color:
                                                  AppColors.appWhiteGreyColor2,
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: CustomTextFormField(
                                          textInputAction: TextInputAction.next,
                                          width: kWidth * 0.8,
                                          hintText: "name".tr,
                                          borderRadiusAll:
                                              const BorderRadius.all(
                                                  Radius.circular(12)),
                                          focusNode:
                                              authController.nameFocusNode,
                                          controller:
                                              authController.nameController,
                                          fillColor:
                                              AppColors.appBackgroundColor,
                                          borderColor: authController
                                                  .nameFocusNode.hasFocus
                                              ? AppColors.primaryColor
                                              : AppColors.appWhiteGreyColor,
                                          validator: (string) {
                                            if (string == null ||
                                                string.isEmpty) {
                                              return "nameIsRequired".tr;
                                            }
                                            return null;
                                          },
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text("gender".tr,
                                            style:
                                                sfProMediumTextstyle.copyWith(
                                              color:
                                                  AppColors.appWhiteGreyColor2,
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: CustomDropDownFormField(
                                          textInputAction: TextInputAction.next,
                                          width: kWidth * 0.8,
                                          hintText: "gender".tr,
                                          borderRadiusAll:
                                              const BorderRadius.all(
                                                  Radius.circular(12)),
                                          focusNode:
                                              authController.genderFocusNode,
                                          controller:
                                              authController.genderController,
                                          fillColor:
                                              AppColors.appBackgroundColor,
                                          items: ['Male', 'Female']
                                              .map((option) => DropdownMenuItem(
                                                    value: option,
                                                    child: Text(option),
                                                  ))
                                              .toList(),
                                          onChanged: (value) {
                                            authController.genderController
                                                .text = value.toString();
                                          },
                                          borderColor: authController
                                                  .genderFocusNode.hasFocus
                                              ? AppColors.primaryColor
                                              : AppColors.appWhiteGreyColor,
                                          validator: (string) {
                                            if (string == null) {
                                              return "genderIsRequired".tr;
                                            }
                                            return null;
                                          },
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text("email".tr,
                                            style:
                                                sfProMediumTextstyle.copyWith(
                                              color:
                                                  AppColors.appWhiteGreyColor2,
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 5,
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
                                          borderRadiusAll:
                                              const BorderRadius.all(
                                                  Radius.circular(12)),
                                          focusNode:
                                              authController.emailFocusNode,
                                          controller:
                                              authController.emailController,
                                          fillColor:
                                              AppColors.appBackgroundColor,
                                          borderColor: authController
                                                  .emailFocusNode.hasFocus
                                              ? AppColors.primaryColor
                                              : AppColors.appWhiteGreyColor,
                                          validator: validateEmail,
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text("phone".tr,
                                            style:
                                                sfProMediumTextstyle.copyWith(
                                              color:
                                                  AppColors.appWhiteGreyColor2,
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: CustomTextFormField(
                                          textInputAction: TextInputAction.next,
                                          width: kWidth * 0.8,
                                          keyboardType: TextInputType.number,
                                          hintText: "phone".tr,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                              RegExp(
                                                  r'\+?[0-9]*'), // allow digits, spaces, +, -, (, )
                                            ),
                                          ],
                                          borderRadiusAll:
                                              const BorderRadius.all(
                                                  Radius.circular(12)),
                                          focusNode:
                                              authController.phoneFocusNode,
                                          controller:
                                              authController.phoneController,
                                          fillColor:
                                              AppColors.appBackgroundColor,
                                          borderColor: authController
                                                  .phoneFocusNode.hasFocus
                                              ? AppColors.primaryColor
                                              : AppColors.appWhiteGreyColor,
                                          validator: validatePhone,
                                          onFieldSubmitted: (value) {},
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text("password".tr,
                                            style:
                                                sfProMediumTextstyle.copyWith(
                                              color:
                                                  AppColors.appWhiteGreyColor2,
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                          child: CustomTextFormField(
                                        hintText: "password".tr,
                                        width: kWidth * 0.8,
                                        focusNode: authController
                                            .registerpasswordFocusNode,
                                        borderRadiusAll: const BorderRadius.all(
                                            Radius.circular(12)),
                                        controller: authController
                                            .registerpasswordController,
                                        fillColor: AppColors.appBackgroundColor,
                                        borderColor: authController
                                                .registerpasswordFocusNode
                                                .hasFocus
                                            ? AppColors.primaryColor
                                            : AppColors.appWhiteGreyColor,
                                        onFieldSubmitted: (val) {
                                          RegisterSubmit();
                                        },
                                        validator: validatePassword,
                                        suffixIcon: GestureDetector(
                                          onTap: () async {
                                            authController
                                                    .isLoginPasswordObscureText
                                                    .value =
                                                !authController
                                                    .isLoginPasswordObscureText
                                                    .value;
                                          },
                                          child: Icon(
                                            authController
                                                    .isLoginPasswordObscureText
                                                    .value
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                        obscureText: authController
                                            .isLoginPasswordObscureText.value,
                                      )),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SizedBox(
                                            height: 19,
                                            width: 19,
                                            child: Checkbox(
                                                activeColor:
                                                    AppColors.primaryColor,
                                                checkColor: AppColors
                                                    .appBackgroundColor,
                                                value: authController
                                                    .isTermsCondition.value,
                                                onChanged: (value) {
                                                  authController
                                                      .isTermsCondition(value);
                                                  if (value == true) {
                                                    RegisterSubmit();
                                                  }
                                                }),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text("agreeWith".tr,
                                              style:
                                                  sfProMediumTextstyle.copyWith(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 12)),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text("termsCondition".tr,
                                              style:
                                                  sfProMediumTextstyle.copyWith(
                                                      color: AppColors
                                                          .appWhiteGreyColor2,
                                                      fontSize: 12,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor: AppColors
                                                          .appWhiteGreyColor2)),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  Routes.FORGOT_PASSWORD);
                                            },
                                            child: Text(
                                              "forgotPassword".tr,
                                              style: sfProSemiBoldTextstyle
                                                  .copyWith(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontSize: 12),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: CustomButton(
                                          onPressed: () => RegisterSubmit(),
                                          height: 50,
                                          width: kWidth * 0.8,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          bgColor: AppColors.primaryColor,
                                          childWidget: Center(
                                              child: Text("signUp".tr,
                                                  style: sfProMediumTextstyle
                                                      .copyWith(fontSize: 16))),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "alreadyHaveAccount".tr,
                                            style:
                                                sfProMediumTextstyle.copyWith(
                                                    color: AppColors
                                                        .appWhiteGreyColor2),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                Get.toNamed(Routes.LOGIN);
                                              },
                                              child: Text(
                                                "signIn".tr,
                                                style: sfProSemiBoldTextstyle
                                                    .copyWith(
                                                        color: AppColors
                                                            .primaryColor),
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
                        ),
                      ],
                    ),
                  );
                },
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
    bool formkey = authController.globalFormKey.currentState!.validate();

    if (formkey) {
      ///login endpoint

      if (authController.isTermsCondition.value != true) {
        CustomSnackBar.errorSnackBar(message: "termsRequired".tr);
      } else {
        await authController.register_new_account().then((val) {});
      }
    }
  }
}

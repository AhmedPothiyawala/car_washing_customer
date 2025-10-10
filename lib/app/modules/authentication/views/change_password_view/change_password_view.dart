import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';

import '../../../../data/app_images.dart';
import '../../../../data/text_styles.dart';
import '../../../../data/utils.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../controllers/auth_controller.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final authController = Get.find<AuthController>();

  final args = Get.arguments as Map;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (val1, val2) {
        Get.toNamed(Routes.LOGIN);
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.LOGIN);
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
                                  "changePasswordTitle".tr,
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
                                    "changePasswordSubTitle".tr,
                                    style: sfProMediumTextstyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: kWidth * 0.9,
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "changePasswordSubTitle2".tr,
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
                            key: authController.changeglobalFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text("password".tr,
                                      style: sfProMediumTextstyle.copyWith(
                                        color: AppColors.appWhiteGreyColor2,
                                      )),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Center(
                                    child: CustomTextFormField(
                                  hintText: "password".tr,
                                  width: kWidth * 0.8,
                                  focusNode:
                                      authController.changepasswordFocusNode,
                                  borderRadiusAll: const BorderRadius.all(
                                      Radius.circular(12)),
                                  controller:
                                      authController.changepasswordController,
                                  fillColor: AppColors.appBackgroundColor,
                                  borderColor: authController
                                          .changepasswordFocusNode.hasFocus
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
                                )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text("confirmPassword".tr,
                                      style: sfProMediumTextstyle.copyWith(
                                        color: AppColors.appWhiteGreyColor2,
                                      )),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Center(
                                    child: CustomTextFormField(
                                  hintText: "confirmPassword".tr,
                                  onFieldSubmitted: (val) {
                                    submit();
                                  },
                                  width: kWidth * 0.8,
                                  focusNode: authController
                                      .changeconfirmPasswordFocusNode,
                                  borderRadiusAll: const BorderRadius.all(
                                      Radius.circular(12)),
                                  controller: authController
                                      .changeconfirmPasswordController,
                                  fillColor: AppColors.appBackgroundColor,
                                  borderColor: authController
                                          .changeconfirmPasswordFocusNode
                                          .hasFocus
                                      ? AppColors.primaryColor
                                      : AppColors.appWhiteGreyColor,
                                  validator: (value) => validateConfirmPassword(
                                      value,
                                      authController
                                          .changepasswordController.text),
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
                                Center(
                                  child: CustomButton(
                                    onPressed: () => submit(),
                                    height: 50,
                                    width: kWidth * 0.8,
                                    borderRadius: BorderRadius.circular(12),
                                    bgColor: AppColors.primaryColor,
                                    childWidget: Center(
                                        child: Text("createNewPassword".tr,
                                            style: sfProMediumTextstyle
                                                .copyWith(fontSize: 16))),
                                  ),
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
  }

  Future<void> submit() async {
    bool formkey = authController.changeglobalFormKey.currentState!.validate();

    if (formkey) {
      authController.change_password(
        username: args['username'],
      );
    }
  }
}

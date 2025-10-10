import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';
import 'package:go_burble_new/app/data/app_images.dart';
import 'package:go_burble_new/app/modules/authentication/controllers/auth_controller.dart';

import '../../../../data/text_styles.dart';
import '../../../../data/utils.dart';
import '../../../../widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

import '../../../../widgets/custom_snackbar.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});

  final authController = Get.find<AuthController>();

  final args = Get.arguments as Map;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: kHeight * 0.35,
                width: kWidth,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.mainBg), fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
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
                              "otpTitle".tr,
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
                                "otpSubTitle".tr,
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
                        key: authController.otpFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 64,
                              width: 64,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          AppImages.otpMobileImage))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text("verifyCode".tr,
                                style: sfProBoldTextstyle.copyWith(
                                    color: AppColors.blackColor, fontSize: 18)),
                            const SizedBox(
                              height: 20,
                            ),
                            Text("otpSubTitle2".tr,
                                style: sfProMediumTextstyle.copyWith(
                                    color: AppColors.blackColor, fontSize: 12)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(args['username'],
                                style: sfProMediumTextstyle.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 12)),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Pinput(
                                  length: 6,
                                  controller: authController.otpController,
                                  keyboardType: TextInputType.number,
                                  // The main style for all pin fields
                                  defaultPinTheme: PinTheme(
                                    width: 50,
                                    height: 50,
                                    textStyle: sfProBoldTextstyle.copyWith(
                                        color: AppColors.appBlackColor,
                                        fontSize: 16),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: AppColors.appWhiteGreyColor,
                                          width: 1),
                                    ),
                                  ),
                                  // The style for the currently selected (focused) pin field
                                  focusedPinTheme: PinTheme(
                                    width: 50,
                                    height: 50,
                                    textStyle: sfProBoldTextstyle.copyWith(
                                        color: AppColors.appBlackColor,
                                        fontSize: 16),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 1),
                                    ),
                                  ),
                                  // The style for pin fields that have been filled
                                  submittedPinTheme: PinTheme(
                                    width: 50,
                                    height: 50,
                                    textStyle: sfProBoldTextstyle.copyWith(
                                        color: AppColors.appBlackColor,
                                        fontSize: 16),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 1),
                                    ),
                                  ),
                                  closeKeyboardWhenCompleted: false,
                                  // Other properties you can set
                                  textInputAction: TextInputAction.done,
                                  cursor: const Text(
                                    '|',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  onCompleted: (value) {
                                    OtpSubmit();
                                  },
                                  onSubmitted: (value) {
                                    OtpSubmit();
                                  },
                                  onChanged: (value) {
                                    // You can add your onChanged logic here
                                  },
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: CustomButton(
                                onPressed: () => OtpSubmit(),
                                height: 50,
                                width: kWidth * 0.8,
                                borderRadius: BorderRadius.circular(12),
                                bgColor: AppColors.primaryColor,
                                childWidget: Center(
                                    child: Text("Verify".tr,
                                        style: sfProMediumTextstyle.copyWith(
                                            fontSize: 16))),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(() {
                              return authController.isResendOtpDisabled.value
                                  ? Center(
                                      child: Text(
                                        authController.resendOtpTimer.value
                                            .toString(),
                                        style: sfProSemiBoldTextstyle.copyWith(
                                            color: AppColors.primaryColor),
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "notReceiveTheOtp".tr,
                                          style: sfProMediumTextstyle.copyWith(
                                              color:
                                                  AppColors.appWhiteGreyColor2),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                            onTap: () {
                                              authController.resend_otp(
                                                  username: args['username']);
                                            },
                                            child: Text(
                                              "resendOtp".tr,
                                              style: sfProSemiBoldTextstyle
                                                  .copyWith(
                                                      color: AppColors
                                                          .primaryColor),
                                            )),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    );
                            }),
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
        ));
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

  Future<void> OtpSubmit() async {
    if (authController.otpController.text.isEmpty) {
      CustomSnackBar.errorSnackBar(message: "otpRequired".tr);
    } else if (authController.otpController.text.length < 6) {
      CustomSnackBar.errorSnackBar(message: "otpLength".tr);
    } else {
      authController
          .validate_otp(
              username: args['username'],
              forgotpassword: args['forgotpassword'])
          .then((value) {});
    }
  }

  void updateWidget() {
    authController.update();
  }
}

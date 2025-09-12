
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';
import 'package:go_burble_new/app/data/app_images.dart';
import 'package:go_burble_new/app/modules/authentication/controllers/auth_controller.dart';
import 'package:go_burble_new/app/routes/app_pages.dart';

import '../../../../data/text_styles.dart';
import '../../../../data/utils.dart';
import '../../../../widgets/custom_button.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final authController = Get.find<AuthController>();
  final otpController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  // final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final nameFocusNode = FocusNode();
  final genderFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final usernmaeFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final globalFormKey = GlobalKey<FormState>();
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {},
        child: Scaffold(
            backgroundColor: AppColors.secondaryColor,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: kHeight * 0.3,
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
                          padding: const EdgeInsets.only(left: 20.0),
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
                          height: 20,
                        ),
                        Text(
                          "otpTitle".tr,
                          style: sfProBoldTextstyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "otpSubTitle".tr,
                          style: sfProMediumTextstyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: kHeight * 0.25),
                    child: Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: kWidth * 0.9,
                          decoration: BoxDecoration(
                              color: AppColors.appBackgroundColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Form(
                            key: globalFormKey,
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
                                        color: AppColors.blackColor,
                                        fontSize: 18)),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text("otpSubTitle2".tr,
                                    style: sfProMediumTextstyle.copyWith(
                                        color: AppColors.blackColor,
                                        fontSize: 12)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("+41 9090909090".tr,
                                    style: sfProMediumTextstyle.copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 12)),
                                const SizedBox(
                                  height: 20,
                                ),

                                ///  Otp pin Controller

                                Center(
                                  child: SizedBox(
                                    width: kWidth * 0.8,
                                    child: OtpPinField(
                                      ///in case you want to enable autoFill
                                      autoFillEnable: false,

                                      ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                                      textInputAction: TextInputAction.done,

                                      ///in case you want to change the action of keyboard
                                      /// to clear the Otp pin Controller
                                      onSubmit: (text) {
                                        /// return the entered pin
                                      },
                                      onChange: (text) {
                                        /// return the entered pin
                                      },
                                      onCodeChanged: (code) {},

                                      /// to decorate your Otp_Pin_Field
                                      otpPinFieldStyle: const OtpPinFieldStyle(
                                          fieldBorderRadius: 12,
                                          filledFieldBorderColor:
                                              AppColors.primaryColor,
                                          activeFieldBorderColor:
                                              AppColors.appWhiteGreyColor,
                                          defaultFieldBorderColor:
                                              AppColors.appWhiteGreyColor),
                                      maxLength: 4,

                                      /// no of pin field
                                      showCursor: true,

                                      /// bool to show cursor in pin field or not
                                      cursorColor: AppColors.primaryColor,

                                      ///bool which manage to show custom keyboard

                                      /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                                      // customKeyboard: Container(),
                                      ///bool which manage to show default OS keyboard
                                      // showDefaultKeyboard: true,

                                      /// to select cursor width

                                      /// place otp pin field according to yourself

                                      /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                                      ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                                      otpPinFieldDecoration:
                                          OtpPinFieldDecoration
                                              .defaultPinBoxDecoration,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: CustomButton(
                                    onPressed: () => RegisterSubmit(),
                                    height: 50,
                                    width: kWidth * 0.8,
                                    borderRadius: BorderRadius.circular(12),
                                    bgColor: AppColors.primaryColor,
                                    childWidget: Center(
                                        child: Text("Verify".tr,
                                            style: sfProMediumTextstyle
                                                .copyWith(fontSize: 16))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "notReceiveTheOtp".tr,
                                      style: sfProMediumTextstyle.copyWith(
                                          color: AppColors.appWhiteGreyColor2),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                        onTap: () {},
                                        child: Text(
                                          "resendOtp".tr,
                                          style:
                                              sfProSemiBoldTextstyle.copyWith(
                                                  color:
                                                      AppColors.primaryColor),
                                        )),
                                    const SizedBox(
                                      width: 20,
                                    ),
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
            )),
      ),
    );
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
      Get.toNamed(Routes.CHANGE_PASSWORD);
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';
// import 'package:go_burble_new/app/widgets/custom_button.dart';

import '../../../../data/app_images.dart';
import '../../../../data/text_styles.dart';
import '../../../../data/utils.dart';
// import '../../../../widgets/custom_text_form_field.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../controllers/auth_controller.dart';
import 'package:flutter/services.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final phoneController = TextEditingController();
  final authController = Get.find<AuthController>();
  final globalFormKey = GlobalKey<FormState>();
  final phoneFocusNode = FocusNode();
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.initState();
  }

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
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: kWidth * 0.9,
                        child: Column(
                          children: [
                            Text(
                              "forgotPasswordTitle".tr,
                              style: sfProBoldTextstyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: kWidth * 0.9,
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "forgotPasswordSubTitle".tr,
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
                                "forgotPasswordSubTitle2".tr,
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
                        key: globalFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text("phone".tr,
                                  style: sfProMediumTextstyle.copyWith(
                                    color: AppColors.appWhiteGreyColor2,
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
                                borderRadiusAll:
                                    const BorderRadius.all(Radius.circular(12)),
                                focusNode: phoneFocusNode,
                                controller: phoneController,
                                fillColor: AppColors.appBackgroundColor,
                                borderColor: phoneFocusNode.hasFocus
                                    ? AppColors.primaryColor
                                    : AppColors.appWhiteGreyColor,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'\+?[0-9\s\-()]*'),
                                  ),
                                ],
                                validator: validatePhone,
                                onFieldSubmitted: (value) {},
                              ),
                            ),
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
                                    child: Text("submit".tr,
                                        style: sfProMediumTextstyle.copyWith(
                                            fontSize: 16))),
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
        ));
  }

  Future<void> submit() async {
    bool isMobileValid = globalFormKey.currentState!.validate();

    if (isMobileValid) {
      authController.forgot_password(
          username: phoneController.text, forgotpassword: true);
    }
  }
}

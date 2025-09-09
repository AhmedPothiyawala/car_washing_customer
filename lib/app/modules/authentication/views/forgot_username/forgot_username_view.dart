import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';

import '../../../../data/app_images.dart';
import '../../../../data/text_styles.dart';
import '../../../../data/utils.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../controllers/auth_controller.dart';

class ForgotUsernameView extends StatefulWidget {
  const ForgotUsernameView({super.key});

  @override
  State<ForgotUsernameView> createState() => _ForgotUsernameViewState();
}

class _ForgotUsernameViewState extends State<ForgotUsernameView> {
  final authController = Get.find<AuthController>();
  final _emailController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final userFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, bottom: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: Image.asset(
                      AppImages.burbleNewLogo,
                      width: 200,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppColors.appLightColor,
                      border: Border.all(color: AppColors.whiteColor),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const Text(
                        "Please enter the email address associated with your account. We'll send you a link to retrieve your username.",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          color: AppColors.subtitleColor,
                          fontSize: 18,
                        ),
                      ),
                      Form(
                        key: emailFormKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: CustomTextFormField(
                            hintText: "email",

                            textInputAction: TextInputAction.done,
                            controller: _emailController,
                            fillColor: Colors.transparent,

                            hintStyle: const TextStyle(color: Colors.grey),
                            validator: (value) =>
                                validateEmail(_emailController.text),
                            onFieldSubmitted: (value) => submit(),
                            // textStyle: const TextStyle(color: AppColors.appBackgroundColor, decorationThickness: 0),
                          ),
                        ),
                      ),
                      CustomButton(
                        onPressed: () => submit(),
                        margin: const EdgeInsets.only(bottom: 20, top: 20),
                        padding: const EdgeInsets.only(
                            left: 30, top: 10, bottom: 10, right: 30),
                        borderRadius: BorderRadius.circular(20),
                        childWidget: Text(
                          "SUBMIT",
                          style: customButtonTextstyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submit() async {
    bool isEmailValid = emailFormKey.currentState!.validate();

    if (isEmailValid) {
      await authController
          .forgotUsername(
        email: _emailController.text.trim(),
      )
          .then((_) {
        userFocusNode.unfocus();
      });
    }
  }
}

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

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _emailController = TextEditingController();
  final authController = Get.find<AuthController>();
  final emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25, top: 20),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
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
                      child: Form(
                        key: emailFormKey,
                        child: Column(
                          children: [
                            const Text("Time to Reset Your Password",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.headingColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900)),
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                  "Oh no! It happens to the best of us. No worries, we've got your back. Please enter the email associated with your account, and we'll send you a link to rest your password.",
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.subtitleColor,
                                      fontSize: 16)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: CustomTextFormField(
                                hintText: "email",
                                controller: _emailController,
                                fillColor: Colors.transparent,
                                validator: (value) =>
                                    validateEmail(_emailController.text),
                                onFieldSubmitted: (value) => submit(),
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                            ),
                            CustomButton(
                              onPressed: () => submit(),
                              padding: const EdgeInsets.only(
                                  left: 30, top: 10, bottom: 10, right: 30),
                              borderRadius: BorderRadius.circular(20),
                              childWidget: Text(
                                "SEND",
                                style: customButtonTextstyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> submit() async {
    bool isEmailValid = emailFormKey.currentState!.validate();

    if (isEmailValid) {
      await authController
          .forgotPassword(
            email: _emailController.text.trim(),
          )
          .then((_) {});
    }
  }
}

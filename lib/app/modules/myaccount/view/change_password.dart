import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../data/app_colors.dart';
import '../../../data/text_styles.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/custom_button.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  final ValueNotifier<bool> oldPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> newPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> confirmPasswordVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
        surfaceTintColor: AppColors.appBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 44,
              width: 44,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteShadeTwo,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 22,
                    spreadRadius: 0,
                    color: AppColors.shadowWhiteColor,
                  )
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                "changePassword".tr,
                style: sfProSemiBoldTextstyle.copyWith(
                  fontSize: 18,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "Old Password".tr,
                  style: sfProMediumTextstyle.copyWith(
                    fontSize: 12,
                    color: AppColors.greyShadeFour,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              ValueListenableBuilder(
                valueListenable: oldPasswordVisible,
                builder: (context, value, _) {
                  return CustomTextFormField(
                    controller: oldPasswordController,
                    hintText: "••••••••",
                    obscureText: !value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        value
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        color: AppColors.blackColor,
                      ),
                      onPressed: () =>
                      oldPasswordVisible.value = !oldPasswordVisible.value,
                    ),
                    borderRadiusAll: BorderRadius.circular(12),
                    borderColor: AppColors.appWhiteGreyColor,
                    fillColor: Colors.white,
                  );
                },
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "New Password".tr,
                  style: sfProMediumTextstyle.copyWith(
                    fontSize: 12,
                    color: AppColors.greyShadeFour,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              ValueListenableBuilder(
                valueListenable: newPasswordVisible,
                builder: (context, value, _) {
                  return CustomTextFormField(
                    controller: newPasswordController,
                    hintText: "••••••••",
                    obscureText: !value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        value
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        color: AppColors.blackColor,
                      ),
                      onPressed: () =>
                      newPasswordVisible.value = !newPasswordVisible.value,
                    ),
                    borderRadiusAll: BorderRadius.circular(12),
                    borderColor: AppColors.appWhiteGreyColor,
                    fillColor: Colors.white,
                  );
                },
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "Confirm Password".tr,
                  style: sfProMediumTextstyle.copyWith(
                    fontSize: 12,
                    color: AppColors.greyShadeFour,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              ValueListenableBuilder(
                valueListenable: confirmPasswordVisible,
                builder: (context, value, _) {
                  return CustomTextFormField(
                    controller: confirmPasswordController,
                    hintText: "••••••••",
                    obscureText: !value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        value
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        color: AppColors.blackColor,
                      ),
                      onPressed: () => confirmPasswordVisible.value =
                      !confirmPasswordVisible.value,
                    ),
                    borderRadiusAll: BorderRadius.circular(12),
                    borderColor: AppColors.appWhiteGreyColor,
                    fillColor: Colors.white,
                  );
                },
              ),

              const SizedBox(height: 40),
              CustomButton(
                height: 50,
                width: double.infinity,
                borderRadius: BorderRadius.circular(12),
                bgColor: AppColors.primaryColor,
                childWidget: Center(
                  child: Text(
                    "updatePassword".tr,
                    style: sfProMediumTextstyle.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

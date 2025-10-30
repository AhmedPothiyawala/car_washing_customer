import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:go_burble_new/app/widgets/custom_button.dart";

import "../../data/app_colors.dart";
import "../../data/app_images.dart";
import "../../data/text_styles.dart";
import "../../data/utils.dart";
import "../../widgets/custom_text_form_field.dart";
import "../home/controllers/home_controller.dart";

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final homeController = Get.find<HomeControllers>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteShadeTwo,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 22,
                    spreadRadius: 0,
                    color:
                        AppColors.shadowColorShadeTwo.withValues(alpha: 0.11),
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
        title: Text(
          "editProfile".tr,
          style: sfProSemiBoldTextstyle.copyWith(
              fontSize: 18, color: AppColors.blackColor),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: SizedBox(
              height: 120,
              width: kWidth * 0.31,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: kWidth * 0.3,
                    width: kWidth * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greyShadeEleven,
                      border: Border.all(
                        color: AppColors.whiteShadeSix,
                      ),
                    ),
                    child: SvgPicture.asset(
                      AppImages.editProfileAccountIcon,
                      height: 50,
                      width: 45,
                    ),
                  ),
                  Positioned(
                    top: kWidth * 0.19,
                    left: kWidth * 0.21,
                    child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                                color: AppColors.blackColor
                                    .withValues(alpha: 0.25),
                              )
                            ]),
                        child: SvgPicture.asset(
                          AppImages.editProfileEditIcon,
                          height: 15,
                          width: 15,
                          fit: BoxFit.scaleDown,
                        )),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "name".tr,
                            style: sfProMediumTextstyle.copyWith(
                                fontSize: 12, color: AppColors.greyShadeFour),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFormField(
                          hintText: "richard".tr,
                          hintStyle: sfProMediumTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                          width: kWidth * 0.45,
                          borderRadiusAll:
                              const BorderRadius.all(Radius.circular(12)),
                          controller: homeController.nameController,
                          textInputAction: TextInputAction.next,
                          fillColor: AppColors.appBackgroundColor,
                          borderColor: AppColors.appWhiteGreyColor,
                          validator: (string) {
                            if (string == null || string.isEmpty) {
                              return "enterName".tr;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "surName".tr,
                            style: sfProMediumTextstyle.copyWith(
                                fontSize: 12, color: AppColors.greyShadeFour),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFormField(
                          hintText: "mendoza".tr,
                          hintStyle: sfProMediumTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                          width: kWidth * 0.45,
                          borderRadiusAll:
                              const BorderRadius.all(Radius.circular(12)),
                          controller: homeController.surNameController,
                          textInputAction: TextInputAction.next,
                          fillColor: AppColors.appBackgroundColor,
                          borderColor: AppColors.appWhiteGreyColor,
                          validator: (string) {
                            if (string == null || string.isEmpty) {
                              return "enterName".tr;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    "name".tr,
                    style: sfProMediumTextstyle.copyWith(
                        fontSize: 12, color: AppColors.greyShadeFour),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextFormField(
                  hintText: "emailIs".tr,
                  hintStyle: sfProMediumTextstyle.copyWith(
                      fontSize: 14, color: AppColors.blackColor),
                  width: kWidth,
                  borderRadiusAll: const BorderRadius.all(Radius.circular(12)),
                  controller: homeController.nameController,
                  textInputAction: TextInputAction.next,
                  fillColor: AppColors.appBackgroundColor,
                  borderColor: AppColors.appWhiteGreyColor,
                  validator: (string) {
                    if (string == null || string.isEmpty) {
                      return "enterName".tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "phone".tr,
                        style: sfProMediumTextstyle.copyWith(
                            fontSize: 12, color: AppColors.greyShadeFour),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.appWhiteGreyColor,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 8),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: SvgPicture.asset(
                                    AppImages.flagImage,
                                    height: 16,
                                    width: 22,
                                  ),
                                ),
                                Text(
                                  "countryCode".tr,
                                  style: sfProMediumTextstyle.copyWith(
                                    fontSize: 12,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.greyShadeFive,
                                ),
                                const SizedBox(width: 2),
                                CustomTextFormField(
                                  hintText: "phoneNumber".tr,
                                  contentPadding: EdgeInsets.zero,
                                  width: kWidth * 0.5,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'\+?[0-9\s\-()]*'),
                                    ),
                                  ],
                                  keyboardType: TextInputType.number,
                                  hintStyle: sfProMediumTextstyle.copyWith(
                                      fontSize: 14,
                                      color: AppColors.blackColor),
                                  borderRadiusAll: const BorderRadius.all(
                                      Radius.circular(0)),
                                  controller: homeController.phoneController,
                                  textInputAction: TextInputAction.next,
                                  fillColor: AppColors.appBackgroundColor,
                                  borderColor: AppColors.appBackgroundColor,
                                  validator: (string) {
                                    if (string == null || string.isEmpty) {
                                      return "enterName".tr;
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "dob".tr,
                            style: sfProMediumTextstyle.copyWith(
                                fontSize: 12, color: AppColors.greyShadeFour),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFormField(
                          hintText: "dd/mm/yy".tr,
                          hintStyle: sfProMediumTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                          width: kWidth * 0.45,
                          borderRadiusAll:
                          const BorderRadius.all(Radius.circular(12)),
                          controller: homeController.nameController,
                          textInputAction: TextInputAction.next,
                          fillColor: AppColors.appBackgroundColor,
                          borderColor: AppColors.appWhiteGreyColor,
                          validator: (string) {
                            if (string == null || string.isEmpty) {
                              return "enterName".tr;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "gender".tr,
                            style: sfProMediumTextstyle.copyWith(
                                fontSize: 12, color: AppColors.greyShadeFour),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFormField(
                          hintText: "mendoza".tr,
                          hintStyle: sfProMediumTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                          width: kWidth * 0.45,
                          borderRadiusAll:
                          const BorderRadius.all(Radius.circular(12)),
                          controller: homeController.surNameController,
                          textInputAction: TextInputAction.next,
                          fillColor: AppColors.appBackgroundColor,
                          borderColor: AppColors.appWhiteGreyColor,
                          validator: (string) {
                            if (string == null || string.isEmpty) {
                              return "enterName".tr;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                CustomButton(
                  height: 50,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(12),
                  bgColor: AppColors.primaryColor,
                  childWidget: Center(
                    child: Text(
                      "continueBooking".tr,
                      style: sfProMediumTextstyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../data/utils.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_drop_down_form_field.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../home/controllers/home_controller.dart';

class CustomerDetailView extends StatelessWidget {
  CustomerDetailView({super.key});

  bool isChecked = false;

  final globalFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final surNameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final remarkController = TextEditingController();

  final companyName = TextEditingController();

  final supplementController = TextEditingController();

  final streetNumberController = TextEditingController();

  final placeController = TextEditingController();

  final addressController = TextEditingController();

  final cantonController = TextEditingController();

  final postalCodeController = TextEditingController();

  final landController = TextEditingController();

  final dispatcherNameController = TextEditingController();

  final dispatcherPhoneController = TextEditingController();

  final orderNumberController = TextEditingController();

  final customerNameController = TextEditingController();

  final customerPhoneController = TextEditingController();

  final homeController = Get.find<HomeControllers>();
  final args = Get.arguments as Map;

  @override
  Widget build(BuildContext context) {
    final navBarHeight = MediaQuery.of(context).viewPadding.bottom;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColors.appBackgroundColor,
        title: Obx(() {
          return Text(
            homeController.isPickMeUp.value
                ? "bookPickMeUp".tr
                : "bookPickUpMyCar".tr,
            style: poppinsSemiboldTextstyle.copyWith(
                fontSize: 18, color: AppColors.blackColor),
          );
        }),
        centerTitle: true,
        backgroundColor: AppColors.appBackgroundColor,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteShadeTwo,
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.blackColor,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: navBarHeight>0&&isKeyboardOpen==false?navBarHeight:0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: kWidth * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.skyShadeTwo,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${DateFormat("EEEE, MMM d").format(DateFormat("dd/MM/yyyy").parse(args['booking_date']))} at ${DateFormat("h:mm a").format(DateFormat("HH:mm").parse(args['booking_time']))}",
                            style: sfProSemiBoldTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackShadeTwo),
                          ),
                          const Spacer(),
                          Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.skyShadeOne,
                              ),
                              child: SvgPicture.asset(
                                AppImages.carIcon,
                                fit: BoxFit.scaleDown,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.blackColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: kWidth*0.7,
                            child: Text(
                              args['pickup'].text,
                              style: sfProMediumTextstyle.copyWith(
                                  color: AppColors.blackColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero, itemBuilder: (BuildContext context, int index) {
                        return args['drop'][index].text!="" ?

                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.primaryColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: kWidth*0.7,
                              child: Text(
                                args['drop'][index].text,
                                style: sfProMediumTextstyle.copyWith(
                                    color: AppColors.blackColor),
                              ),
                            ),
                          ],
                        ):const SizedBox();
                      }, separatorBuilder: (BuildContext context, int index) {
                        return  const SizedBox(
                          height: 5,
                        );
                      }, itemCount: args['drop'].length,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "estArrivalTime".tr,
                            style: sfProMediumTextstyle.copyWith(
                                color: AppColors.blackColor),
                          ),
                          SvgPicture.asset(
                            AppImages.errorIcon,
                            height: 15,
                            width: 15,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: AppColors.skyShadeOne,
                        indent: 15,
                        endIndent: 15,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "totalAmount".tr,
                            style: sfProMediumTextstyle.copyWith(
                                color: AppColors.blackShadeTwo),
                          ),
                          const Spacer(),
                          Text(
                            double.tryParse(
                              homeController.getCalculatedPriceData.value.data![homeController.isselectedCar.value].baseRateWithOurFees.toString(),
                            )!.toStringAsFixed(2),
                            style: sfProMediumTextstyle.copyWith(
                                color: AppColors.blackShadeTwo),
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "customerDetail".tr,
                      style: sfProSemiBoldTextstyle.copyWith(
                          fontSize: 18, color: AppColors.blackColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "name".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            hintText: "john".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                            width: kWidth * 0.45,
                            borderRadiusAll:
                                const BorderRadius.all(Radius.circular(12)),
                            controller: nameController,
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
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            hintText: "doe".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                            width: kWidth * 0.45,
                            borderRadiusAll:
                                const BorderRadius.all(Radius.circular(12)),
                            controller: surNameController,
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
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "email".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            hintText: "emailIs".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                            width: kWidth * 0.45,
                            borderRadiusAll:
                                const BorderRadius.all(Radius.circular(12)),
                            controller: emailController,
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
                              "phone".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackShadeTwo),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 80,
                                width: kWidth * 0.45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.appWhiteGreyColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
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
                                          color: AppColors.blackColor),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColors.greyShadeFive,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    CustomTextFormField(
                                      hintText: "phoneNumber".tr,
                                      contentPadding: EdgeInsets.zero,
                                      width: kWidth * 0.25,
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
                                      controller: phoneController,
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
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "remark".tr,
                      style: sfProMediumTextstyle.copyWith(
                          fontSize: 12, color: AppColors.blackColor),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.appBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color:
                                AppColors.greyShadeSix.withValues(alpha: 0.24),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: CustomTextFormField(
                        hintText: "remarkParagraph".tr,
                        hintStyle: sfProMediumTextstyle.copyWith(
                            fontSize: 14, color: AppColors.blackColor),
                        width: kWidth * 0.9,
                        maxLines: 2,
                        borderRadiusAll:
                            const BorderRadius.all(Radius.circular(12)),
                        controller: remarkController,
                        fillColor: AppColors.appBackgroundColor,
                        borderColor: AppColors.appWhiteGreyColor,
                        validator: (string) {
                          if (string == null || string.isEmpty) {
                            return "enterName".tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                          height: 18,
                          width: 18,
                          child: Checkbox(
                            value: false,
                            onChanged: (val) {},
                            checkColor: AppColors.primaryColor,
                            side: const BorderSide(
                                color: AppColors.primaryColor, width: 1),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "billingAddress".tr,
                        style: sfProMediumTextstyle.copyWith(
                            fontSize: 14, color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "companyName".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            hintText: "pickUpMyCarGmbh".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                            width: kWidth * 0.45,
                            borderRadiusAll:
                                const BorderRadius.all(Radius.circular(12)),
                            controller: companyName,
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
                              "supplement".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            hintText: "staldenBachStrasse".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                            width: kWidth * 0.45,
                            borderRadiusAll:
                                const BorderRadius.all(Radius.circular(12)),
                            controller: supplementController,
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
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "streetNumber".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            hintText: "streetNumberIs".tr,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'\+?[0-9\s\-()]*'),
                              ),
                            ],
                            keyboardType: TextInputType.number,
                            hintStyle: sfProMediumTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                            width: kWidth * 0.45,
                            borderRadiusAll:
                                const BorderRadius.all(Radius.circular(12)),
                            controller: streetNumberController,
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
                              "place".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            hintText: "staldenBachStrasse".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                            width: kWidth * 0.45,
                            borderRadiusAll:
                                const BorderRadius.all(Radius.circular(12)),
                            controller: placeController,
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
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "addressText".tr,
                      style: sfProMediumTextstyle.copyWith(
                          fontSize: 14, color: AppColors.blackColor),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: CustomTextFormField(
                      hintText: "addresssStaldenbachstrasse".tr,
                      hintStyle: sfProMediumTextstyle.copyWith(
                          fontSize: 14, color: AppColors.blackColor),
                      width: kWidth * 0.9,
                      borderRadiusAll:
                          const BorderRadius.all(Radius.circular(12)),
                      controller: addressController,
                      fillColor: AppColors.appBackgroundColor,
                      borderColor: AppColors.appWhiteGreyColor,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.greyShadeOne),
                          child: Center(
                            child: Container(
                              height: 22,
                              width: 22,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage(AppImages.shapeTargetIcon)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      validator: (string) {
                        if (string == null || string.isEmpty) {
                          return "enterName".tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "canton".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            hintText: "pfäffikonSZ".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                            width: kWidth * 0.45,
                            borderRadiusAll:
                                const BorderRadius.all(Radius.circular(12)),
                            controller: cantonController,
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
                              "postalCode".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            hintText: "postalCodeIs".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                            width: kWidth * 0.45,
                            borderRadiusAll:
                                const BorderRadius.all(Radius.circular(12)),
                            controller: postalCodeController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'\+?[0-9\s\-()]*'),
                              ),
                            ],
                            keyboardType: TextInputType.number,
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
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "land".tr,
                      style: sfProMediumTextstyle.copyWith(
                          fontSize: 14, color: AppColors.blackColor),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.appBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color:
                                AppColors.greyShadeSix.withValues(alpha: 0.24),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: CustomDropDownFormField(
                        hintStyle: sfProMediumTextstyle.copyWith(
                            fontSize: 14, color: AppColors.blackColor),
                        textInputAction: TextInputAction.next,
                        width: kWidth * 0.9,
                        hintText: "switzerland".tr,
                        borderRadiusAll:
                            const BorderRadius.all(Radius.circular(12)),
                        fillColor: AppColors.appBackgroundColor,
                        items: ['Switzerland']
                            .map((option) => DropdownMenuItem(
                                  value: option,
                                  child: Text(option),
                                ))
                            .toList(),
                        onChanged: (value) {
                          landController.text=value.toString();
                        },
                        borderColor: AppColors.appWhiteGreyColor,
                        controller: landController,
                        validator: (string) {
                          if (string == null) {
                            return "genderIsRequired".tr;
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "dispatcherDetail".tr,
                      style: sfProSemiBoldTextstyle.copyWith(
                          fontSize: 16, color: AppColors.blackColor),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "dispatcherName".tr,
                      style: sfProMediumTextstyle.copyWith(
                          fontSize: 12, color: AppColors.blackColor),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: CustomTextFormField(
                      hintText: "dispatcherNameIs".tr,
                      hintStyle: sfProMediumTextstyle.copyWith(
                          fontSize: 14, color: AppColors.blackColor),
                      width: kWidth * 0.9,
                      borderRadiusAll:
                          const BorderRadius.all(Radius.circular(12)),
                      controller: dispatcherNameController,
                      fillColor: AppColors.appBackgroundColor,
                      borderColor: AppColors.appWhiteGreyColor,
                      validator: (string) {
                        if (string == null || string.isEmpty) {
                          return "enterName".tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "dispatcherPhone".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackShadeTwo),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 55,
                                width: kWidth * 0.45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.appWhiteGreyColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
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
                                          color: AppColors.blackColor),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColors.greyShadeFive,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    CustomTextFormField(
                                      hintText: "phoneNumber".tr,
                                      contentPadding: EdgeInsets.zero,
                                      width: kWidth * 0.25,
                                      hintStyle: sfProMediumTextstyle.copyWith(
                                          fontSize: 14,
                                          color: AppColors.blackColor),
                                      borderRadiusAll: const BorderRadius.all(
                                          Radius.circular(0)),
                                      controller: dispatcherPhoneController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'\+?[0-9\s\-()]*'),
                                        ),
                                      ],
                                      keyboardType: TextInputType.number,
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
                            ],
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
                              "orderNumber".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            hintText: "oneToNine".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                            width: kWidth * 0.45,
                            borderRadiusAll:
                                const BorderRadius.all(Radius.circular(12)),
                            controller: orderNumberController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'\+?[0-9\s\-()]*'),
                              ),
                            ],
                            keyboardType: TextInputType.number,
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
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "customerDetail".tr,
                      style: sfProSemiBoldTextstyle.copyWith(
                          fontSize: 16, color: AppColors.blackColor),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "customerName".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            hintText: "dispatcherNameIs".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                            width: kWidth * 0.45,
                            borderRadiusAll:
                                const BorderRadius.all(Radius.circular(12)),
                            controller: customerNameController,
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
                              "phone".tr,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackShadeTwo),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 55,
                            width: kWidth * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.appWhiteGreyColor,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
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
                                      color: AppColors.blackColor),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.greyShadeFive,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                CustomTextFormField(
                                  hintText: "phoneNumber".tr,
                                  contentPadding: EdgeInsets.zero,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'\+?[0-9\s\-()]*'),
                                    ),
                                  ],
                                  keyboardType: TextInputType.number,
                                  width: kWidth * 0.25,
                                  hintStyle: sfProMediumTextstyle.copyWith(
                                      fontSize: 14,
                                      color: AppColors.blackColor),
                                  borderRadiusAll: const BorderRadius.all(
                                      Radius.circular(0)),
                                  controller: customerPhoneController,
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
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        if(nameController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "nameValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(surNameController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "surNameValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(emailController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "emailValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(phoneController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "phoneValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(remarkController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "remarkValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(companyName.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "companyNameValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(supplementController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "supplementValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(streetNumberController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "streetNoValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(placeController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "placeValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(addressController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "addressValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(cantonController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "cantonValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(postalCodeController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "postalCodeValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(landController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "landValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(dispatcherNameController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "dispatcherNameValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(dispatcherPhoneController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "dispatcherPhoneValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(orderNumberController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "orderNumberValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(customerNameController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "customerNameValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else if(customerPhoneController.text.isEmpty)
                        {
                          CustomSnackBar.errorSnackBar(message: "customerPhoneValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                        }
                        else{
                          homeController.confirmbooking(args['service'],args['transfer_type'], args['booking_date'], args['booking_time'], args['pickuplat'], args['droplat'], nameController.text, surNameController.text,emailController.text, phoneController.text, remarkController.text, dispatcherNameController.text, customerNameController.text, customerPhoneController.text, companyName.text, supplementController.text, streetNumberController.text, placeController.text, addressController.text, cantonController.text, postalCodeController.text, landController.text, dispatcherPhoneController.text, orderNumberController.text);
                        }

                      },
                      height: 50,
                      width: kWidth * 0.9,
                      borderRadius: BorderRadius.circular(12),
                      bgColor: AppColors.primaryColor,
                      childWidget: Center(
                          child: Text("bookingOverView".tr,
                              style:
                                  sfProMediumTextstyle.copyWith(fontSize: 16))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

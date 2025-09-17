import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/utils.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class CancelBookingView extends StatefulWidget {
  const CancelBookingView({super.key});

  @override
  State<CancelBookingView> createState() => _CancelBookingViewState();
}

class _CancelBookingViewState extends State<CancelBookingView> {

  final cancelBookingRemarkController = TextEditingController();

 int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.transparent,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Row(
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
                        Icons.close,
                        color: AppColors.blackColor,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: kHeight,
        width: kWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages
              .cancelBookingImage),fit: BoxFit.fill)
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: kWidth,
            decoration: const BoxDecoration(
                color: AppColors.appBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  topLeft: Radius.circular(18),
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        "cancelBooking".tr,
                        textAlign: TextAlign.center,
                        style: sfProSemiBoldTextstyle.copyWith(fontSize: 18),
                      ),
                      const Spacer(),
                      Text(
                        "skip".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,
                            color: AppColors.blackColor),

                      ),
                      const SizedBox(width: 10,)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: kWidth * 0.95,
                      child: Text(
                        "selectReasonForCancel".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 16,color:
                        AppColors.blackShadeFour),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                          value: 1,
                      activeColor: AppColors.blackColor,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "scheduleChange".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,
                            color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 2,
                        activeColor: AppColors.blackColor,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "bookAnotherCar".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,
                            color: AppColors.blackColor),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 3,
                        activeColor: AppColors.blackColor,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "foundBetterAlternative".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,
                            color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 4,
                        activeColor: AppColors.blackColor,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "myReasonIsNotListed".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,
                            color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 5,
                        activeColor: AppColors.blackColor,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "wantToBookAnotherCar".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,
                            color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 6,
                        activeColor: AppColors.blackColor,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "other".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,
                            color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "remark".tr,
                    style: sfProMediumTextstyle.copyWith(
                        fontSize: 12, color: AppColors.greyShadeFour),
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
                        controller: cancelBookingRemarkController,
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
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        Get.toNamed(Routes.RIDE_SUCCESS_VIEW);
                      },
                      height: 50,
                      width: kWidth * 0.9,
                      borderRadius: BorderRadius.circular(12),
                      bgColor: AppColors.redColor,
                      childWidget: Center(
                          child: Text("continueBooking".tr,
                              style: sfProMediumTextstyle.copyWith(fontSize: 16))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/utils.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../home/controllers/home_controller.dart';

class CancelBookingView extends StatefulWidget {
  const CancelBookingView({super.key});

  @override
  State<CancelBookingView> createState() => _CancelBookingViewState();
}

class _CancelBookingViewState extends State<CancelBookingView> {
  final cancelBookingRemarkController = TextEditingController();
  final homeController = Get.find<HomeControllers>();

  final int _value = 1;
  List cancelreasons=["scheduleChange".tr,"bookAnotherCar".tr,"foundBetterAlternative".tr,"myReasonIsNotListed".tr,"wantToBookAnotherCar".tr,"other".tr,];
  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final navBarHeight = MediaQuery.of(context).viewPadding.bottom;
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
            image: DecorationImage(
                image: AssetImage(AppImages.cancelBookingImage),
                fit: BoxFit.fill)),
      ),
      bottomNavigationBar: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

        child: Column(
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
                padding: const EdgeInsets.only(left: 12.0, right: 12),
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
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                        ),
                        const SizedBox(
                          width: 10,
                        )
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
                          style: sfProMediumTextstyle.copyWith(
                              fontSize: 16, color: AppColors.blackShadeFour),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
        
                      itemBuilder: (BuildContext context, int index) {
                      return   Obx(
            () {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: index+1,
                                activeColor: AppColors.blackColor,
                                groupValue: homeController.groupvalue.value,
                                onChanged: (value) {
                                  homeController.groupvalue(value);
                                 homeController.cancelreson(cancelreasons[index]);
        
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                cancelreasons[index],
                                style: sfProRegularTextstyle.copyWith(
                                    fontSize: 14, color: AppColors.blackColor),
                              ),
                            ],
                          );
                        }
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                     return const SizedBox(
                        height: 10,
                      );
                    }, itemCount: cancelreasons.length,),
        
        
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
                          if(homeController.cancelreson.value=="")
                            {
                              CustomSnackBar.errorSnackBar(message: "cancelReasonValidation".tr,backgroundColor: AppColors.primaryColor,textcolor: AppColors.appBackgroundColor);
                            }
                          else{
                            homeController.cancelbooking();
                          }
        
                        },
                        height: 50,
                        width: kWidth * 0.9,
                        borderRadius: BorderRadius.circular(12),
                        bgColor: AppColors.redColor,
                        childWidget: Center(
                            child: Text("cancel".tr,
                                style:
                                    sfProMediumTextstyle.copyWith(fontSize: 16))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            if (navBarHeight > 0&&isKeyboardOpen==false)
              Container(
                height: navBarHeight,
                width: double.infinity,
                color: AppColors.appBackgroundColor, // or any color you want behind nav bar
              ),
          ],
        ),
      ),
    );
  }
}

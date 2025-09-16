import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/utils.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_drop_down_form_field.dart';
import '../../bottomnavigationbar/controllers/bottom_nav_bar_controllers.dart';
import '../../home/controllers/home_controller.dart';

class PickMeUpView extends StatelessWidget {
   PickMeUpView({super.key});
  final homeController = Get.find<BottomNavBarControllers>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
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
                const Spacer(),
                Container(
                  height: 44,
                  width: kWidth * 0.3,
                  decoration: BoxDecoration(
                    color: AppColors.appBackgroundColor,
                    borderRadius: BorderRadius.circular(37),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset:
                            const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
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
                                  image: AssetImage(AppImages.shapeTargetIcon)),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Center(
                          child: Text(
                        "location".tr,
                        style: sfProMediumTextstyle.copyWith(
                            fontSize: 12, color: AppColors.blackColor),
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
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
                  image: AssetImage(AppImages.mapImage), fit: BoxFit.fill)),
        ),
        bottomNavigationBar: Obx(
           () {
            return Column(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                          homeController.isPickMeUp.value?"bookPickMeUp".tr:  "bookPickUpMyCar".tr,
                            textAlign: TextAlign.center,
                            style: sfProSemiBoldTextstyle.copyWith(fontSize: 18),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                        color: AppColors.greyShadeTwo,
                        indent: 15,
                        endIndent: 15,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Obx(
                           () {
                              return Center(
                                child: InkWell(
                                  onTap: (){
                                    homeController.selectdate(context);
                                  },
                                  child: CustomDropDownFormField(
                                    height: 50,
                                    hintStyle: sfProMediumTextstyle.copyWith(
                                        fontSize: 12, color: AppColors.blackColor),
                                    textInputAction: TextInputAction.next,
                                    width: kWidth * 0.45,
                                    hintText: homeController.isselectedDate.value!=""? homeController.isselectedDate.value:"selectDate".tr,
                                    borderRadiusAll:
                                        const BorderRadius.all(Radius.circular(30)),
                                    prefixIcon: SvgPicture.asset(
                                      AppImages.calenderIcon,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    fillColor: AppColors.greyShadeThree,
                                    items: [],
                                    onChanged: (value) {},
                                    borderColor: Colors.transparent,
                                    validator: (string) {
                                      if (string == null) {
                                        return "genderIsRequired".tr;
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (value) {},
                                  ),
                                ),
                              );
                            }
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Obx(
                                  () {
                                return Center(
                                  child: InkWell(
                                    onTap: (){
                                      homeController.selectTime(context);
                                    },
                                    child: CustomDropDownFormField(
                                      height: 50,
                                      hintStyle: sfProMediumTextstyle.copyWith(
                                          fontSize: 12, color: AppColors.blackColor),
                                      textInputAction: TextInputAction.next,
                                      width: kWidth * 0.45,
                                      hintText: homeController.isselectedTime.value!=""? homeController.isselectedTime.value:"selectTime".tr,
                                      borderRadiusAll:
                                      const BorderRadius.all(Radius.circular(30)),
                                      prefixIcon: SvgPicture.asset(
                                        AppImages.clockIcon,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      fillColor: AppColors.greyShadeThree,
                                      items: [],
                                      onChanged: (value) {},
                                      borderColor: Colors.transparent,
                                      validator: (string) {
                                        if (string == null) {
                                          return "genderIsRequired".tr;
                                        }
                                        return null;
                                      },
                                      onFieldSubmitted: (value) {},
                                    ),
                                  ),
                                );
                              }
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: AppColors.blackColor,
                              ),
                              Container(
                                height: 65,
                                width: 10,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(AppImages.verticleImage),
                                        fit: BoxFit.scaleDown)),
                              ),
                              const Icon(
                                Icons.location_on,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "currentAddress".tr,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.greyShadeFour),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "rainSwitzerland".tr,
                                style: sfProMediumTextstyle.copyWith(
                                    color: AppColors.blackColor),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 12,
                                    width: kWidth * 0.7,
                                    child: const Divider(
                                      color: AppColors.greyShadeTwo,
                                      endIndent: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.appBackgroundColor,
                                      border: Border.all(
                                          color: AppColors.blackColor, width: 0.1),
                                    ),
                                    child:SvgPicture.asset(
                                      AppImages.arrowSwapIcon,
                                      fit: BoxFit.scaleDown,
                                    )
                                  )
                                ],
                              ),
                              Text(
                                "dropOff".tr,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.greyShadeFour),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "arbedoCastioneSwitzerland".tr,
                                style: sfProMediumTextstyle.copyWith(
                                    color: AppColors.blackColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 12,
                                width: kWidth * 0.7,
                                child: const Divider(
                                  color: AppColors.greyShadeTwo,
                                  endIndent: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "transferType".tr,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.greyShadeFour),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: CustomDropDownFormField(
                          height: 55,
                          hintStyle: sfProMediumTextstyle.copyWith(
                              fontSize: 12, color: AppColors.blackColor),
                          textInputAction: TextInputAction.next,
                          width: kWidth * 0.85,
                          hintText: "singleRide".tr,
                          borderRadiusAll:
                              const BorderRadius.all(Radius.circular(0)),
                          fillColor: AppColors.transparent,
                          items: ['Male', 'Female']
                              .map((option) => DropdownMenuItem(
                                    value: option,
                                    child: Text(option),
                                  ))
                              .toList(),
                          onChanged: (value) {},
                          borderColor: Colors.transparent,
                          validator: (string) {
                            if (string == null) {
                              return "genderIsRequired".tr;
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {},
                          controller: null,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CustomButton(
                          onPressed: () {
                            Get.toNamed(Routes.SELECT_RIDER_VIEW);
                          },
                          height: 50,
                          width: kWidth * 0.9,
                          borderRadius: BorderRadius.circular(12),
                          bgColor: AppColors.primaryColor,
                          childWidget: Center(
                              child: Text("continueBooking".tr,
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
              ],
            );
          }
        ));
  }
}

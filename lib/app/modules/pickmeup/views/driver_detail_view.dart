import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../data/utils.dart';
import '../../../routes/app_pages.dart';

class DriverDetailView extends StatelessWidget {
  const DriverDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
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
                    Icons.arrow_back_ios_new_outlined,
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
              image: AssetImage(AppImages.riderMapImage), fit: BoxFit.fill),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColors.appBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  topLeft: Radius.circular(18),
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 8),
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
                        "pickUpMinute".tr,
                        textAlign: TextAlign.center,
                        style: sfProSemiBoldTextstyle.copyWith(fontSize: 18),
                      )),
                  Center(
                    child: SizedBox(
                      width: kWidth * 0.8,
                      child: Text(
                        "leaveMetingToPerson".tr,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: sfProRegularTextstyle.copyWith(
                            fontSize: 12, color: AppColors.blackColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                    indent: 15,
                    endIndent: 28,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 85,
                        width: kWidth * 0.4,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 47,
                              top: 5,
                              child: Container(
                                height: 70,
                                width: 89,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(AppImages.bmwImage),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 72,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                      AssetImage(AppImages.richardMendozaImage),
                                      fit: BoxFit.fill)),
                            ),
                            Positioned(
                              top: 55,
                              left: 3,
                              child: Container(
                                height: 29,
                                width: 67,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.25),
                                      offset: const Offset(0, 4),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                  color: AppColors.appBackgroundColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.starIcon,
                                      height: 14,
                                      width: 14,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Center(
                                      child: Text(
                                        "rating".tr,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: sfProRegularTextstyle.copyWith(
                                            fontSize: 12,
                                            color: AppColors.blackColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: kWidth * 0.4,
                            child: Text(
                              "richardMendoza".tr,

                              maxLines: 2,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 16, color: AppColors.blackColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: SizedBox(
                              width: kWidth * 0.4,
                              child: Text(
                                "blackBmwZhNumber".tr,
                                maxLines: 2,
                                style: sfProRegularTextstyle.copyWith(
                                    fontSize: 12, color: AppColors.blackColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: kWidth * 0.95,
                    child: Row(
                      children: [
                         Container(
                           height: 45,
                           width: 45,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(99),
                             color: AppColors.greyShadeThree,
                           ),
                           child: SvgPicture.asset(
                             AppImages.callIcon,
                             height: 24,
                             width: 24,
                             fit: BoxFit.scaleDown,
                           ),
                         ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 45,
                          width: kWidth * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: AppColors.greyShadeThree,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                AppImages.messageIcon,
                                height: 24,
                                width: 24,
                                fit: BoxFit.scaleDown,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "sendMessage".tr,
                                  maxLines: 2,
                                  style: sfProRegularTextstyle.copyWith(
                                      fontSize: 14, color: AppColors.blackColor),
                                ),

                              ),
                              const SizedBox(
                                width: 2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 45,
                          width: kWidth * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: AppColors.greyShadeThree,
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                AppImages.blackCarIcon,
                                height: 12,
                                width: 16,
                                fit: BoxFit.scaleDown,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                "driverDetail".tr,
                                style: sfProRegularTextstyle.copyWith(
                                    fontSize: 14, color: AppColors.blackColor),
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
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "transferTrip".tr,
                            style: sfProRegularTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                          ),
                          Text(
                            "service".tr,
                            style: sfProRegularTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "kilometer".tr,
                            style: sfProRegularTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                          ),
                          Text(
                            "drivingRoute".tr,
                            style: sfProRegularTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "time".tr,
                            style: sfProRegularTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
                          ),
                          Text(
                            "estimatedTravelTime".tr,
                            style: sfProRegularTextstyle.copyWith(
                                fontSize: 14, color: AppColors.blackColor),
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
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                    indent: 15,
                    endIndent: 28,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.TRIP_DETAIL_VIEW);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [

                              Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.greyShadeThree,
                                  ),
                                  child: SvgPicture.asset(
                                    AppImages.blackCarIcon,
                                    height: 12,
                                    width: 16,
                                    fit: BoxFit.scaleDown,
                                  ),),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "viewTripDetail".tr,
                                textAlign: TextAlign.center,
                                style: sfProRegularTextstyle.copyWith(
                                    fontSize: 14,
                                    color: AppColors.splashHeadingColor),
                              ),

                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.blackColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
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

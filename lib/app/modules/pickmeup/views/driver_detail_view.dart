
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_burble_new/app/modules/pickmeup/views/trip_detail_view.dart';

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
        backgroundColor:  AppColors.transparent,
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
                      textAlign: TextAlign.center,maxLines: 2,
                      style: sfProRegularTextstyle.copyWith(fontSize: 12,
                          color: AppColors.blackColor),
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
                  endIndent: 15,
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10,),
                    SizedBox(
                     height: 85,
                      width: kWidth * 0.45,
                      child: Stack(
                        children: [
                          Positioned(
                            left:47,top: 5,
                            child: Container(
                              height: 70,
                              width: 89,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage
                                    (AppImages.bmwImage),fit: BoxFit.fill)
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 72,
                            decoration: const BoxDecoration(
                                image:  DecorationImage(image: AssetImage
                                  (AppImages.richardMendozaImage),fit: BoxFit.fill)
                            ),
                          ),
                          Positioned(
                            top: 55,left: 3,
                            child: Container(
                              height: 29,
                              width: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha:0.25),
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
                                  Container(
                                    height: 14,
                                    width: 14,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(image: AssetImage
                                          (AppImages.starIcon))
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Text(
                                    "rating".tr,
                                    textAlign: TextAlign.center,maxLines: 2,
                                    style: sfProRegularTextstyle.copyWith(fontSize: 12,
                                        color: AppColors.blackColor),
                                  ),
                                ],
                              ),
                            ),
                          )

                        ],
                      ),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width : kWidth * 0.5,
                          child: Text(
                            "richardMendoza".tr,
                            textAlign: TextAlign.center,maxLines: 2,
                            style: sfProMediumTextstyle.copyWith(fontSize: 16,
                                color: AppColors.blackColor),
                          ),
                        ),
                        SizedBox(
                          width : kWidth * 0.43,
                          child: Text(
                            "blackBmwZhNumber".tr,
                            textAlign: TextAlign.end,maxLines: 2,
                            style: sfProRegularTextstyle.copyWith(fontSize: 12,
                                color: AppColors.blackColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),

                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.greyShadeThree,
                      ),
                      child: Image.asset(AppImages.callIcon,cacheHeight: 24,
                        cacheWidth: 24,),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 45,
                      width: 181,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: AppColors.greyShadeThree,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(
                                  AppImages.messageIcon))
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "sendMessage".tr,
                            textAlign: TextAlign.center,
                            style: sfProRegularTextstyle.copyWith(fontSize: 14,
                                color: AppColors.blackColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: AppColors.greyShadeThree,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            height: 13,
                            width: 16,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage(
                                    AppImages.carBlackIcon))
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "driverDetail".tr,
                            textAlign: TextAlign.center,
                            style: sfProRegularTextstyle.copyWith(fontSize: 14,
                                color: AppColors.blackColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),

                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10,),
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
                    const SizedBox(width: 10,),
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
                    const SizedBox(width: 10,),
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
                    const SizedBox(width: 10,),
                  ],
                ),
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
                            const SizedBox(width: 10,),
                            Container(
                                height: 35,
                                width: 35,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.greyShadeThree,
                                ),
                                child: Image.asset( AppImages.carBlackIcon,cacheHeight: 13,cacheWidth: 16,)
                            ),
                            const SizedBox(width: 20,),
                            Text(
                              "viewTripDetail".tr,
                              textAlign: TextAlign.center,
                              style: sfProRegularTextstyle.copyWith(fontSize: 14,
                                  color: AppColors.splashHeadingColor),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded,color: AppColors
                          .blackColor,),
                      const SizedBox(width: 10,),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

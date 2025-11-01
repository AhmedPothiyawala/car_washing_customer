import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../data/utils.dart';
import '../../../routes/app_pages.dart';

class FavouriteDrive extends StatelessWidget {
  FavouriteDrive({super.key});

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
          onTap: () {
            Get.back();
          },
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
        title: Text(
          "myFavouriteRideView".tr,
          style: sfProSemiBoldTextstyle.copyWith(
            fontSize: 18,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              padding: const EdgeInsets.only(top: 0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.RIDE_DRIVER_DETAIL);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        width: kWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.appBackgroundColor,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x4DAEABBB),
                              offset: Offset(0, 4),
                              blurRadius: 34,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  // handle tap
                                },
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SvgPicture.asset(
                                    AppImages.shapeStarIcon,
                                    height: 34,
                                    width: 34,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 72,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.richardMendozaImage),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "misterRichardMendoza".tr,
                                        maxLines: 2,
                                        style: sfProMediumTextstyle.copyWith(
                                          fontSize: 16,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      Text(
                                        "driver".tr,
                                        maxLines: 2,
                                        style: sfProRegularTextstyle.copyWith(
                                          fontSize: 12,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Divider(
                                thickness: 1,
                                color: AppColors.greyShadeTwo,
                                endIndent: 10,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Text(
                                        "bsfr".tr,
                                        style: sfProRegularTextstyle.copyWith(
                                            fontSize: 14, color: AppColors.blackColor),
                                      ),
                                      Text(
                                        "cities".tr,
                                        style: sfProRegularTextstyle.copyWith(
                                            fontSize: 14, color: AppColors.greyShadeFour),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Text(
                                        "50+".tr,
                                        style: sfProRegularTextstyle.copyWith(
                                            fontSize: 14, color: AppColors.blackColor),
                                      ),
                                      Text(
                                        "completeTrip".tr,
                                        style: sfProRegularTextstyle.copyWith(
                                            fontSize: 14, color: AppColors.greyShadeFour),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Text(
                                        "151Km".tr,
                                        style: sfProRegularTextstyle.copyWith(
                                            fontSize: 14, color: AppColors.blackColor),
                                      ),
                                      Text(
                                        "drivingKm".tr,
                                        style: sfProRegularTextstyle.copyWith(
                                            fontSize: 14, color: AppColors.greyShadeFour),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Divider(
                                thickness: 1,
                                color: AppColors.greyShadeTwo,
                                endIndent: 10,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppImages.blackCarIcon,
                                    height: 16,
                                    width: 10,
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    "reBookRide".tr,
                                    maxLines: 2,
                                    style: sfProMediumTextstyle.copyWith(
                                      fontSize: 12,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

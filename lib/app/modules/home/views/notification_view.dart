import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../data/utils.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        appBar: AppBar(
          surfaceTintColor: AppColors.appBackgroundColor,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          automaticallyImplyLeading: false,
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
                      color: AppColors.appBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Color(
                              0x1C77758D), // Drop shadow color with 11% opacity
                          offset: Offset(0, 4), // X = 0, Y = 4
                          blurRadius: 22, // Blur radius
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.blackShadeThree,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "notification".tr,
                  style: sfProSemiBoldTextstyle.copyWith(
                      fontSize: 18, color: AppColors.blackShadeThree),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "today".tr,
                  style: sfProMediumTextstyle.copyWith(
                      fontSize: 16, color: AppColors.blackShadeThree),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: kWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.skyShadeTwo,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(9, 6),
                          blurRadius: 32,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.56)),
                      BoxShadow(
                          blurRadius: 33,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.54))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 12, right: 10, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.skyShadeOne),
                          child: SvgPicture.asset(
                            AppImages.carIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: kWidth * 0.55,
                                  child: Text(
                                    "carBookedSuccessfully".tr,
                                    style: sfProMediumTextstyle.copyWith(
                                        fontSize: 16,
                                        color: AppColors.blackColor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "twoHourAgo".tr,
                                    style: sfProRegularTextstyle.copyWith(
                                        fontSize: 12,
                                        color: AppColors.blackShadeThree),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: kWidth * 0.7,
                              child: Text(
                                "loremIpsumParagraph".tr,
                                maxLines: 3,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.blackColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: kWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.tomatoColorShadeOne,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(9, 6),
                          blurRadius: 32,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.56)),
                      BoxShadow(
                          blurRadius: 33,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.54))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 12, right: 10, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.tomatoColorShadeTwo),
                          child: SvgPicture.asset(
                            AppImages.rightClickOrangeColorIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: kWidth * 0.55,
                                  child: Text(
                                    "completeYourTrip".tr,
                                    style: sfProMediumTextstyle.copyWith(
                                        fontSize: 16,
                                        color: AppColors.blackColor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "twoHourAgo".tr,
                                    style: sfProRegularTextstyle.copyWith(
                                        fontSize: 12,
                                        color: AppColors.blackShadeThree),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: kWidth * 0.7,
                              child: Text(
                                "loremIpsumParagraph".tr,
                                maxLines: 3,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.blackColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ), //skyColorShadeThree
              Center(
                child: Container(
                  width: kWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.skyColorShadeThree,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(9, 6),
                          blurRadius: 32,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.56)),
                      BoxShadow(
                          blurRadius: 33,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.54))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 12, right: 10, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.greenShadeTwo
                                  .withValues(alpha: 0.22)),
                          child: SvgPicture.asset(
                            AppImages.moduloIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: kWidth * 0.55,
                                  child: Text(
                                    "offerForNow".tr,
                                    style: sfProMediumTextstyle.copyWith(
                                        fontSize: 16,
                                        color: AppColors.blackColor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "twoHourAgo".tr,
                                    style: sfProRegularTextstyle.copyWith(
                                        fontSize: 12,
                                        color: AppColors.blackShadeThree),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: kWidth * 0.7,
                              child: Text(
                                "loremIpsumParagraph".tr,
                                maxLines: 3,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.blackColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: kWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.pinkColorShadeOne,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(9, 6),
                          blurRadius: 32,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.56)),
                      BoxShadow(
                          blurRadius: 33,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.54))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 12, right: 10, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.pinkColorShadeTwo,
                          ),
                          child: SvgPicture.asset(
                            AppImages.pinkTimeIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: kWidth * 0.55,
                                  child: Text(
                                    "twoHoursRemain".tr,
                                    style: sfProMediumTextstyle.copyWith(
                                        fontSize: 16,
                                        color: AppColors.blackColor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "twoHourAgo".tr,
                                    style: sfProRegularTextstyle.copyWith(
                                        fontSize: 12,
                                        color: AppColors.blackShadeThree),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: kWidth * 0.7,
                              child: Text(
                                "loremIpsumParagraph".tr,
                                maxLines: 3,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.blackColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "yesterday".tr,
                  style: sfProSemiBoldTextstyle.copyWith(
                      fontSize: 18, color: AppColors.blackShadeThree),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: kWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.tomatoColorShadeOne,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(9, 6),
                          blurRadius: 32,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.56)),
                      BoxShadow(
                          blurRadius: 33,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.54))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 12, right: 10, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.tomatoColorShadeTwo,
                          ),
                          child: SvgPicture.asset(
                            AppImages.starIconWithBlackBorder,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: kWidth * 0.55,
                                  child: Text(
                                    "driveReviewRequest".tr,
                                    style: sfProMediumTextstyle.copyWith(
                                        fontSize: 16,
                                        color: AppColors.blackColor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "twoHourAgo".tr,
                                    style: sfProRegularTextstyle.copyWith(
                                        fontSize: 12,
                                        color: AppColors.blackShadeThree),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: kWidth * 0.7,
                              child: Text(
                                "loremIpsumParagraph".tr,
                                maxLines: 3,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.blackColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: kWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.tomatoColorShadeOne,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(9, 6),
                          blurRadius: 32,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.56)),
                      BoxShadow(
                          blurRadius: 33,
                          color: AppColors.tomatoColorShadeThree
                              .withValues(alpha: 0.54))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 12, right: 10, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.tomatoColorShadeTwo,
                          ),
                          child: SvgPicture.asset(
                            AppImages.calendarOrangeColorIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: kWidth * 0.55,
                                  child: Text(
                                    "carCancelledSuccessfully".tr,
                                    style: sfProMediumTextstyle.copyWith(
                                        fontSize: 16,
                                        color: AppColors.blackColor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "twoHourAgo".tr,
                                    style: sfProRegularTextstyle.copyWith(
                                        fontSize: 12,
                                        color: AppColors.blackShadeThree),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: kWidth * 0.7,
                              child: Text(
                                "loremIpsumParagraph".tr,
                                maxLines: 3,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.blackColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

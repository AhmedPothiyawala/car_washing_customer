import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../data/utils.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_button.dart';

class TripDetailView extends StatelessWidget {
  const TripDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColors.appBackgroundColor,
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
                    Icons.close,
                    color: AppColors.blackColor,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "viewTripDetail".tr,
                style: sfProSemiBoldTextstyle.copyWith(
                    fontSize: 18, color: AppColors.blackColor),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: kWidth * 0.4,
                      child: Text(
                        "orderTimeDateDay".tr,
                        style: sfProRegularTextstyle.copyWith(
                            fontSize: 14, color: AppColors.blackColor),
                      )),
                  const Spacer(),
                  SizedBox(
                      width: kWidth * 0.4,
                      child: Text(
                        "orderId".tr,
                        style: sfProRegularTextstyle.copyWith(
                            fontSize: 14, color: AppColors.blackColor),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
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
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 66,
                    width: 88,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.bmwImage),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "pickUpMyCarFirst".tr,
                        style: sfProMediumTextstyle.copyWith(
                            color: AppColors.blackColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "dropOffToday".tr,
                        style: sfProRegularTextstyle.copyWith(
                            color: AppColors.blackColor),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                            fontSize: 14, color: AppColors.greyShadeFour),
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
                            fontSize: 14, color: AppColors.greyShadeFour),
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
                        "time".tr,
                        style: sfProRegularTextstyle.copyWith(
                            fontSize: 14, color: AppColors.blackColor),
                      ),
                      Text(
                        "estimatedTravelTime".tr,
                        style: sfProRegularTextstyle.copyWith(
                            fontSize: 14, color: AppColors.greyShadeFour),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        )),
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
                        "pickUpLocation".tr,
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
                        height: 10,
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
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "customerDetail".tr,
                style: sfProSemiBoldTextstyle.copyWith(
                    fontSize: 18, color: AppColors.blackColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "name".tr,
                style: sfProMediumTextstyle.copyWith(
                    fontSize: 12, color: AppColors.greyShadeFour),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "john".tr,
                style: sfProRegularTextstyle.copyWith(
                    fontSize: 14, color: AppColors.blackColor),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                //
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
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:
                          CrossAxisAlignment.start, //companyName
                      children: [
                        Text(
                          "companyName".tr,
                          style: sfProMediumTextstyle.copyWith(
                              fontSize: 12, color: AppColors.greyShadeFour),
                        ),
                        Text(
                          "pickUpMyCarGmbh".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                        ),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "addition".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 12, color: AppColors.greyShadeFour),
                        ),
                        Text(
                          "dummyText".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                        ),
                      ]),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                //
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "email".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 12, color: AppColors.greyShadeFour),
                        ),
                        SizedBox(
                            width: kWidth * 0.4,
                            child: Text(
                              "emailIs".tr,
                              style: sfProRegularTextstyle.copyWith(
                                  fontSize: 14, color: AppColors.blackColor),
                            )),
                      ]),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "phone".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 12, color: AppColors.greyShadeFour),
                        ),
                        Text(
                          "phoneNumber41".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                        ),
                      ]),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                //
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "remark".tr,
                style: sfProRegularTextstyle.copyWith(
                    fontSize: 12, color: AppColors.greyShadeFour),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  width: kWidth * 0.9,
                  child: Text(
                    "remarkParagraph".tr,
                    style: sfProRegularTextstyle.copyWith(
                        fontSize: 14, color: AppColors.blackColor),
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
                height: 25,
              ),
              Text(
                "billingAddress".tr,
                style: sfProSemiBoldTextstyle.copyWith(
                    fontSize: 18, color: AppColors.blackColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "name".tr,
                style: sfProRegularTextstyle.copyWith(
                    fontSize: 12, color: AppColors.greyShadeFour),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "john".tr,
                style: sfProRegularTextstyle.copyWith(
                    fontSize: 14, color: AppColors.blackColor),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                //
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
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:
                          CrossAxisAlignment.start, //companyName
                      children: [
                        Text(
                          "companyName".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 12, color: AppColors.greyShadeFour),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "pickUpMyCarGmbh".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                        ),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "addition".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 12, color: AppColors.greyShadeFour),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "dummyText".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                        ),
                      ]),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                //
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "email".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 12, color: AppColors.greyShadeFour),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            width: kWidth * 0.4,
                            child: Text(
                              "emailIs".tr,
                              style: sfProRegularTextstyle.copyWith(
                                  fontSize: 14, color: AppColors.blackColor),
                            )),
                      ]),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "phone".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 12, color: AppColors.greyShadeFour),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "phoneNumber41".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                        ),
                      ]),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                //
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "companyLocation".tr,
                style: sfProRegularTextstyle.copyWith(
                    fontSize: 12, color: AppColors.greyShadeFour),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "companyLocationName".tr,
                style: sfProRegularTextstyle.copyWith(
                    fontSize: 14, color: AppColors.blackColor),
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
                height: 25,
              ),
              Text(
                "dispatcherDetail".tr,
                style: sfProSemiBoldTextstyle.copyWith(
                    fontSize: 18, color: AppColors.blackColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "dispatcherName".tr,
                style: sfProRegularTextstyle.copyWith(
                    fontSize: 12, color: AppColors.greyShadeFour),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "dispatcherNameIs".tr,
                style: sfProRegularTextstyle.copyWith(
                    fontSize: 14, color: AppColors.blackColor),
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
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:
                          CrossAxisAlignment.start, //companyName
                      children: [
                        Text(
                          "dispatcherPhone".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 12, color: AppColors.greyShadeFour),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "dispatcherNumber".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                        ),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "orderNumber".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 12, color: AppColors.greyShadeFour),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "oneToNine".tr,
                          style: sfProRegularTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor),
                        ),
                      ]),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                //
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "paymentSummary".tr,
                style: sfProSemiBoldTextstyle.copyWith(
                    fontSize: 18, color: AppColors.blackColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "subTotal".tr,
                    style: sfProRegularTextstyle.copyWith(
                        fontSize: 16, color: AppColors.blackColor),
                  ),
                  Text(
                    "chf448".tr,
                    style: sfProRegularTextstyle.copyWith(
                        fontSize: 16, color: AppColors.blackColor),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "promotion".tr,
                        style: sfProRegularTextstyle.copyWith(
                            fontSize: 16, color: AppColors.blackColor),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        AppImages.errorIcon,
                        height: 15,
                        width: 15,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  Text(
                    "points".tr,
                    style: sfProRegularTextstyle.copyWith(
                        fontSize: 16, color: AppColors.greenColor),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "texes&otherFee".tr,
                        style: sfProRegularTextstyle.copyWith(
                            fontSize: 16, color: AppColors.blackColor),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        AppImages.errorIcon,
                        height: 15,
                        width: 15,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  Text(
                    "chf0".tr,
                    style: sfProRegularTextstyle.copyWith(
                        fontSize: 16, color: AppColors.blackColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "total".tr,
                    style: sfProRegularTextstyle.copyWith(
                        fontSize: 16, color: AppColors.blackColor),
                  ),
                  Text(
                    "totalChf".tr,
                    style: sfProRegularTextstyle.copyWith(
                        fontSize: 16, color: AppColors.blackColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CustomButton(
                  onPressed: () {
                    Get.toNamed(Routes.LOCATIN_VIEW);
                  },
                  height: 50,
                  width: kWidth * 0.9,
                  borderRadius: BorderRadius.circular(12),
                  bgColor: AppColors.redColor,
                  childWidget: Center(
                      child: Text("cancelBooking".tr,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../data/utils.dart';
import '../../../widgets/custom_text_form_field.dart';

class SearchView extends StatelessWidget {
   SearchView({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
        surfaceTintColor: AppColors.appBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(width: 15,),
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
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 22,
                        spreadRadius: 0,
                        color: AppColors.shadowWhiteColor,
                      )
                    ]
                  ),
                  child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: AppColors.blackColor,
                      )),
                ),
              ),
              const SizedBox(width: 15,),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 22,
                      spreadRadius: 0,
                      color: AppColors.shadowWhiteColor,
                    )
                  ]
                ),
                child: CustomTextFormField(
                  suffixIcon: SvgPicture.asset(AppImages.homeSearchIcon,height:
                  18,width: 18,fit: BoxFit.scaleDown,),
                  hintText: "search".tr,
                  hintStyle: sfProRegularTextstyle.copyWith(
                      fontSize: 14, color: AppColors.blackColor),
                  width: kWidth * 0.8,
                  borderRadiusAll:
                  const BorderRadius.all(Radius.circular(12)),
                  controller: searchController,
                  fillColor: AppColors.appBackgroundColor,
                  borderColor: AppColors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0,right : 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "recentSearch".tr,
                style: sfProRegularTextstyle.copyWith(
                    fontSize: 14, color: AppColors.greyShadeFour),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "upcomingBookings".tr,
                    style: sfProRegularTextstyle.copyWith(
                        fontSize: 14, color: AppColors.blackShadeOne),
                  ),
                  const Spacer(),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.blackColor,
                        width: 1.5,
                      ),
                    ),
                    child: const Center(child:  Icon(Icons.close,color:
                    AppColors.blackShadeFive,size: 15,)),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "myDriver".tr,
                    style: sfProRegularTextstyle.copyWith(
                        fontSize: 14, color: AppColors.blackShadeOne),
                  ),
                  const Spacer(),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.blackColor,
                        width: 1.5,
                      ),
                    ),
                    child: const Center(child: Icon(Icons.close,color:
                    AppColors.blackShadeFive,size: 15,)),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "cancelBookings".tr,
                    style: sfProRegularTextstyle.copyWith(
                        fontSize: 14, color: AppColors.blackShadeOne),
                  ),
                  const Spacer(),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.blackColor,
                        width: 1.5,
                      ),
                    ),
                    child:const Center(child:  Icon(Icons.close,color:
                    AppColors.blackShadeFive,size: 15,)),
                  )
                ],
              ),
              const SizedBox(
                height:20,
              ),
              Text(
                "recentView".tr,
                style: sfProRegularTextstyle.copyWith(
                    fontSize: 14, color: AppColors.blackColor),
              ),
              const SizedBox(
                height: 20,
              ),

              Center(
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
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10.0,top:
                    10,bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "orderId".tr,
                                  style: sfProSemiBoldTextstyle.copyWith(
                                      fontSize: 14, color: AppColors.blackColor),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "monday7September".tr,
                                  style: sfProRegularTextstyle.copyWith(
                                      fontSize: 14, color: AppColors.blackColor),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(width: 1,color: AppColors.purpleColorShadeOne)
                              ),
                              child: Center(
                                child: Text(
                                  "upcoming".tr,
                                  style: sfProRegularTextstyle.copyWith(
                                      fontSize: 11, color: AppColors.purpleColorShadeOne),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: 1,
                          color: AppColors.greyShadeTwo,
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
          
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: kWidth * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "pickUpMyCarFirst".tr,
                                    maxLines: 2,
                                    style: sfProMediumTextstyle.copyWith(
                                        fontSize: 16, color: AppColors.blackColor),
                                  ),
                                  Text(
                                    "misterRichardMendoza".tr,
                                    maxLines: 2,
                                    style: sfProMediumTextstyle.copyWith(
                                        fontSize: 16, color: AppColors.blackColor),
                                  ),
                                  Text(
                                    "driver".tr,
                                    maxLines: 2,
                                    style: sfProRegularTextstyle.copyWith(
                                        fontSize: 12, color: AppColors.blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
          
                        const Divider(
                          thickness: 1,
                          color: AppColors.greyShadeTwo,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImages.blackCarIcon,height: 16,
                              width: 10,),
                            const SizedBox(width: 15,),
                            Text(
                              "reBookRide".tr,
                              maxLines: 2,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
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
                      color: AppColors.appBackgroundColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x4DAEABBB),
                          offset: Offset(0, 4),
                          blurRadius: 34,
                          spreadRadius: 0,
                        ),
                      ]

                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(AppImages.shapeStarIcon,height: 34,
                            width: 34,fit: BoxFit.fill,),
                        ),
                        Row(
                          children: [
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
                            const SizedBox(width: 15,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "misterRichardMendoza".tr,
                                  maxLines: 2,
                                  style: sfProMediumTextstyle.copyWith(
                                      fontSize: 16, color: AppColors.blackColor),
                                ),
                                Text(
                                  "driver".tr,
                                  maxLines: 2,
                                  style: sfProRegularTextstyle.copyWith(
                                      fontSize: 12, color: AppColors.blackColor),
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
                          endIndent: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: 1,
                          color: AppColors.greyShadeTwo,
                          endIndent: 10,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImages.blackCarIcon,height: 16,
                              width: 10,),
                            const SizedBox(width: 15,),
                            Text(
                              "reBookRide".tr,
                              maxLines: 2,
                              style: sfProMediumTextstyle.copyWith(
                                  fontSize: 12, color: AppColors.blackColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

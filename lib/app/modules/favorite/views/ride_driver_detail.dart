import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_images.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../data/utils.dart';
class RideDriverDetail extends StatelessWidget {
    RideDriverDetail({super.key});

    final List<Map<String,String>> carList = [
      {
        "carImageOne": AppImages.whiteBmw,
        "headingOne" : "firstClass".tr,
        "headingTwo" : "bmw7".tr,
        "headingThree" : "zhNumberOne".tr,
      },
      {
        "carImageOne": AppImages.whiteBmw,
        "headingOne" : "businessClass".tr,
        "headingTwo" : "mercedes".tr,
        "headingThree" : "zhNumberTwo".tr,

      },
      {
        "carImageOne": AppImages.whiteBmw,
        "headingOne" : "suvClass".tr,
        "headingTwo" : "escalade".tr,
        "headingThree" : "zhNumberThree".tr,

      },
      {
        "carImageOne": AppImages.whiteBmw,
        "headingOne" : "vanClass".tr,
        "headingTwo" : "escalade".tr,
        "headingThree" : "zhNumberFour".tr,

      },
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kHeight * 0.35,
              width: kWidth,
              child: Stack(
                children: [
                  Container(
                    height: kHeight * 0.25,
                    width: kWidth,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.mainBgRides),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child:   Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.arrow_back,color: AppColors.appBackgroundColor,size: 24,)),
                            const Spacer(),
                            Text(
                              "myFavouriteRideView".tr,
                              textAlign: TextAlign.center,
                              style: sfProSemiBoldTextstyle.copyWith(fontSize: 18,color: AppColors.appBackgroundColor),
                            ),
                            const Spacer(),
                            SvgPicture.asset(AppImages.whiteStartIcon,height: 18,width: 18,color: AppColors.appBackgroundColor,fit: BoxFit.fill,),
                            const SizedBox(width: 20,),
                            SvgPicture.asset(AppImages.moreVertHorizontal,height: 5,width: 21,color: AppColors.appBackgroundColor,fit: BoxFit.fill),
                            const SizedBox(width: 15,),

                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 145,
                    left: (kWidth - 150) / 2,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppImages.richardMendozaSmallBorder),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "misterRichardMendoza".tr,
                textAlign: TextAlign.center,
                style: sfProMediumTextstyle.copyWith(fontSize: 18,color: AppColors.blackColor),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "driver".tr,
                textAlign: TextAlign.center,
                style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "50+".tr,
                      style: sfProBoldTextstyle.copyWith(
                          fontSize: 16, color: AppColors.teenColorShadeOne),
                    ),
                    Text(
                      "completeTrip".tr,
                      style: sfProMediumTextstyle.copyWith(
                          fontSize: 12, color: AppColors.greyShadeFour),
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
                      style: sfProBoldTextstyle.copyWith(
                          fontSize: 16, color: AppColors.blueColorShadeOne),
                    ),
                    Text(
                      "drivingkm".tr,
                      style: sfProMediumTextstyle.copyWith(
                          fontSize: 12, color: AppColors.greyShadeFour),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "bsfr".tr,
                      style: sfProRegularTextstyle.copyWith(
                          fontSize: 14, color: AppColors.sabrinColorShadeOne),
                    ),
                    Text(
                      "cities".tr,
                      style: sfProRegularTextstyle.copyWith(
                          fontSize: 14, color: AppColors.greyShadeFour),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "vehicleClass".tr,
                style: sfProSemiBoldTextstyle.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20,),

             Padding(
               padding: const EdgeInsets.only(left: 10.0,right: 10),
               child: SizedBox(
                height: 120,
                child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: carList.length,
                  itemBuilder: (context,index) {
                  final car = carList[index];
                  return  Padding(
                    padding: const EdgeInsets.only(left: 5.0,right: 6),
                    child: Container(
                      //height: 110,
                      width: kWidth * 0.3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage(AppImages.selectLine),fit: BoxFit.fill)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 25,
                              width: 55,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(car["carImageOne"]!),fit: BoxFit.fill)
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              car["headingOne"]!,
                              style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),
                            ),
                            Text(
                              car["headingTwo"]!,
                              style: sfProRegularTextstyle.copyWith(fontSize: 10,color: AppColors.blueColorShadeOne),
                            ),
                            Text(
                              car["headingTwo"]!,
                              style: sfProRegularTextstyle.copyWith(fontSize: 10,color: AppColors.greyShadeFour),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                ),
                           ),
             ),

            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 15,),
                SizedBox(
                  width: kWidth * 0.5,
                  child: Text(
                    "inviteDriverToYourFavouriteDrivers".tr,maxLines: 3,
                    style: sfProSemiBoldTextstyle.copyWith(fontSize: 14),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: AppColors.primaryColor
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.contactIcon,height: 16,width: 16,fit: BoxFit.fill,),
                      const SizedBox(width: 5,),
                      Text(
                        "inviteDriver".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15,),
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:15),
              child: Text(
                "personalInfo".tr,
                style: sfProSemiBoldTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
              ),
            ),
            const SizedBox(height: 20,),



            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: Text(
                        "mobileNumber".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: Text(
                        "emergencyNumber".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: Text(
                        "email".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                      ),
                    ),

                  ],
                ),
                const SizedBox(width: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      ":".tr,
                      style: sfProBoldTextstyle.copyWith(fontSize: 12,color: AppColors.greyShadeNine),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      ":".tr,
                      style: sfProBoldTextstyle.copyWith(fontSize: 12,color: AppColors.greyShadeNine),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      ":".tr,
                      style: sfProBoldTextstyle.copyWith(fontSize: 12,color: AppColors.greyShadeNine),
                    ),
                  ],
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: Text(
                        "+41xx".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                      ),),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: Text(
                        "+41xx".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                      ),),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:15),
                      child: Text(
                        "richard@demo.com".tr,
                        style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                      ),),
                  ],
                )

              ],
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                height: 50 ,
                width: kWidth * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.whiteCarIcon,height: 18,width: 23,color: AppColors.appBackgroundColor,),
                    const SizedBox(width: 10,),
                    Text(
                      "reBookRide".tr,
                      style: sfProMediumTextstyle.copyWith(fontSize: 16,color: AppColors.appBackgroundColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

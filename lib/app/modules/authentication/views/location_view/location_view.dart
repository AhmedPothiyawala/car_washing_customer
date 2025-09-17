import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../data/app_colors.dart';
import '../../../../data/app_images.dart';
import '../../../../data/text_styles.dart';
import '../../../../data/utils.dart';
import '../../../../widgets/custom_button.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
     
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 96,
              width: 96,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.silverColor),
              child: SvgPicture.asset(
                AppImages.whiteLocationIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: kWidth * 0.8,
                child: Text(
                  "enablePreciseLocation".tr,
                  textAlign: TextAlign.center,
                  style: sfProBoldTextstyle.copyWith(
                      fontSize: 24, color: AppColors.blackColor),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: kWidth * 0.7,
                child: Text(
                  "YourLocationWillBeUsedToShowPeopleNearYou.".tr,
                  textAlign: TextAlign.center,
                  style: poppinsRegularTextstyle.copyWith(
                      fontSize: 15, color: AppColors.greyShadeSeven),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: CustomButton(
                onPressed: () async {
                  await Geolocator.openLocationSettings();

                },
                height: 50,
                width: kWidth * 0.8,
                borderRadius: BorderRadius.circular(12),
                bgColor: AppColors.primaryColor,
                childWidget: Center(
                    child: Text("openSetting".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 16))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Center(
                child: Text(
                  "remindMeLetter".tr,
                  textAlign: TextAlign.center,
                  style: poppinsRegularTextstyle.copyWith(
                      fontSize: 15, color: AppColors.greyShadeSeven),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

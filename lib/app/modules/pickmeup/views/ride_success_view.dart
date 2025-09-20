import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../data/utils.dart';
import '../../../widgets/custom_button.dart';

class RideSuccessView extends StatelessWidget {
  const RideSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                color: AppColors.tintColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppImages.rightClickIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "successYourRide".tr,
            style: sfProSemiBoldTextstyle.copyWith(
                fontSize: 18, color: AppColors.blackShadeThree),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "enjoyYourRide".tr,
            style: sfProRegularTextstyle.copyWith(
                fontSize: 14, color: AppColors.blackShadeThree),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: CustomButton(
              onPressed: () {
                //Get.toNamed(Routes.RIDE_SUCCESS_VIEW);
              },
              height: 50,
              width: kWidth * 0.8,
              borderRadius: BorderRadius.circular(12),
              bgColor: AppColors.greenColor2,
              childWidget: Center(
                  child: Text("giveComplement".tr,
                      style: sfProMediumTextstyle.copyWith(fontSize: 16))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_images.dart';
import 'package:go_burble_new/app/data/utils.dart';

import '../../data/app_colors.dart';
import '../../data/text_styles.dart';
import 'edit_profile.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: AppColors.appBackgroundColor,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: AppColors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: kHeight * 0.25,
              width: kWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.myProfileBackgroundImage),fit: BoxFit.fill)
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "myProfile".tr,
                        style: sfProSemiBoldTextstyle.copyWith(fontSize: 18,color: AppColors.appBackgroundColor),
                      ),
                      const Spacer(),
                      const Icon(Icons.more_horiz_outlined,color: AppColors.appBackgroundColor,),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 64,
                        width: 64,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(AppImages.richardMendozaImage))
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "misterRichardMendoza".tr,
                            style: sfProMediumTextstyle.copyWith(fontSize: 16,color: AppColors.appBackgroundColor),
                          ),
                          Text(
                            "dispatcherNumber".tr,
                            style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.appBackgroundColor),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(EditProfile());
                        },
                        child: Container(
                          height: 35,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: AppColors.appBackgroundColor.withValues(alpha: 0.15)
                          ),
                          child: Center(
                            child: Text(
                              "editProfile".tr,
                              textAlign: TextAlign.center,
                              style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.appBackgroundColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15,),
                  Text(
                    "myAccount".tr,
                    style: sfProSemiBoldTextstyle.copyWith(fontSize: 16,color: AppColors.blackColor
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteShadeFive,
                        ),
                        child: SvgPicture.asset(AppImages.profileIcon,height: 20,width: 20 ,fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        "myProfile".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor
                        ),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor,),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteShadeFive,
                        ),
                        child: SvgPicture.asset(AppImages.profileCarIcon,height: 12,width: 20 ,fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        "myBookingPickUpMyCar".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor
                        ),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor,),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteShadeFive,
                        ),
                        child: SvgPicture.asset(AppImages.myBookingPickMeUpProfileIcon,height: 20,width: 20 ,fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        "myBookingPickMeUp".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor
                        ),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor,),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteShadeFive,
                        ),
                        child: SvgPicture.asset(AppImages.favouriteDriverIcon,height: 20,width: 20 ,fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        "myFavouriteDriver".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor
                        ),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor,),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteShadeFive,
                        ),
                        child: SvgPicture.asset(AppImages.profileWalletIcon,height: 20,width: 20 ,fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        "myWallet".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor
                        ),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor,),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteShadeFive,
                        ),
                        child: SvgPicture.asset(AppImages.profileLoyaltyPointsIcon,height: 20,width: 20 ,fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        "loyaltyPoints".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor
                        ),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor,),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    "settings".tr,
                    style: sfProSemiBoldTextstyle.copyWith(fontSize: 16,color: AppColors.blackColor
                    ),),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteShadeFive,
                        ),
                        child: SvgPicture.asset(AppImages.changePasswordIcon,height: 20,width: 20 ,fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 20,),
                      Row(
                        children: [
                          Text(
                            "changePassword".tr,
                            style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor
                            ),),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor,),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteShadeFive,
                        ),
                        child: SvgPicture.asset(AppImages.profileNotificationIcon,height: 20,width: 20 ,fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        "notification".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor
                        ),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor,),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteShadeFive,
                        ),
                        child: SvgPicture.asset(AppImages.profileHelpCenterIcon,height: 20,width: 20 ,fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        "helpCenter".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor
                        ),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor,),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                  ),
                  const SizedBox(height: 8,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteShadeFive,
                        ),
                        child: SvgPicture.asset(AppImages.profilePrivacyPolicyIcon,height: 20,width: 20 ,fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        "privacyPolicy".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor
                        ),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor,),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteShadeFive,
                        ),
                        child: SvgPicture.asset(AppImages.profileLanguageIcon,height: 20,width: 20 ,fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        "language".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor
                        ),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor,),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Divider(
                    thickness: 1,
                    color: AppColors.greyShadeTwo,
                  ),
                  const SizedBox(height: 8,),
                  Container(
                    height: 44,
                    width: 109,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(37),
                      color: AppColors.lightTomato,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImages.profileLogOutIcon,height: 24,width: 24,color: AppColors.darkTomato,),
                        const SizedBox(width: 5,),
                        Text(
                          "logout".tr,
                          style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.darkTomato
                          ),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

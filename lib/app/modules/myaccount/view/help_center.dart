import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../data/utils.dart';
import '../controller/account_controller.dart';

class HelpCenter extends StatelessWidget {
  HelpCenter({super.key});

  final accountController = Get.put(AccountController());

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
          onTap: () => Get.back(),
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
          "helpCenter".tr,
          style: sfProSemiBoldTextstyle.copyWith(
            fontSize: 18,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SvgPicture.asset(
              AppImages.searchIcon,
              height: 24,
              width: 24,
              color: AppColors.blackShadeFive,
            ),
          )
        ],
      ),
      body: GetBuilder<AccountController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 52,
                  width: kWidth * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: AppColors.whiteShadeSeven,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          controller.selectedButton = true;
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 157,
                          decoration: BoxDecoration(
                            color: controller.selectedButton
                                ? AppColors.appBackgroundColor
                                : AppColors.transparent,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Center(
                            child: Text(
                              "faq".tr,
                              textAlign: TextAlign.center,
                              style: sfProSemiBoldTextstyle.copyWith(
                                fontSize: 14,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      InkWell(
                        onTap: () {
                          controller.selectedButton = false;
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 157,
                          decoration: BoxDecoration(
                            color: controller.selectedButton
                                ? AppColors.transparent
                                : AppColors.appBackgroundColor,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Center(
                            child: Text(
                              "contactUs".tr,
                              textAlign: TextAlign.center,
                              style: sfProSemiBoldTextstyle.copyWith(
                                fontSize: 14,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
               controller.selectedButton == true ?
              Padding(
                padding: const EdgeInsets.only(left :15.0,right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        Text(
                          "canITrackMyBookedDeliverStatus".tr,
                          style: sfProMediumTextstyle.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.add,color: AppColors.primaryColor,size: 22,)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Divider(
                      thickness: 1,
                      color: AppColors.greyShadeTwo,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          "isThereAReturnPolicy".tr,
                          style: sfProMediumTextstyle.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.minimize,color: AppColors.primaryColor,size: 22,)
                      ],
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: kWidth,
                      child: Text(
                        "theCustomerCanOrderTheTransportServiceOnlineViaTheWebsiteParagraph".tr,
                        style: sfProRegularTextstyle.copyWith(
                          fontSize: 12,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: AppColors.greyShadeTwo,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          "canISaveMyFavoriteItemForLater".tr,
                          style: sfProMediumTextstyle.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.add,color: AppColors.primaryColor,size: 22,)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Divider(
                      thickness: 1,
                      color: AppColors.greyShadeTwo,
                    ),
                    const SizedBox(height: 10,),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          "canIShareTheProductsWithMyFriends".tr,
                          style: sfProMediumTextstyle.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.add,color: AppColors.primaryColor,size: 22,)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Divider(
                      thickness: 1,
                      color: AppColors.greyShadeTwo,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          "howDoIContactCustomerSupport".tr,
                          style: sfProMediumTextstyle.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.add,color: AppColors.primaryColor,size: 22,)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Divider(
                      thickness: 1,
                      color: AppColors.greyShadeTwo,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          "whatPaymentMethodsAreAccepted".tr,
                          style: sfProMediumTextstyle.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.add,color: AppColors.primaryColor,size: 22,)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Divider(
                      thickness: 1,
                      color: AppColors.greyShadeTwo,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          "howToAddReview".tr,
                          style: sfProMediumTextstyle.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.add,color: AppColors.primaryColor,size: 22,)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Divider(
                      thickness: 1,
                      color: AppColors.greyShadeTwo,
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ) :
                   Column(
                     children: [

                     ],
                   )
            ],
          );
        },
      ),
    );
  }
}

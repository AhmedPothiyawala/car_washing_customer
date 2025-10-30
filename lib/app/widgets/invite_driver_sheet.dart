import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/widgets/custom_text_form_field.dart';

import '../data/app_colors.dart';
import '../data/text_styles.dart';
import '../data/utils.dart';

void showInviteDriverSheet(BuildContext context,) {
  //controller
 final nameController = TextEditingController();
 final emailController = TextEditingController();
  showModalBottomSheet(
      //backgroundColor:AppColors.whiteColor,
      context: context, builder: (context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: kWidth,
            decoration: BoxDecoration(
              color: AppColors.appBackgroundColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.whiteShadeFour.withValues(alpha: 0.25),
                  offset: const Offset(0, 8),
                  blurRadius: 43,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "inviteDriver".tr,
                  style: sfProSemiBoldTextstyle.copyWith(
                    fontSize: 18,
                    color: AppColors.blackColor,
                  ),),
              ),
                  const SizedBox(
                    height: 20,
                  ),
              Text(
                "name".tr,
                style: sfProMediumTextstyle.copyWith(
                  fontSize: 12,
                  color: AppColors.greyShadeFour,
                ),),
                 const SizedBox(height: 5,),
                 Container(
                   decoration: BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                           offset: const Offset(0, 1),
                           blurRadius: 2,
                           spreadRadius: 0,
                           color: AppColors.greyShadeSix.withValues(alpha: 0.24),
                         )
                       ]
                   ),
                   child: CustomTextFormField(
                     controller: nameController,
                     hintText: "john".tr,
                     hintStyle: sfProMediumTextstyle.copyWith(color: AppColors.blackColor),
                     width: kWidth ,
                     borderRadiusAll: const BorderRadius.all(Radius.circular(12)),
                     borderColor: AppColors.appWhiteGreyColor,
                     fillColor: AppColors.appBackgroundColor,
                   ),
                 ),
                  const SizedBox(height: 20,),
                  Text(
                    "email".tr,
                    style: sfProMediumTextstyle.copyWith(
                      fontSize: 12,
                      color: AppColors.greyShadeFour,
                    ),),
                  const SizedBox(height: 5,),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 0,
                            color: AppColors.greyShadeSix.withValues(alpha: 0.24),
                          )
                        ]
                    ),
                    child: CustomTextFormField(
                      controller: nameController,
                      hintText: "emailIs".tr,
                      hintStyle: sfProMediumTextstyle.copyWith(color: AppColors.blackColor),
                      width: kWidth,
                      borderRadiusAll: const BorderRadius.all(Radius.circular(12)),
                      borderColor: AppColors.appWhiteGreyColor,
                      fillColor: AppColors.appBackgroundColor,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 50 ,
                    width: kWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "invite".tr,
                        style: sfProMediumTextstyle.copyWith(fontSize: 16,color: AppColors.appBackgroundColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
      
                ],
              ),
            ),
      
          )
        ],
      ),
    );
  });
}

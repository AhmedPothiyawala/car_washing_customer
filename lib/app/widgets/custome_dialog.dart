import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/text_styles.dart';

import '../data/app_colors.dart';
import '../data/utils.dart';
import 'custom_button.dart';

class CustomeDialog extends StatefulWidget {
  const CustomeDialog({super.key});

  @override
  State<CustomeDialog> createState() => _CustomeDialogState();
}

class _CustomeDialogState extends State<CustomeDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.appBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 20, bottom: 20),
        child: SizedBox(
          height: kHeight * 0.2,
          width: kWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.exit_to_app_rounded,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "exitAppTitle".tr,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: sfProBoldTextstyle.copyWith(
                      color: AppColors.primaryColor, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "exitAppSubTitle".tr,
                maxLines: 2,
                textAlign: TextAlign.center,
                softWrap: true,
                style: sfProBoldTextstyle.copyWith(
                    color: AppColors.primaryColor, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  CustomButton(
                    onPressed: () {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else {
                        exit(0);
                      }
                    },
                    height: 35,
                    width: kWidth * 0.3,
                    borderRadius: BorderRadius.circular(12),
                    bgColor: AppColors.primaryColor,
                    childWidget: Center(
                        child: Text("yes".tr,
                            style:
                                sfProMediumTextstyle.copyWith(fontSize: 16))),
                  ),
                  CustomButton(
                    onPressed: () {
                      Get.back();
                    },
                    height: 35,
                    width: kWidth * 0.3,
                    borderRadius: BorderRadius.circular(12),
                    bgColor: AppColors.redColor,
                    childWidget: Center(
                        child: Text("no".tr,
                            style:
                                sfProMediumTextstyle.copyWith(fontSize: 16))),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

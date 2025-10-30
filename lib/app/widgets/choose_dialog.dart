import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/app_colors.dart';
import '../data/text_styles.dart';
import 'invite_driver_sheet.dart';

void chooseDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
       // insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.greyShadeTen.withValues(alpha: 0.36),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 122,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteShadeThree,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Future.delayed(const Duration(milliseconds: 50), () {
                          showInviteDriverSheet(context);
                        });

                      },
                      child: Text(
                        "inviteDriver".tr,
                        style: sfProRegularTextstyle.copyWith(
                          fontSize: 20,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColors.greyShadeTen.withValues(alpha: 0.36),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "shareProfile".tr,
                        style: sfProRegularTextstyle.copyWith(
                          fontSize: 20,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 61,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text(
                      "Cancel".tr,
                      style: sfProRegularTextstyle.copyWith(
                        fontSize: 20,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

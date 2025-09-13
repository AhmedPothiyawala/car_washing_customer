import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/utils.dart';
import '../data/app_colors.dart';

class CustomSnackBar {
  static void successSnackBar({

    required String message,
    int seconds = 4,
  }) {
    double screenWidth = kWidth;

    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColors.appBackgroundColor,
        snackPosition: SnackPosition.TOP,
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: seconds),
        borderRadius: 8,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        padding: const EdgeInsets.all(12),
        messageText: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth * 0.7,
              child: Text(
                message,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Get.closeCurrentSnackbar(),
              child: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.close_rounded,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }

  static void errorSnackBar({

    required String message,
    int seconds = 4,
    int maxLines = 5,
    double? fontSize,
    Duration? duration,
    bool? isDismissible,
  }) {
    double screenWidth = kWidth;

    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColors.appBackgroundColor,
        snackPosition: SnackPosition.TOP,
        isDismissible: isDismissible ?? true,
        snackStyle: SnackStyle.FLOATING,
        duration: duration ?? Duration(seconds: seconds),

        borderRadius: 8,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        padding: const EdgeInsets.all(12),
        messageText: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth * 0.7,
              child: Text(
                message,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Get.closeCurrentSnackbar(),
              child: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.close_rounded,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }
}

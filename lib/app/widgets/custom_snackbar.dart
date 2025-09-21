import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/utils.dart';
import '../data/app_colors.dart';

class CustomSnackBar {
  static void successSnackBar({
    required String message,
    int seconds = 4,
    Color? backgroundColor,
    Color? textcolor
  }) {
    double screenWidth = kWidth;

    Get.showSnackbar(
      GetSnackBar(
        backgroundColor:backgroundColor?? AppColors.appBackgroundColor,
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
                style: TextStyle(
                  color:textcolor?? AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Get.closeCurrentSnackbar(),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.close_rounded,
                  size: 20,
                  color:textcolor?? AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
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
    Color? backgroundColor,
    Color? textcolor
  }) {
    double screenWidth = kWidth;

    Get.showSnackbar(
      GetSnackBar(
        backgroundColor:backgroundColor?? AppColors.appBackgroundColor,
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
                style:  TextStyle(
                  color:textcolor?? AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Get.closeCurrentSnackbar(),
              child:  Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.close_rounded,
                  size: 20,
                  color:textcolor?? AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}

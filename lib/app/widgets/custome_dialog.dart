import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/app_colors.dart';

class CustomeDialog extends StatefulWidget {
  const CustomeDialog({super.key});

  @override
  State<CustomeDialog> createState() => _CustomeDialogState();
}

class _CustomeDialogState extends State<CustomeDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Before logging in, please verify your account by clicking on the link sent to the email you used to register.",
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                        color: AppColors.appBackgroundColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                Get.back(closeOverlays: true);
                // await OpenMailApp.openMailApp(
                //   nativePickerTitle: 'Select email app to open',
                // );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: AppColors.appBackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

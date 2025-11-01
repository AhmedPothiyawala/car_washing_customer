
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../data/text_styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Notification",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 20,),
            Text(
              "notificationSetting".tr,
              style: sfProSemiBoldTextstyle.copyWith(
                fontSize: 18,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "mobileNotification".tr,
              style: sfProSemiBoldTextstyle.copyWith(
                fontSize: 14,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 10),

            NotificationTile(
              title: "Enable text message notification",
              value: true,
            ),
            NotificationTile(
              title: "Push notification",
              value: false,
            ),
            NotificationTile(
              title: "Ride Cancel Notification",
              value: true,
            ),

            const SizedBox(height: 20),

            Text(
              "emailNotification".tr,
              style: sfProSemiBoldTextstyle.copyWith(
                fontSize: 14,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 10),

            NotificationTile(
              title: "Promotions and announcements",
              value: false,
            ),
            NotificationTile(
              title: "Ride Cancel Notification",
              value: false,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final bool value;

  const NotificationTile({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: (_) {},
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

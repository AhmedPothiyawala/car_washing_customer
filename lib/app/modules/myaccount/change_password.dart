import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/app_colors.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteShadeTwo,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 22,
                    spreadRadius: 0,
                    color:
                    AppColors.shadowColorShadeTwo.withValues(alpha: 0.11),
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
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

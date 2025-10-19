import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../../../../data/app_colors.dart';
import '../../../../data/app_images.dart';
import '../../../../data/storage_key.dart';
import '../../../../data/text_styles.dart';
import '../../../../data/utils.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/storage_services/storage_services.dart';
import 'get_started_two.dart';

class GetStartedOne extends StatelessWidget {
  const GetStartedOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: kHeight * 0.6,
              width: kWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(fit: BoxFit.fill,image: AssetImage
                  (AppImages
                    .getStartedOne,)
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: kWidth * 0.7,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "gettingStartedWithPickUpMyCarAndPickMe".tr,maxLines: 4,
                  style: sfProBoldTextstyle.copyWith(
                      fontSize: 22, color: AppColors.blackColor),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: kWidth * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "loremIpsumDolorParagraph".tr,maxLines: 4,
                  style: sfProBoldTextstyle.copyWith(
                      fontSize: 18, color: AppColors.blackColor.withValues
                    (alpha: 90)),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppImages.getStartedOneNavigation,
                        height: 10,width: 56,),
                      const SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          final _storageService = Get.find<StorageService>();
                          _storageService.writeBool(key: StorageKey.isIntro, value: false);
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        child: Text(
                          "skip".tr,maxLines: 4,
                          style: poppinsRegularTextstyle.copyWith(
                              fontSize: 14, color: AppColors.blackColor
                              .withValues(alpha: 70)),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {

                      Get.toNamed(Routes.GET_STARTED_TWO);
                    },
                    child: Container(
                      height: 58,
                      width: 58,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages
                            .getStartedOneArrowImage),fit: BoxFit.fill)
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

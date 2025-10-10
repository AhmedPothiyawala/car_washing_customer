import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/text_styles.dart';
import 'package:go_burble_new/app/data/utils.dart';
import 'package:go_burble_new/app/routes/app_pages.dart';
import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../controllers/auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Future.delayed(const Duration(milliseconds: 1500), () async {
          bool isAutologin = await authController.checkAutoLogin();
          if (isAutologin) {
            Get.offAllNamed(Routes.BOTTOM_APP_BAR_VIEW);

            // if (!authController.userData.value.userData!.membershipActive!) {
            //   await Future.delayed(const Duration(milliseconds: 500), () async {
            //     // Get.to(() => const SubscribeView1());
            //   });
            // }
          } else {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
            Get.offAllNamed(Routes.LOGIN);
          }
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                height: 220,
                width: kWidth * 0.9,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.pickupMyCar),
                        fit: BoxFit.fill)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: kWidth * 0.95,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "pickupMyCar".tr,
                    style: poppinsSemiboldTextstyle,
                    children: [
                      const WidgetSpan(
                        child: SizedBox(width: 5),
                      ),
                      TextSpan(
                          text: "pickupMyCar2".tr,
                          style: poppinsSemiboldTextstyle.copyWith(
                              color: AppColors.primaryColor)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: kWidth * 0.95,
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(AppImages.splashVectorImage),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "splashSubtitle".tr,
                style: poppinsRegularTextstyle,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 348,
                  width: kWidth * 0.8,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.splashCarImage),
                          fit: BoxFit.fill)),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/routes/app_pages.dart';
import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../controllers/auth_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Future.delayed(const Duration(milliseconds: 1500), () async {
          bool isAutologin = await authController.checkAutoLogin();
          if (isAutologin) {
            Get.offAllNamed(Routes.HOME_VIEW);
            if (!authController.userData.value.userData!.membershipActive!) {
              await Future.delayed(const Duration(milliseconds: 500), () async {
                // Get.to(() => const SubscribeView1());
              });
            }
          } else {
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
      body: Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.burbleLogo), // Path to your splash image
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}

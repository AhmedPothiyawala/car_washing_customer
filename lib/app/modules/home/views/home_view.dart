import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';
import 'package:go_burble_new/app/data/app_images.dart';
import 'package:go_burble_new/app/data/text_styles.dart';
import 'package:go_burble_new/app/data/utils.dart';

import '../../../routes/app_pages.dart';
import '../../bottomnavigationbar/controllers/bottom_nav_bar_controllers.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.find<BottomNavBarControllers>();
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.appBackgroundColor,
        automaticallyImplyLeading: false,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 35),
              child: Text(
                "currentLocation".tr,
                style: sfProRegularTextstyle.copyWith(
                    color: AppColors.blackColor, fontSize: 12),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text("address".tr,
                    style: sfProSemiBoldTextstyle.copyWith(
                        color: AppColors.blackColor, fontSize: 14)),
                const SizedBox(
                  height: 10,
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.blackColor,
                ),
                const Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.notificationIcon),
                          fit: BoxFit.fill)),
                ),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: kWidth * 0.9,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(AppImages.homeBannerimage),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("bannerTitle".tr,
                            style: sfProSemiBoldTextstyle.copyWith(
                                color: AppColors.appBackgroundColor,
                                fontSize: 21)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: SizedBox(
                            width: kWidth * 0.6,
                            child: Text("bannerSubTitle".tr,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.appBackgroundColor,
                                    fontSize: 16))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 41,
                            width: kWidth * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: AppColors.appBackgroundColor,
                                border:
                                    Border.all(color: AppColors.primaryColor)),
                            child: Center(
                                child: Text("favoriteDriver".tr,
                                    style: sfProBoldTextstyle.copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 12))),
                          ),
                          const Spacer(),
                          Container(
                            height: 145,
                            width: kWidth * 0.5,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AppImages.carImage1),
                                    fit: BoxFit.fill)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("upcomingBooking".tr,
                    style: sfProMediumTextstyle.copyWith(
                        color: AppColors.blackColor, fontSize: 16)),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 72,
                  width: kWidth * 0.9,
                  decoration: BoxDecoration(
                      color: AppColors.appBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.secondaryColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.secondaryColor)),
                        child: Center(child: Image.asset(AppImages.carImage2)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("upcomingBookingTitle".tr,
                              style: sfProSemiBoldTextstyle.copyWith(
                                  color: AppColors.splashHeadingColor,
                                  fontSize: 14)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("upcomingBookingSubTitle".tr,
                              style: sfProRegularTextstyle.copyWith(
                                  color: AppColors.appWhiteGreyColor3,
                                  fontSize: 12)),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.blackColor)),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("ourServices".tr,
                    style: sfProMediumTextstyle.copyWith(
                        color: AppColors.blackColor, fontSize: 16)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PICK_ME_UP_VIEW);
                    },
                    child: Container(
                      height: 132,
                      width: kWidth * 0.45,
                      decoration: BoxDecoration(
                          color: AppColors.pickUpMyCarColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 74,
                                width: 124,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            AppImages.pickUpMyCarImage),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("pickUpMyCar".tr,
                                  style: sfProSemiBoldTextstyle.copyWith(
                                      color: AppColors.blackColor,
                                      fontSize: 16))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: AppColors.blackColor)),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      homeController.isPickMeUp(true);
                      Get.toNamed(Routes.PICK_ME_UP_VIEW);
                    },
                    child: Container(
                      height: 132,
                      width: kWidth * 0.45,
                      decoration: BoxDecoration(
                          color: AppColors.pickMeupColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 74,
                                width: 124,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(AppImages.pickMeUp),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("pickMeUp".tr,
                                  style: sfProSemiBoldTextstyle.copyWith(
                                      color: AppColors.blackColor,
                                      fontSize: 16))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: AppColors.blackColor)),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("todaysOffers".tr,
                        style: sfProMediumTextstyle.copyWith(
                            color: AppColors.blackColor, fontSize: 16)),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text("viewAll".tr,
                        style: sfProMediumTextstyle.copyWith(
                            color: AppColors.primaryColor, fontSize: 12)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      children: List.generate(4, (val) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            width: kWidth * 0.8,
                            decoration: BoxDecoration(
                                color: AppColors.offerSectionColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: kWidth * 0.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("offerTitle".tr,
                                              style:
                                                  sfProBoldTextstyle.copyWith(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 17)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: kWidth * 0.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("offerSubTitle".tr,
                                              style: sfProRegularTextstyle
                                                  .copyWith(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 13)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 26,
                                      width: kWidth * 0.35,
                                      decoration: BoxDecoration(
                                          color: AppColors.appBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text("bookNow".tr,
                                              style: sfProRegularTextstyle
                                                  .copyWith(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 13)),
                                          const Icon(
                                            Icons.arrow_forward,
                                            color: AppColors.blackColor,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  height: 108,
                                  width: kWidth * 0.3,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              AppImages.offerCarImage),
                                          fit: BoxFit.fill)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

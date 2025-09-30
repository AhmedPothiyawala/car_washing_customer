import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';
import 'package:go_burble_new/app/data/app_images.dart';
import 'package:go_burble_new/app/data/text_styles.dart';
import 'package:go_burble_new/app/data/utils.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/custome_dialog.dart';
import '../controllers/home_controller.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.find<HomeControllers>();
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (val1, val2) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CustomeDialog();
            });
      },
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        appBar: AppBar(
          surfaceTintColor: AppColors.appBackgroundColor,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "currentLocation".tr,
                  style: sfProRegularTextstyle.copyWith(
                      color: AppColors.blackColor, fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(() {
                    return Text(
                        homeController.currentAddress.value != null
                            ? " ${homeController.currentAddress.value!.administrativeArea}, ${homeController.currentAddress.value!.country}"
                            : "",
                        style: sfProSemiBoldTextstyle.copyWith(
                            color: AppColors.blackColor, fontSize: 14));
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.blackColor,
                  ),
                ],
              )
            ],
          ),
          actions: [
            InkWell(
                onTap: () {
                  Get.toNamed(Routes.NOTIFICATION_VIEW);
                },
                child: SvgPicture.asset(AppImages.notificationIcon)),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: SafeArea(
          child: Obx(() {
            return homeController.isLoding.value ||
                    homeController.isLoding2.value
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        shimmerHomeBanner(kWidth),
                        const SizedBox(height: 20),
                        // Section Title Placeholder
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                              height: 16, width: 120, color: Colors.grey[300]),
                        ),
                        const SizedBox(height: 10),
                        Center(child: shimmerBookingCard(kWidth)),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                              height: 16, width: 120, color: Colors.grey[300]),
                        ),
                        const SizedBox(height: 10),
                        // Our Services
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            shimmerServiceCard(kWidth),
                            shimmerServiceCard(kWidth),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Today's Offers
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Container(
                                height: 16,
                                width: 120,
                                color: Colors.grey[300]),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                  height: 16,
                                  width: 120,
                                  color: Colors.grey[300]),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const SizedBox(width: 20),
                              shimmerOfferCard(kWidth),
                              shimmerOfferCard(kWidth),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Container(
                            width: kWidth * 0.9,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage(AppImages.homeBannerimage),
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
                                  child: Text(
                                      homeController.homeData.value
                                          .configuration!.bannerDetails!.name
                                          .toString(),
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
                                      child: Text(
                                          homeController
                                              .homeData
                                              .value
                                              .configuration!
                                              .bannerDetails!
                                              .description
                                              .toString(),
                                          style: sfProRegularTextstyle.copyWith(
                                              color:
                                                  AppColors.appBackgroundColor,
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
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          color: AppColors.appBackgroundColor,
                                          border: Border.all(
                                              color: AppColors.primaryColor)),
                                      child: Center(
                                          child: Text(
                                              homeController
                                                  .homeData
                                                  .value
                                                  .configuration!
                                                  .bannerDetails!
                                                  .buttonText
                                                  .toString(),
                                              style:
                                                  sfProBoldTextstyle.copyWith(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontSize: 12))),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 145,
                                      width: kWidth * 0.5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(homeController
                                                  .homeData
                                                  .value
                                                  .configuration!
                                                  .bannerDetails!
                                                  .image
                                                  .toString()),
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
                        homeController.bookingData.value.bookings!.isEmpty
                            ? Center(
                                child: Text("noDataFound".tr,
                                    style: sfProMediumTextstyle.copyWith(
                                        color: AppColors.blackColor,
                                        fontSize: 16)),
                              )
                            : Center(
                              child: Container(
                                                        width: kWidth*0.9,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.center,

                                      children: List.generate(
                                          homeController.bookingData.value.bookings!
                                              .length, (val) {
                                        return Center(
                                          child: Container(
                                            width: kWidth * 0.9,
                                            decoration: BoxDecoration(
                                                color: AppColors.appBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    color:
                                                        AppColors.secondaryColor)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                                                  child: Container(
                                                    height: 56,
                                                    width: 56,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: AppColors
                                                                .secondaryColor)),
                                                    child: Center(
                                                        child: Image.asset(
                                                            AppImages.carImage2)),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        homeController
                                                            .bookingData
                                                            .value
                                                            .bookings![val]
                                                            .carClassTitleEn
                                                            .toString(),
                                                        style: sfProSemiBoldTextstyle
                                                            .copyWith(
                                                                color: AppColors
                                                                    .splashHeadingColor,
                                                                fontSize: 14)),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        homeController
                                                            .bookingData
                                                            .value
                                                            .bookings![val]
                                                            .remainingTime
                                                            .toString(),
                                                        style: sfProRegularTextstyle
                                                            .copyWith(
                                                                color: AppColors
                                                                    .appWhiteGreyColor3,
                                                                fontSize: 12)),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Container(
                                                  height: 28,
                                                  width: 28,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: AppColors
                                                              .blackColor)),
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
                                        );
                                      }),
                                    ),
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
                                homeController.drop([]);
                                homeController.pickup([]);
                                homeController
                                    .dropController([TextEditingController()]);
                                homeController.dropfocus([FocusNode()]);
                                homeController.isselectedTime("");
                                homeController.isselectedDate("");
                                homeController.pickupLocationController.clear();
                                homeController.getlocation();
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 74,
                                          width: 124,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      homeController
                                                          .homeData
                                                          .value
                                                          .configuration!
                                                          .servicesList![0]
                                                          .image
                                                          .toString()),
                                                  fit: BoxFit.fill)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            homeController
                                                .homeData
                                                .value
                                                .configuration!
                                                .servicesList![0]
                                                .name
                                                .toString(),
                                            style:
                                                sfProSemiBoldTextstyle.copyWith(
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
                                            border: Border.all(
                                                color: AppColors.blackColor)),
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
                                homeController.drop([]);
                                homeController.pickup([]);
                                homeController
                                    .dropController([TextEditingController()]);
                                homeController.dropfocus([FocusNode()]);
                                homeController.isselectedTime("");
                                homeController.isselectedDate("");
                                homeController.pickupLocationController.clear();
                                homeController.getlocation();
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 74,
                                          width: 124,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      homeController
                                                          .homeData
                                                          .value
                                                          .configuration!
                                                          .servicesList![1]
                                                          .image
                                                          .toString()),
                                                  fit: BoxFit.fill)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            homeController
                                                .homeData
                                                .value
                                                .configuration!
                                                .servicesList![1]
                                                .name
                                                .toString(),
                                            style:
                                                sfProSemiBoldTextstyle.copyWith(
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
                                            border: Border.all(
                                                color: AppColors.blackColor)),
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
                                      color: AppColors.blackColor,
                                      fontSize: 16)),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text("viewAll".tr,
                                  style: sfProMediumTextstyle.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 12)),
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
                                children: List.generate(
                                    homeController.homeData.value.configuration!
                                        .offersList!.length, (val) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Container(
                                      width: kWidth * 0.8,
                                      decoration: BoxDecoration(
                                          color: AppColors.offerSectionColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                    Text(
                                                        homeController
                                                            .homeData
                                                            .value
                                                            .configuration!
                                                            .offersList![val]
                                                            .name
                                                            .toString(),
                                                        style: sfProBoldTextstyle
                                                            .copyWith(
                                                                color: AppColors
                                                                    .blackColor,
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
                                                    Text(
                                                        homeController
                                                            .homeData
                                                            .value
                                                            .configuration!
                                                            .offersList![val]
                                                            .description
                                                            .toString(),
                                                        style: sfProRegularTextstyle
                                                            .copyWith(
                                                                color: AppColors
                                                                    .blackColor,
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
                                                    color: AppColors
                                                        .appBackgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        homeController
                                                            .homeData
                                                            .value
                                                            .configuration!
                                                            .offersList![val]
                                                            .buttonText
                                                            .toString(),
                                                        style: sfProRegularTextstyle
                                                            .copyWith(
                                                                color: AppColors
                                                                    .blackColor,
                                                                fontSize: 13)),
                                                    const Icon(
                                                      Icons.arrow_forward,
                                                      color:
                                                          AppColors.blackColor,
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
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        homeController
                                                            .homeData
                                                            .value
                                                            .configuration!
                                                            .offersList![val]
                                                            .image
                                                            .toString()),
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
                  );
          }),
        ),
      ),
    );
  }

  Widget shimmerHomeBanner(double kWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Center(
          child: Container(
            width: kWidth * 0.9,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 20,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 16,
                  width: kWidth * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: kWidth * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 120,
                      width: kWidth * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget shimmerBookingCard(double kWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: kWidth * 0.9,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[400]!),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Container(
                height: 56,
                width: 56,
                color: Colors.grey[400],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 14, width: 120, color: Colors.grey[400]),
                  const SizedBox(height: 8),
                  Container(height: 12, width: 100, color: Colors.grey[300]),
                ],
              ),
              const Spacer(),
              Container(
                height: 28,
                width: 28,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget shimmerServiceCard(double kWidth) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 132,
        width: kWidth * 0.45,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 74, width: 124, color: Colors.grey[400]),
            const SizedBox(height: 10),
            Container(height: 14, width: 80, color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }

  Widget shimmerOfferCard(double kWidth) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: kWidth * 0.8,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 16, width: 100, color: Colors.grey[400]),
                  const SizedBox(height: 10),
                  Container(height: 12, width: 150, color: Colors.grey[300]),
                  const SizedBox(height: 10),
                  Container(
                      height: 26,
                      width: kWidth * 0.35,
                      color: Colors.grey[300]),
                ],
              ),
              const Spacer(),
              Container(
                  height: 100, width: kWidth * 0.3, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}

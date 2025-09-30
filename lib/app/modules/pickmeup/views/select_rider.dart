import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_button.dart';
import '../../home/controllers/home_controller.dart';

class SelectRiderView extends StatelessWidget {
  SelectRiderView({super.key});
  final homeController = Get.find<HomeControllers>();
  final args = Get.arguments as Map;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  homeController.routeMarkers.clear();
                  homeController.routePolylines.clear();
                  Get.back();
                },
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteShadeTwo,
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.blackColor,
                  )),
                ),
              ),
            ],
          ),
        ),
        surfaceTintColor: AppColors.appBackgroundColor,
      ),
      // The HomeControllers dependency is already set up via GetBuilder
      body: SizedBox(
        height: kHeight*0.55,
        width: kWidth,
        child: GetBuilder<HomeControllers>(
          builder: (controller) {
            // Safely access the RxLists
            final pickupList = controller.pickup.value;
            final dropList = controller.drop.value;

            // --- Pickup Location Data ---
            final String pickupAddress =
                controller.pickupLocationController.text.isNotEmpty
                    ? controller.pickupLocationController.text
                    : "Pickup location address loading...";

            final LatLng initialTarget = pickupList.isNotEmpty
                ? LatLng(
                    pickupList[0]['lat']!,
                    pickupList[0]['long']!,
                  )
                : const LatLng(0, 0);

            // --- Drop Location Data (using the FIRST drop point for display) ---
            final String dropAddress =
                dropList.isNotEmpty && controller.dropController.value.isNotEmpty
                    ? controller.dropController.value[0].text
                    : "Drop location address loading...";

            final bool showDropContainer = dropList.isNotEmpty;

            return SizedBox(
              height: kHeight,
              width: kWidth,
              child: Stack(
                children: [
                  // 1. Google Map
                  GoogleMap(
                    initialCameraPosition: CameraPosition(target: initialTarget),
                    onMapCreated: (GoogleMapController mapController) {
                      controller.onMapCreated2(mapController);
                      Future.delayed(const Duration(milliseconds: 300), () {
                        controller.fitMapToAllPoints();
                      });
                    },
                    markers: controller.routeMarkers.value,
                    polylines: controller.routePolylines.value,
                    circles: controller.circles2.value,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                  ),
                ],
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: Obx(() {
        final navBarHeight = MediaQuery.of(context).viewPadding.bottom;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: kHeight * 0.6,
              decoration: const BoxDecoration(
                  color: AppColors.appBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    topLeft: Radius.circular(18),
                  )),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "selectRider".tr,
                            textAlign: TextAlign.center,
                            style:
                                sfProSemiBoldTextstyle.copyWith(fontSize: 18),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                        color: AppColors.greyShadeTwo,
                        indent: 15,
                        endIndent: 15,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          width: kWidth * 0.9,
                          decoration: BoxDecoration(
                            color: AppColors.skyShadeTwo,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${DateFormat("EEEE, MMM d").format(DateFormat("dd/MM/yyyy").parse(args['booking_date']))} at ${DateFormat("h:mm a").format(DateFormat("HH:mm").parse(args['booking_time']))}",
                                      style: sfProSemiBoldTextstyle.copyWith(
                                          fontSize: 14,
                                          color: AppColors.blackShadeTwo),
                                    ),
                                    const Spacer(),
                                    Container(
                                        height: 35,
                                        width: 35,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.skyShadeOne,
                                        ),
                                        child: SvgPicture.asset(
                                          AppImages.carIcon,
                                          fit: BoxFit.scaleDown,
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: AppColors.blackColor,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: kWidth * 0.7,
                                      child: Text(
                                        args['pickup'].text,
                                        style: sfProMediumTextstyle.copyWith(
                                            color: AppColors.blackColor),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return args['drop'][index].text != ""
                                        ? Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                color: AppColors.primaryColor,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: kWidth * 0.7,
                                                child: Text(
                                                  args['drop'][index].text,
                                                  style: sfProMediumTextstyle
                                                      .copyWith(
                                                          color: AppColors
                                                              .blackColor),
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox();
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 5,
                                    );
                                  },
                                  itemCount: args['drop'].length,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "estArrivalTime".tr,
                                      style: sfProMediumTextstyle.copyWith(
                                          color: AppColors.blackColor),
                                    ),
                                    Container(
                                      height: 14,
                                      width: 14,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImages.errorImage))),
                                    )
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: AppColors.skyShadeOne,
                                  indent: 15,
                                  endIndent: 15,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "totalAmount".tr,
                                      style: sfProMediumTextstyle.copyWith(
                                          color: AppColors.blackShadeTwo),
                                    ),
                                    const Spacer(),
                                    Text(
                                      double.tryParse(
                                        homeController
                                            .getCalculatedPriceData
                                            .value
                                            .data![homeController
                                                .isselectedCar.value]
                                            .baseRateWithOurFees
                                            .toString(),
                                      )!
                                          .toStringAsFixed(2),
                                      style: sfProMediumTextstyle.copyWith(
                                          color: AppColors.blackShadeTwo),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(() {
                            return Center(
                              child: InkWell(
                                onTap: () {
                                  homeController.isselectedCar(index);
                                  print(
                                      "Selected car index: ${homeController.isselectedCar.value}");
                                },
                                child: Container(
                                  width: kWidth * 0.9,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: homeController
                                                      .isselectedCar.value ==
                                                  index
                                              ? AppColors.primaryColor
                                              : AppColors.appBackgroundColor)),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Container(
                                              height: 66,
                                              width: 88,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          homeController
                                                              .getCalculatedPriceData
                                                              .value
                                                              .data![index]
                                                              .carClassImage
                                                              .toString()))),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                homeController
                                                    .getCalculatedPriceData
                                                    .value
                                                    .data![index]
                                                    .carClassTitleEn
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: sfProMediumTextstyle
                                                    .copyWith(
                                                        color: AppColors
                                                            .blackColor),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                  width: kWidth * 0.4,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "pickUPMyCarFirst2".tr,
                                                        style: sfProRegularTextstyle
                                                            .copyWith(
                                                                color: AppColors
                                                                    .blackColor,
                                                                fontSize: 12),
                                                      ),
                                                    ],
                                                  ))
                                            ],
                                          ),
                                          const Spacer(),
                                          Text(
                                            double.tryParse(
                                              homeController
                                                  .getCalculatedPriceData
                                                  .value
                                                  .data![index]
                                                  .baseRateWithOurFees
                                                  .toString(),
                                            )!
                                                .toStringAsFixed(2),
                                            textAlign: TextAlign.center,
                                            style:
                                                sfProMediumTextstyle.copyWith(
                                                    color:
                                                        AppColors.primaryColor),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 5,
                          );
                        },
                        itemCount: homeController
                            .getCalculatedPriceData.value.data!.length,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CustomButton(
                          onPressed: () {
                            Get.toNamed(Routes.CUSTOMER_DETAIL_VIEW,
                                arguments: {
                                  'service': args['service'],
                                  'transfer_type': args['transfer_type'],
                                  'booking_date': args['booking_date'],
                                  'booking_time': args['booking_time'],
                                  'pickup': args['pickup'],
                                  'drop': args['drop'],
                                  'pickuplat': args['pickuplat'],
                                  'droplat': args['droplat']
                                });
                          },
                          height: 50,
                          width: kWidth * 0.9,
                          borderRadius: BorderRadius.circular(12),
                          bgColor: AppColors.primaryColor,
                          childWidget: Center(
                              child: Text("continueBooking".tr,
                                  style: sfProMediumTextstyle.copyWith(
                                      fontSize: 16))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (navBarHeight > 0)
              Container(
                height: navBarHeight,
                width: double.infinity,
                color: AppColors
                    .appBackgroundColor, // or any color you want behind nav bar
              ),
          ],
        );
      }),
    );
  }
}

// Helper function (add this outside the build method or page class)
Widget _buildLocationContainer(
    BuildContext context, String address, String type, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            type.contains("Pickup") ? Icons.place : Icons.local_taxi,
            color: color,
            size: 20,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                address,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

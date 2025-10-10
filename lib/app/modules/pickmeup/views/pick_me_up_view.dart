import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/global_constant.dart';
import '../../../data/text_styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_drop_down_form_field.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../home/controllers/home_controller.dart';

class PickMeUpView extends StatelessWidget {
  PickMeUpView({super.key});
  final homeController = Get.find<HomeControllers>();

  final transferTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (val1, val2) {
        Get.back();
        homeController.drop([]);
        homeController.pickup([]);
        homeController.dropController([TextEditingController()]);
        homeController.dropfocus([FocusNode()]);
        homeController.isselectedTime("");
        homeController.isselectedDate("");
        homeController.pickupLocationController.clear();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.appBackgroundColor,
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                      homeController.drop([]);
                      homeController.pickup([]);
                      homeController.dropController([TextEditingController()]);
                      homeController.dropfocus([FocusNode()]);
                      homeController.isselectedTime("");
                      homeController.isselectedDate("");
                      homeController.pickupLocationController.clear();
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
                  const Spacer(),
                  Container(
                    height: 44,
                    width: kWidth * 0.3,
                    decoration: BoxDecoration(
                      color: AppColors.appBackgroundColor,
                      borderRadius: BorderRadius.circular(37),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withValues(alpha: 0.2),
                          blurRadius: 10,
                          offset:
                              const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.greyShadeOne),
                          child: Center(
                            child: Container(
                              height: 22,
                              width: 22,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage(AppImages.shapeTargetIcon)),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Center(
                            child: Text(
                          "location".tr,
                          style: sfProMediumTextstyle.copyWith(
                              fontSize: 12, color: AppColors.blackColor),
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
          body: SizedBox(
              height: kHeight * 0.55,
              width: kWidth,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(0, 0), // Initial placeholder
                  zoom: 1,
                ),
                // 🎯 FIX: Use the new setter method
                onMapCreated: (GoogleMapController mapController) {
                  // Assuming 'homeController' is the instance of HomeControllers
                  homeController.onMapCreated1(mapController);
                },
                circles: homeController.circles, // Use .value for RxSet
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                markers: homeController.markers, // Use .value for RxSet
              )),
          bottomNavigationBar: Obx(() {
            final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
            final navBarHeight = MediaQuery.of(context).viewPadding.bottom;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: kHeight * 0.5,
                    width: kWidth,
                    decoration: const BoxDecoration(
                      color: AppColors.appBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18),
                        topLeft: Radius.circular(18),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            homeController.isPickMeUp.value
                                ? "bookPickMeUp".tr
                                : "bookPickUpMyCar".tr,
                            textAlign: TextAlign.center,
                            style:
                                sfProSemiBoldTextstyle.copyWith(fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          thickness: 1,
                          color: AppColors.greyShadeTwo,
                          indent: 15,
                          endIndent: 15,
                        ),
                        const SizedBox(height: 10),
                        // This is the new scrollable section
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // Your existing content goes here...
                                // ... everything from the Row with the date/time pickers
                                // down to the "continue booking" button.
                                Row(
                                  children: [
                                    const SizedBox(width: 15),
                                    Obx(() {
                                      return Center(
                                        child: InkWell(
                                          onTap: () {
                                            homeController.selectdate(context);
                                          },
                                          child: CustomDropDownFormField(
                                            height: 50,
                                            contentPadding:
                                                const EdgeInsets.only(right: 8),
                                            hintStyle:
                                                sfProMediumTextstyle.copyWith(
                                                    fontSize: 12,
                                                    color:
                                                        AppColors.blackColor),
                                            textInputAction:
                                                TextInputAction.next,
                                            width: kWidth * 0.45,
                                            hintText: homeController
                                                        .isselectedDate.value !=
                                                    ""
                                                ? homeController
                                                    .isselectedDate.value
                                                : "selectDate".tr,
                                            borderRadiusAll:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            prefixIcon: SvgPicture.asset(
                                              AppImages.calenderIcon,
                                              fit: BoxFit.scaleDown,
                                            ),
                                            fillColor: AppColors.greyShadeThree,
                                            items: const [],
                                            onChanged: (value) {},
                                            borderColor: Colors.transparent,
                                            validator: (string) {
                                              if (string == null) {
                                                return "genderIsRequired".tr;
                                              }
                                              return null;
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      );
                                    }),
                                    const SizedBox(width: 15),
                                    Obx(() {
                                      return Center(
                                        child: InkWell(
                                          onTap: () {
                                            homeController.selectTime(context);
                                          },
                                          child: CustomDropDownFormField(
                                            height: 50,
                                            contentPadding:
                                                const EdgeInsets.only(right: 8),
                                            hintStyle:
                                                sfProMediumTextstyle.copyWith(
                                                    fontSize: 12,
                                                    color:
                                                        AppColors.blackColor),
                                            textInputAction:
                                                TextInputAction.next,
                                            width: kWidth * 0.45,
                                            hintText: homeController
                                                        .isselectedTime.value !=
                                                    ""
                                                ? homeController
                                                    .isselectedTime.value
                                                : "selectTime".tr,
                                            borderRadiusAll:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            prefixIcon: SvgPicture.asset(
                                              AppImages.clockIcon,
                                              fit: BoxFit.scaleDown,
                                            ),
                                            fillColor: AppColors.greyShadeThree,
                                            items: const [],
                                            onChanged: (value) {},
                                            borderColor: Colors.transparent,
                                            validator: (string) {
                                              if (string == null) {
                                                return "genderIsRequired".tr;
                                              }
                                              return null;
                                            },
                                            onFieldSubmitted: (value) {},
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 10),
                                    Column(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: AppColors.blackColor,
                                        ),
                                        Container(
                                          height: 65,
                                          width: 10,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      AppImages.verticleImage),
                                                  fit: BoxFit.scaleDown)),
                                        ),
                                        const Icon(
                                          Icons.location_on,
                                          color: AppColors.primaryColor,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "currentAddress".tr,
                                          style: sfProRegularTextstyle.copyWith(
                                              color: AppColors.greyShadeFour),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            homeController.pickupFocusNode.value
                                                .requestFocus();
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: SizedBox(
                                                  height: 30,
                                                  width: kWidth * 0.7,
                                                  child:
                                                      GooglePlaceAutoCompleteTextField(
                                                    focusNode: homeController
                                                        .pickupFocusNode.value,
                                                    textEditingController:
                                                        homeController
                                                            .pickupLocationController,
                                                    googleAPIKey: GlobalConstant
                                                        .mapSdkKeyAndroid,
                                                    boxDecoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: AppColors
                                                                .appBackgroundColor)),
                                                    inputDecoration: InputDecoration(
                                                        border: InputBorder
                                                            .none,
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder: InputBorder
                                                            .none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                        disabledBorder:
                                                            InputBorder.none,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        hintText:
                                                            "currentAddress".tr,
                                                        hintStyle: sfProMediumTextstyle
                                                            .copyWith(
                                                                color: AppColors
                                                                    .blackColor)),
                                                    isLatLngRequired: true,
                                                    getPlaceDetailWithLatLng:
                                                        (Prediction
                                                            prediction) async {
                                                      homeController.pickup([
                                                        {
                                                          "lat": double.parse(
                                                              prediction.lat
                                                                  .toString()),
                                                          "long": double.parse(
                                                              prediction.lng
                                                                  .toString())
                                                        }
                                                      ]);
                                                      homeController.updateCamerapost(
                                                          double.parse(
                                                              prediction.lat
                                                                  .toString()),
                                                          double.parse(
                                                              prediction.lng
                                                                  .toString()));
                                                      homeController.updateCircle(
                                                          double.parse(
                                                              prediction.lat
                                                                  .toString()),
                                                          double.parse(
                                                              prediction.lng
                                                                  .toString()));
                                                    },
                                                    itemClick: (Prediction
                                                        prediction) {
                                                      homeController
                                                              .pickupLocationController
                                                              .text =
                                                          prediction
                                                              .description!;
                                                      homeController
                                                              .pickupLocationController
                                                              .selection =
                                                          TextSelection.fromPosition(
                                                              TextPosition(
                                                                  offset: prediction
                                                                      .description!
                                                                      .length));
                                                    },
                                                    isCrossBtnShown: false,
                                                    textStyle:
                                                        sfProMediumTextstyle
                                                            .copyWith(
                                                                color: AppColors
                                                                    .blackColor),
                                                    placeType:
                                                        PlaceType.geocode,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    keyboardType:
                                                        TextInputType.text,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: SizedBox(
                                                      height: 12,
                                                      width: kWidth * 0.75,
                                                      child: const Divider(
                                                        color: AppColors
                                                            .greyShadeTwo,
                                                        endIndent: 15,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .appBackgroundColor,
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .blackColor,
                                                              width: 1),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                blurRadius: 24,
                                                                offset:
                                                                    const Offset(
                                                                        0, 4),
                                                                color: AppColors
                                                                    .greyShadeEight
                                                                    .withValues(
                                                                        alpha:
                                                                            0.25))
                                                          ]),
                                                      child: SvgPicture.asset(
                                                        AppImages.arrowSwapIcon,
                                                        fit: BoxFit.scaleDown,
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "dropOff".tr,
                                          style: sfProRegularTextstyle.copyWith(
                                              color: AppColors.greyShadeFour),
                                        ),
                                        Center(
                                          child: SizedBox(
                                            width: kWidth * 0.7,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.all(0),
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return InkWell(
                                                  onTap: () {
                                                    homeController
                                                        .dropfocus[index]
                                                        .requestFocus();
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Center(
                                                        child: SizedBox(
                                                          height: 30,
                                                          width: kWidth * 0.7,
                                                          child:
                                                              GooglePlaceAutoCompleteTextField(
                                                            textEditingController:
                                                                homeController
                                                                        .dropController[
                                                                    index],
                                                            googleAPIKey:
                                                                GlobalConstant
                                                                    .mapSdkKeyAndroid,
                                                            focusNode:
                                                                homeController
                                                                        .dropfocus[
                                                                    index],
                                                            boxDecoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .appBackgroundColor)),
                                                            inputDecoration: InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedErrorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                disabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .all(0),
                                                                hintText:
                                                                    "dropOff"
                                                                        .tr,
                                                                hintStyle:
                                                                    sfProMediumTextstyle
                                                                        .copyWith(
                                                                            color:
                                                                                AppColors.blackColor)),
                                                            isLatLngRequired:
                                                                true,
                                                            getPlaceDetailWithLatLng:
                                                                (Prediction
                                                                    prediction) {
                                                              if (index >= 0 &&
                                                                  index <
                                                                      homeController
                                                                          .drop
                                                                          .length) {
                                                                homeController
                                                                        .drop[
                                                                    index] = {
                                                                  "lat": double.parse(
                                                                      prediction
                                                                          .lat
                                                                          .toString()),
                                                                  "long": double.parse(
                                                                      prediction
                                                                          .lng
                                                                          .toString())
                                                                };
                                                              } else {
                                                                if (transferTypeController
                                                                        .text ==
                                                                    "Return") {
                                                                  homeController
                                                                      .dropController
                                                                      .add(
                                                                          TextEditingController());
                                                                  homeController
                                                                      .dropfocus
                                                                      .add(
                                                                          FocusNode());
                                                                  homeController
                                                                      .drop
                                                                      .add({
                                                                    "lat": double.parse(
                                                                        prediction
                                                                            .lat
                                                                            .toString()),
                                                                    "long": double.parse(
                                                                        prediction
                                                                            .lng
                                                                            .toString())
                                                                  });
                                                                } else {
                                                                  homeController
                                                                      .drop
                                                                      .add({
                                                                    "lat": double.parse(
                                                                        prediction
                                                                            .lat
                                                                            .toString()),
                                                                    "long": double.parse(
                                                                        prediction
                                                                            .lng
                                                                            .toString())
                                                                  });
                                                                }
                                                              }
                                                              print(
                                                                  "drop${homeController.drop}");
                                                            },
                                                            itemClick:
                                                                (Prediction
                                                                    prediction) {
                                                              homeController
                                                                      .dropController[
                                                                          index]
                                                                      .text =
                                                                  prediction
                                                                      .description!;
                                                              homeController
                                                                      .dropController[
                                                                          index]
                                                                      .selection =
                                                                  TextSelection.fromPosition(TextPosition(
                                                                      offset: prediction
                                                                          .description!
                                                                          .length));
                                                            },
                                                            isCrossBtnShown:
                                                                false,
                                                            textStyle: sfProMediumTextstyle
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .blackColor),
                                                            placeType: PlaceType
                                                                .geocode,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      SizedBox(
                                                        height: 12,
                                                        width: kWidth * 0.7,
                                                        child: const Divider(
                                                          color: AppColors
                                                              .greyShadeTwo,
                                                          endIndent: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              itemCount: homeController
                                                  .dropController.length,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "transferType".tr,
                                          style: sfProRegularTextstyle.copyWith(
                                              color: AppColors.greyShadeFour),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Center(
                                  child: CustomDropDownFormField(
                                    hintStyle: sfProMediumTextstyle.copyWith(
                                        fontSize: 12,
                                        color: AppColors.blackColor),
                                    textInputAction: TextInputAction.next,
                                    width: kWidth * 0.8,
                                    hintText: "singleRide".tr,
                                    borderRadiusAll: const BorderRadius.all(
                                        Radius.circular(0)),
                                    fillColor: AppColors.transparent,
                                    items: homeController.isPickMeUp.value ==
                                            true
                                        ? ['Single', 'Return']
                                            .map((option) => DropdownMenuItem(
                                                  value: option,
                                                  child: Text(option),
                                                ))
                                            .toList()
                                        : ['Single']
                                            .map((option) => DropdownMenuItem(
                                                  value: option,
                                                  child: Text(option),
                                                ))
                                            .toList(),
                                    onChanged: (value) {
                                      if (value == "Return" &&
                                          homeController
                                                  .dropController.length ==
                                              1) {
                                        homeController.dropController
                                            .add(TextEditingController());
                                        homeController.dropfocus
                                            .add(FocusNode());
                                        transferTypeController.text =
                                            value.toString();
                                      } else if (value == "Single" &&
                                          homeController.dropController.length >
                                              1) {
                                        homeController.dropController(
                                            [TextEditingController()]);
                                        homeController
                                            .drop([homeController.drop[0]]);
                                        transferTypeController.text =
                                            value.toString();
                                      } else {
                                        transferTypeController.text =
                                            value.toString();
                                      }
                                    },
                                    borderColor: Colors.transparent,
                                    onFieldSubmitted: (value) {},
                                    controller: null,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: CustomButton(
                                    onPressed: () {
                                      if (homeController.isselectedDate.value ==
                                          "") {
                                        CustomSnackBar.errorSnackBar(
                                            message:
                                                "selectedDateValidation".tr,
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            textcolor:
                                                AppColors.appBackgroundColor);
                                      } else if (homeController
                                              .isselectedTime.value ==
                                          "") {
                                        CustomSnackBar.errorSnackBar(
                                            message:
                                                "selectedTimeValidation".tr,
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            textcolor:
                                                AppColors.appBackgroundColor);
                                      } else if (homeController
                                          .pickupLocationController
                                          .text
                                          .isEmpty) {
                                        CustomSnackBar.errorSnackBar(
                                            message:
                                                "pickupLocationValidation".tr,
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            textcolor:
                                                AppColors.appBackgroundColor);
                                      } else if (homeController
                                          .dropController[0].text.isEmpty) {
                                        CustomSnackBar.errorSnackBar(
                                            message:
                                                "dropLocationValidation".tr,
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            textcolor:
                                                AppColors.appBackgroundColor);
                                      } else if (transferTypeController
                                          .text.isEmpty) {
                                        CustomSnackBar.errorSnackBar(
                                            message:
                                                "transferTypeValidation2".tr,
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            textcolor:
                                                AppColors.appBackgroundColor);
                                      } else if (transferTypeController.text ==
                                              "Return" &&
                                          homeController.drop.length < 2) {
                                        CustomSnackBar.errorSnackBar(
                                            message:
                                                "dropLocationValidation2".tr,
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            textcolor:
                                                AppColors.appBackgroundColor);
                                      } else {
                                        homeController
                                            .getbookingcalculatedprice(
                                                transferTypeController.text);
                                      }
                                    },
                                    height: 50,
                                    width: kWidth * 0.9,
                                    borderRadius: BorderRadius.circular(12),
                                    bgColor: AppColors.primaryColor,
                                    childWidget: Center(
                                        child: Text("continueBooking".tr,
                                            style: sfProMediumTextstyle
                                                .copyWith(fontSize: 16))),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (navBarHeight > 0 && isKeyboardOpen == false)
                  Container(
                    height: navBarHeight,
                    width: double.infinity,
                    color: AppColors
                        .appBackgroundColor, // or any color you want behind nav bar
                  ),
              ],
            );
          })),
    );
  }
}

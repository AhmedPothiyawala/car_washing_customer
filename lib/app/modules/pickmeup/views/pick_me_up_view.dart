
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/utils.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:pinput/pinput.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/global_constant.dart';
import '../../../data/text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_drop_down_form_field.dart';
import '../../home/controllers/home_controller.dart';

class PickMeUpView extends StatelessWidget {
  PickMeUpView({super.key});
  final homeController = Get.find<HomeControllers>();
  final pickupLocationController=TextEditingController();
  final transferTypeController=TextEditingController();

  List<TextEditingController>dropController=[TextEditingController()];
  List<Map<String, double>> pickup =[];
  List<Map<String, double>> drop=[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  image: AssetImage(AppImages.shapeTargetIcon)),
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
        body: Container(
          height: kHeight,
          width: kWidth,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.mapImage), fit: BoxFit.fill)),
        ),
        bottomNavigationBar: Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               SingleChildScrollView(
                child: Container(
                  width: kWidth,
                  decoration: const BoxDecoration(
                      color: AppColors.appBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18),
                        topLeft: Radius.circular(18),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            homeController.isPickMeUp.value
                                ? "bookPickMeUp".tr
                                : "bookPickUpMyCar".tr,
                            textAlign: TextAlign.center,
                            style: sfProSemiBoldTextstyle.copyWith(fontSize: 18),
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
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Obx(() {
                            return Center(
                              child: InkWell(
                                onTap: () {
                                  homeController.selectdate(context);
                                },
                                child: CustomDropDownFormField(
                                  height: 50,
                                  contentPadding: const EdgeInsets.only(right: 8),
                                  hintStyle: sfProMediumTextstyle.copyWith(
                                      fontSize: 12, color: AppColors.blackColor),
                                  textInputAction: TextInputAction.next,
                                  width: kWidth * 0.45,
                                  hintText:
                                      homeController.isselectedDate.value != ""
                                          ? homeController.isselectedDate.value
                                          : "selectDate".tr,
                                  borderRadiusAll:
                                      const BorderRadius.all(Radius.circular(30)),
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
                          const SizedBox(
                            width: 15,
                          ),
                          Obx(() {
                            return Center(
                              child: InkWell(
                                onTap: () {
                                  homeController.selectTime(context);
                                },
                                child: CustomDropDownFormField(
                                  height: 50,
                                  contentPadding: const EdgeInsets.only(right: 8),
                                  hintStyle: sfProMediumTextstyle.copyWith(
                                      fontSize: 12, color: AppColors.blackColor),
                                  textInputAction: TextInputAction.next,
                                  width: kWidth * 0.45,
                                  hintText:
                                      homeController.isselectedTime.value != ""
                                          ? homeController.isselectedTime.value
                                          : "selectTime".tr,
                                  borderRadiusAll:
                                      const BorderRadius.all(Radius.circular(30)),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
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
                                        image:
                                            AssetImage(AppImages.verticleImage),
                                        fit: BoxFit.scaleDown)),
                              ),
                              const Icon(
                                Icons.location_on,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "currentAddress".tr,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.greyShadeFour),
                              ),

                              Center(
                                child: SizedBox(
                                  height: 30,
                                  width: kWidth*0.7,
                                  child: GooglePlaceAutoCompleteTextField(
                                    textEditingController: pickupLocationController,
                                    googleAPIKey:GlobalConstant.mapSdkKeyAndroid,
                                    boxDecoration: BoxDecoration(
                                        border: Border.all(color:AppColors.appBackgroundColor )
                                    ),

                                    inputDecoration:  InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsetsGeometry.all(0),
                                      hintText:   "currentAddress".tr,
                                      hintStyle:  sfProMediumTextstyle.copyWith(
                                          color: AppColors.blackColor)
                                    ),



                                    isLatLngRequired:true,// if you required coordinates from place detail
                                    getPlaceDetailWithLatLng: (Prediction prediction) {
                                      pickup=[{"lat":double.parse(prediction.lat.toString()),"long":double.parse(prediction.lng.toString())}];
                                      // this method will return latlng with place detail
                                      print("placeDetails" + prediction.lng.toString());
                                    }, // this callback is called when isLatLngRequired is true
                                    itemClick: (Prediction prediction) {
                                      pickupLocationController.text=prediction.description!;
                                      pickupLocationController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                                    },

                                    // want to show close icon
                                    isCrossBtnShown: false,
                                    textStyle:  sfProMediumTextstyle.copyWith(
                                        color: AppColors.blackColor),

                                    // place type
                                    placeType: PlaceType.geocode,
                                    // keyboard type (defaults to TextInputType.streetAddress)
                                    keyboardType: TextInputType.text, // optional - defaults to streetAddress for better address input




                                  ),
                                ),
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: SizedBox(
                                      height: 12,
                                      width: kWidth * 0.75,
                                      child: const Divider(
                                        color: AppColors.greyShadeTwo,
                                        endIndent: 15,
                                      ),
                                    ),
                                  ),

                                  Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.appBackgroundColor,
                                        border: Border.all(
                                            color: AppColors.blackColor,
                                            width: 1),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 24,
                                                offset: Offset(0, 4),
                                                color: AppColors.greyShadeEight.withValues(alpha: 0.25)
                                            )
                                          ]
                                      ),
                                      child: SvgPicture.asset(
                                        AppImages.arrowSwapIcon,
                                        fit: BoxFit.scaleDown,
                                      ))
                                ],
                              ),
                              Text(
                                "dropOff".tr,
                                style: sfProRegularTextstyle.copyWith(
                                    color: AppColors.greyShadeFour),
                              ),

                              Center(
                                child: SizedBox(
                                  width: kWidth*0.7,

                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    padding: EdgeInsetsGeometry.zero,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                    return        Center(
                                      child: SizedBox(
                                        height: 30,
                                        width: kWidth*0.7,
                                        child: GooglePlaceAutoCompleteTextField(
                                          textEditingController: dropController[index],
                                          googleAPIKey:GlobalConstant.mapSdkKeyAndroid,
                                          boxDecoration: BoxDecoration(
                                              border: Border.all(color:AppColors.appBackgroundColor )
                                          ),

                                          inputDecoration:  InputDecoration(
                                              border: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              contentPadding: EdgeInsetsGeometry.all(0),
                                              hintText:   "dropOff".tr,
                                              hintStyle:  sfProMediumTextstyle.copyWith(
                                                  color: AppColors.blackColor)
                                          ),



                                          isLatLngRequired:true,// if you required coordinates from place detail
                                          getPlaceDetailWithLatLng: (Prediction prediction) {
                                                      if(index >= 0 && index < drop.length)
                                                        {
                                                          drop[index]={"lat":double.parse(prediction.lat.toString()),"long":double.parse(prediction.lng.toString())};
                                                        }
                                                      else{
                                                        drop=[{"lat":double.parse(prediction.lat.toString()),"long":double.parse(prediction.lng.toString())}];
                                                      }
                                                      print(drop);
                                          }, // this callback is called when isLatLngRequired is true
                                          itemClick: (Prediction prediction) {
                                            if(transferTypeController.text=="Single/Return")

                                           {
                                             dropController.add(TextEditingController());
                                             dropController[index].text=prediction.description!;
                                             dropController[index].selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                                           }
                                            else{
                                              dropController[index].text=prediction.description!;
                                              dropController[index].selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                                            }
                                          },

                                          // want to show close icon
                                          isCrossBtnShown: false,
                                          textStyle:  sfProMediumTextstyle.copyWith(
                                              color: AppColors.blackColor),

                                          // place type
                                          placeType: PlaceType.geocode,
                                          // keyboard type (defaults to TextInputType.streetAddress)
                                          keyboardType: TextInputType.text, // optional - defaults to streetAddress for better address input




                                        ),
                                      ),
                                    );
                                  }, separatorBuilder: (BuildContext context, int index) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 12,
                                          width: kWidth * 0.7,
                                          child: const Divider(
                                            color: AppColors.greyShadeTwo,
                                            endIndent: 15,
                                          ),
                                        ),
                                      ],
                                    );
                                  }, itemCount: dropController.length,),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 12,
                                width: kWidth * 0.7,
                                child: const Divider(
                                  color: AppColors.greyShadeTwo,
                                  endIndent: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
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
                              fontSize: 12, color: AppColors.blackColor),
                          textInputAction: TextInputAction.next,
                          width: kWidth * 0.8,
                          hintText: "singleRide".tr,
                          borderRadiusAll:
                              const BorderRadius.all(Radius.circular(0)),
                          fillColor: AppColors.transparent,
                          items: homeController.isPickMeUp.value==true?

                          ['Single', 'Single/Return']
                              .map((option) => DropdownMenuItem(
                                    value: option,
                                    child: Text(option),
                                  ))
                              .toList(): ['Single']
                              .map((option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ))
                              .toList(),
                          onChanged: (value) {
                            if(value=="Single/Return"&&transferTypeController.length==1)
                              {
                                dropController.add(TextEditingController());
                                transferTypeController.text=value.toString();
                              }
                            else{
                              transferTypeController.text=value.toString();
                            }
                          },
                          borderColor: Colors.transparent,

                          onFieldSubmitted: (value) {},
                          controller: null,
                        ),
                      ),



                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CustomButton(
                          onPressed: () {
                            Get.toNamed(Routes.SELECT_RIDER_VIEW);
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
            ],
          );
        }));
  }
}

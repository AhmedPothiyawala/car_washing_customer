import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_burble_new/app/data/utils.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../widgets/custom_button.dart';

class OrderSummaryView extends StatelessWidget {
  const OrderSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColors.appBackgroundColor,
        backgroundColor: AppColors.appBackgroundColor,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 15,),
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
                  child: const Center(child: Icon(Icons.close,color: AppColors.blackColor,)),
                ),
              ),


            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("orderSummery".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 18,color: AppColors.blackColor),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                     width: kWidth * 0.4,
                      child: Text("orderTimeDateDay".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),)),

                  SizedBox(
                      width: kWidth * 0.4,
                      child: Text("orderId".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),)),
                ],
              ),
              const SizedBox(height: 20,),
              const Divider(//
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 66,
                    width: 88,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppImages.bmwImage))
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    children: [
                    Text("pickUpMyCarFirst".tr,style: sfProMediumTextstyle.copyWith(color: AppColors.blackColor),),
                      const SizedBox(height: 5,
                      ),
                      Text("dropOffToday".tr,style: sfProMediumTextstyle.copyWith(color: AppColors.blackColor),),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20,),
              const Divider(//
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("transferTrip".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
                  Text("kilometer".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
                  Text("time".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
                  const SizedBox(width: 10,),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("service".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
                  Text("drivingRoute".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
                  Text("estimatedTravelTime".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
                  const SizedBox(width: 10,),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10,),
                  Column(
                    children: [
                      const Icon(Icons.location_on,color: AppColors.blackColor,),
                      Container(
                        height: 65,
                        width: 10,
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage(AppImages.verticleImage),fit: BoxFit.scaleDown)
                        ),
                      ),
                      const Icon(Icons.location_on,color: AppColors.primaryColor,),

                    ],
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("pickUpLocation".tr,style: sfProRegularTextstyle.copyWith(color: AppColors.greyShadeFour),),
                      const SizedBox(height: 10,),
                      Text("rainSwitzerland".tr,style: sfProMediumTextstyle.copyWith(color: AppColors.blackColor),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 12,
                        width: kWidth*0.7,
                        child: const Divider(
                          color: AppColors.greyShadeTwo,
                          endIndent: 15,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text("dropOff".tr,style: sfProRegularTextstyle.copyWith(color: AppColors.greyShadeFour),),
                      const SizedBox(height: 10,),
                      Text("arbedoCastioneSwitzerland".tr,style: sfProMediumTextstyle.copyWith(color: AppColors.blackColor),),
                      const SizedBox(height: 20,),
                      const SizedBox(height: 10,),


                    ],
                  ),

                ],
              ),
              const SizedBox(height: 20,),
              Text("customerDetail".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 18,color: AppColors.blackColor),),
              const SizedBox(height: 15,),
              Text("name".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
              const SizedBox(height: 5,),
              Text("john".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
              const SizedBox(height: 10,),
              const Divider(//
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children : [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,//companyName
                    children : [
                      Text("companyName".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                      Text("pickUpMyCarGmbh".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
                    ]
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Text("addition".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                        Text("dummyText".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),

                      ]
                  ),
                  const SizedBox(width: 20,),

                ],
          ),
              const SizedBox(height: 10,),
              const Divider(//
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children : [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Text("email".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                        Container(
                            width: kWidth * 0.4,
                            child: Text("emailIs".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),)),

                      ]
                  ),
                  const SizedBox(width: 8,),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Text("phone".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                        Text("phoneNumber41".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),

                      ]
                  ),
                  const SizedBox(width: 10,),

                ],
              ),
              const SizedBox(height: 10,),
              const Divider(//
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 20,),
              Text("remark".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
              const SizedBox(height: 5,),
              SizedBox(
                 width: kWidth * 0.9,
                  child: Text("remarkParagraph".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),)),
              const SizedBox(height: 10,),
              const Divider(
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 20,),
              Text("billingAddress".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 18,color: AppColors.blackColor),),
              const SizedBox(height: 15,),
              Text("name".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
              const SizedBox(height: 5,),
              Text("john".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
              const SizedBox(height: 10,),
              const Divider(//
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children : [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,//companyName
                      children : [
                        Text("companyName".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                        Text("pickUpMyCarGmbh".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
                      ]
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Text("addition".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                        Text("dummyText".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),

                      ]
                  ),
                  const SizedBox(width: 20,),

                ],
              ),
              const SizedBox(height: 10,),
              const Divider(//
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children : [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Text("email".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                        Container(
                            width: kWidth * 0.4,
                            child: Text("emailIs".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),)),

                      ]
                  ),
                  const SizedBox(width: 8,),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Text("phone".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                        Text("phoneNumber41".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),

                      ]
                  ),
                  const SizedBox(width: 10,),

                ],
              ),
              const SizedBox(height: 10,),
              const Divider(//
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 20,),
              Text("companyLocation".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
              const SizedBox(height: 5,),
              Text("companyLocationName".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
              const SizedBox(height: 10,),
              const Divider(//
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 20,),

              Text("dispatcherDetail".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 18,color: AppColors.blackColor),),
              const SizedBox(height: 15,),
              Text("dispatcherName".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
              const SizedBox(height: 5,),
              Text("dispatcherNameIs".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
              const SizedBox(height: 10,),
              const Divider(//
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children : [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,//companyName
                      children : [
                        Text("dispatcherPhone".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                        Text("dispatcherNumber".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
                      ]
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Text("orderNumber".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                        Text("oneToNine".tr,style: sfProRegularTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),

                      ]
                  ),
                  const SizedBox(width: 20,),

                ],
              ),
              const SizedBox(height: 10,),
              const Divider(//
                thickness: 1,
                color: AppColors.greyShadeTwo,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greenShadeTwo.withValues(alpha: 0.22),
                    ),
                    child: Image.asset(AppImages.moduloImage,cacheHeight: 21,cacheWidth: 21,),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("promotionApplied".tr,style: sfProRegularTextstyle.copyWith(fontSize: 16,color: AppColors.blackColor),),
                      const SizedBox(height: 3,),
                      Container(
                          width: kWidth * 0.75,
                          child: Text("earnPoints".tr,style: sfProRegularTextstyle.copyWith(fontSize: 12,color: AppColors.greenColor),)),

                    ],
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Text("paymentSummary".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 18,color: AppColors.blackColor),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("subTotal".tr,style: sfProRegularTextstyle.copyWith(fontSize: 16,color: AppColors.blackColor),),
                  Text("chf448".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 16,color: AppColors.blackColor),),

                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("promotion".tr,style: sfProRegularTextstyle.copyWith(fontSize: 16,color: AppColors.blackColor),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height:15 ,
                          width: 15,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(AppImages.errorImage))
                          ),
                        ),
                      )
                    ],
                  ),
                  Text("points".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 16,color: AppColors.greenColor),),

                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("texes&otherFee".tr,style: sfProRegularTextstyle.copyWith(fontSize: 16,color: AppColors.blackColor),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height:15 ,
                          width: 15,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(AppImages.errorImage))
                          ),
                        ),
                      )
                    ],
                  ),
                  Text("chf0".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 16,color: AppColors.greenColor),),

                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("total".tr,style: sfProRegularTextstyle.copyWith(fontSize: 16,color: AppColors.blackColor),),
                  Text("totalChf".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 16,color: AppColors.blackColor),),

                ],
              ),
              const SizedBox(height: 20,),
              Center(
                child: CustomButton(
                  onPressed: () {
                    //Get.toNamed(Routes.SELECT_RIDER_VIEW);
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
              const SizedBox(height: 20,),


            ],
                ),
        ),
    ),
    );
  }
}

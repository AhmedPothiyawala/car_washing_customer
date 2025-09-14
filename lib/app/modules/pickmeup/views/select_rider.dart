import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/utils.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_button.dart';

class SelectRiderView extends StatelessWidget {
  const SelectRiderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,

      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        automaticallyImplyLeading: false,
        systemOverlayStyle:  SystemUiOverlayStyle.dark,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Row(
            children: [
              const SizedBox(width: 15,),
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteShadeTwo,
                  ),
                  child: const Center(child: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.blackColor,)),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: kHeight,
        width: kWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.riderMapImage),fit: BoxFit.fill),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(

            decoration: const BoxDecoration(
                color: AppColors.appBackgroundColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(18),topLeft: Radius.circular(18),)
            ),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Align(
                    alignment: Alignment.center,
                    child:
                    Text("selectRider".tr,textAlign: TextAlign.center, style: sfProSemiBoldTextstyle.copyWith(fontSize: 18),)
                ),
                const SizedBox(height: 10,),
                const Divider(
                  thickness: 1,
                  color: AppColors.greyShadeTwo,
                  indent: 15,
                  endIndent: 15,
                ),
                const SizedBox(height: 10,),
                Center(
                  child: Container(
                    width: kWidth*0.9,
                    decoration: BoxDecoration(
                      color: AppColors.skyShadeTwo,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,top: 10,right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 5,),
                              Text("monday7September".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 14,color: AppColors.blackShadeTwo),),
                              const Spacer(),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.skyShadeOne,
                                ),
                                child: Center(child: Image.asset(AppImages.carIcon,cacheHeight: 12,cacheWidth: 16,)),
                              )
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined,color: AppColors.blackColor,),
                              const SizedBox(width: 5,),
                              Text("rainSwitzerland".tr,style: sfProMediumTextstyle.copyWith(color: AppColors.blackColor),),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined,color: AppColors.primaryColor,),
                              const SizedBox(width: 5,),
                              Text("arbedoCastioneSwitzerland".tr,style: sfProMediumTextstyle.copyWith(color: AppColors.blackColor),),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              const SizedBox(width: 5,),
                              Text("estArrivalTime".tr,style: sfProMediumTextstyle.copyWith(color: AppColors.blackColor),),
                              Container(
                                height: 14,
                                width: 14,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage(AppImages.errorImage))
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColors.skyShadeOne,
                            indent: 15,
                            endIndent: 15,
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              Text("totalAmount".tr,style: sfProMediumTextstyle.copyWith(color: AppColors.blackShadeTwo),),
                              const Spacer(),
                              Text("chf448".tr,style: sfProMediumTextstyle.copyWith(color: AppColors.blackShadeTwo),),
                            ],
                          ),
                          const SizedBox(height: 20,),


                        ],

                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),

                Container(
                  width: kWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primaryColor
                    )
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 5,),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height:66 ,
                              width: 88,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage(AppImages.bmwImage))
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("pickUPMyCarFirst".tr,textAlign: TextAlign.center, style: sfProMediumTextstyle.copyWith(color: AppColors.blackColor),),
                              const SizedBox(height: 3,),
                              SizedBox(
                                  width: kWidth*0.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("pickUPMyCarFirst2".tr, style: sfProRegularTextstyle.copyWith(color: AppColors.blackColor,fontSize: 12),),
                                    ],
                                  ))
                            ],
                          ),
                          Text("chf448".tr,textAlign: TextAlign.center, style: sfProMediumTextstyle.copyWith(color: AppColors.primaryColor),),

                        ],
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: kWidth * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),

                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 5,),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height:66 ,
                              width: 88,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage(AppImages.bmwImage))
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("pickUPMyCarFirst".tr,textAlign: TextAlign.center, style: sfProMediumTextstyle.copyWith(color: AppColors.blackColor),),
                              const SizedBox(height: 3,),
                              SizedBox(
                                  width: kWidth*0.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("pickUPMyCarFirst2".tr, style: sfProRegularTextstyle.copyWith(color: AppColors.blackColor,fontSize: 12),),
                                    ],
                                  ))
                            ],
                          ),

                          Text("chf448".tr,textAlign: TextAlign.center, style: sfProMediumTextstyle.copyWith(color: AppColors.primaryColor),),

                        ],
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: CustomButton(
                    onPressed: () {
                      Get.toNamed(Routes.CUSTOMER_DETAIL_VIEW);
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
          )
        ],
      ),
    );
  }
}

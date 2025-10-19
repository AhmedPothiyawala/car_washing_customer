import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/utils.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';


class RidesView extends StatelessWidget {
  const RidesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                height: 44,
                width: 44,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.appBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowWhiteColor,
                      offset: Offset(0, 4),
                      blurRadius: 22,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            "rides".tr,
            style: sfProSemiBoldTextstyle.copyWith(
              fontSize: 18,
              color: AppColors.blackColor,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 10),
            Container(
              width: kWidth,
              child: TabBar(
                isScrollable: true,
                indicatorColor: AppColors.primaryColor,
                indicatorWeight: 3,
                labelPadding: const EdgeInsets.only(right: 15,left: 5),
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.greyShadeFour,
                dividerColor: AppColors.transparent,
                labelStyle: sfProMediumTextstyle.copyWith(
                  fontSize: 14,
                ),
                unselectedLabelStyle: sfProMediumTextstyle.copyWith(
                  fontSize: 14,
                ),
                tabs: [
                  Tab(text: "All".tr),
                  Tab(text: "Upcoming".tr),
                  Tab(text: "Completed".tr),
                  Tab(text: "Cancelled".tr),
                ],
              ),
            ),

            const SizedBox(height: 20),

             Expanded(
               child: TabBarView(
                 children: [
                   //tab 1
                   Column(
                     children: [
                       Center(
                         child: Container(
                           width: kWidth * 0.9,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               color: AppColors.appBackgroundColor,
                               boxShadow: const [
                                 BoxShadow(
                                   color: Color(0x4DAEABBB),
                                   offset: Offset(0, 4),
                                   blurRadius: 34,
                                   spreadRadius: 0,
                                 ),
                               ]
                           ),
                           child: Padding(
                             padding: const EdgeInsets.only(left: 20.0,right: 20.0,
                                 top: 10,bottom: 10),
                             child: Column(

                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         const SizedBox(
                                           height: 10,
                                         ),
                                         Text(
                                           "orderId".tr,
                                           style: sfProSemiBoldTextstyle.copyWith(
                                               fontSize: 14, color: AppColors.blackColor),
                                         ),
                                         const SizedBox(
                                           height: 3,
                                         ),
                                         Text(
                                           "monday7September".tr,
                                           style: sfProRegularTextstyle.copyWith(
                                               fontSize: 14, color: AppColors.blackColor),
                                         ),
                                       ],
                                     ),
                                     const Spacer(),
                                     Container(
                                       height: 30,
                                       width: 70,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(3),
                                           border: Border.all(width: 1,color: AppColors.purpleColorShadeOne)
                                       ),
                                       child: Center(
                                         child: Text(
                                           "upcoming".tr,
                                           style: sfProRegularTextstyle.copyWith(
                                               fontSize: 11, color: AppColors.purpleColorShadeOne),
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 10,
                                 ),
                                 const Divider(
                                   thickness: 1,
                                   color: AppColors.greyShadeTwo,
                                 ),
                                 const SizedBox(
                                   height: 10,
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     SizedBox(
                                       height: 85,
                                       width: kWidth * 0.4,
                                       child: Stack(
                                         children: [
                                           Positioned(
                                             left: 47,
                                             top: 5,
                                             child: Container(
                                               height: 70,
                                               width: 89,
                                               decoration: const BoxDecoration(
                                                   image: DecorationImage(
                                                       image: AssetImage(AppImages.bmwImage),
                                                       fit: BoxFit.fill)),
                                             ),
                                           ),
                                           Container(
                                             height: 70,
                                             width: 72,
                                             decoration: const BoxDecoration(
                                                 shape: BoxShape.circle,
                                                 image: DecorationImage(
                                                     image:
                                                     AssetImage(AppImages.richardMendozaImage),
                                                     fit: BoxFit.fill)),
                                           ),

                                         ],
                                       ),
                                     ),
                                     const Spacer(),
                                     SizedBox(
                                       width: kWidth * 0.4,
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text(
                                             "pickUpMyCarFirst".tr,
                                             maxLines: 2,
                                             style: sfProMediumTextstyle.copyWith(
                                                 fontSize: 16, color: AppColors.blackColor),
                                           ),
                                           Text(
                                             "misterRichardMendoza".tr,
                                             maxLines: 2,
                                             style: sfProMediumTextstyle.copyWith(
                                                 fontSize: 16, color: AppColors.blackColor),
                                           ),
                                           Text(
                                             "driver".tr,
                                             maxLines: 2,
                                             style: sfProRegularTextstyle.copyWith(
                                                 fontSize: 12, color: AppColors.blackColor),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 10,
                                 ),

                                 const Divider(
                                   thickness: 1,
                                   color: AppColors.greyShadeTwo,
                                 ),
                                 const SizedBox(
                                   height: 5,
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     SvgPicture.asset(AppImages.blackCarIcon,height: 16,
                                       width: 10,),
                                     const SizedBox(width: 15,),
                                     Text(
                                       "reBookRide".tr,
                                       maxLines: 2,
                                       style: sfProMediumTextstyle.copyWith(
                                           fontSize: 12, color: AppColors.blackColor),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 5,
                                 ),

                               ],
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                   //tab 2
                   Center(child: Text("Upcoming Rides")),
                   //tab 3
                   Center(child: Text("Completed Rides")),
                   //tab 4
                   Center(child: Text("Cancelled Rides")),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
}

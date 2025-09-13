import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../data/text_styles.dart';
import '../../../data/utils.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_drop_down_form_field.dart';
import '../../../widgets/custom_text_form_field.dart';

class CustomerDetailView extends StatelessWidget {
   CustomerDetailView({super.key});
   bool isChecked = false;

   final globalFormKey = GlobalKey<FormState>();
   

  final nameController =TextEditingController();
  final surNameController =TextEditingController();
  final emailController =TextEditingController();
  final phoneController =TextEditingController();
  final remarkController =TextEditingController();
  final companyName =TextEditingController();
  final supplementController =TextEditingController();
  final streetNumberController =TextEditingController();
  final placeController =TextEditingController();
  final addressController =TextEditingController();
  final cantonController =TextEditingController();
  final postalCodeController =TextEditingController();
  final landController =TextEditingController();
  final dispatcherNameController =TextEditingController();
  final dispatcherPhoneController =TextEditingController();
  final orderNumberController =TextEditingController();
  final customerNameController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColors.appBackgroundColor,
        title: Text("bookPickUpMyCar",style: poppinsSemiboldTextstyle.copyWith(fontSize: 18,color: AppColors.blackColor),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
                  child: const Center(child: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.blackColor,)),
                ),
              ),


            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Center(
              child: Container(
                width: kWidth*0.95,
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
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("customerDetail".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 18,color: AppColors.blackColor),),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("name".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                          const SizedBox(height: 5,),
                          CustomTextFormField(
                            hintText: "john".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                            width: kWidth * 0.47,
                            borderRadiusAll: const BorderRadius.all(
                                Radius.circular(12)),
                            controller: nameController,
                            fillColor: AppColors.appBackgroundColor,
                            borderColor: AppColors.appWhiteGreyColor,

                            validator: (string) {
                              if (string == null || string.isEmpty) {
                                return "enterName".tr;
                              }
                              return null;
                            },
                                                    ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("surName".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                          const SizedBox(height: 5,),
                          CustomTextFormField(
                            hintText: "doe".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),

                            width: kWidth * 0.47,
                            borderRadiusAll: const BorderRadius.all(
                                Radius.circular(12)),
                            controller: surNameController,
                            fillColor: AppColors.appBackgroundColor,
                            borderColor: AppColors.appWhiteGreyColor,
                            validator: (string) {
                              if (string == null || string.isEmpty) {
                                return "enterName".tr;
                              }
                              return null;
                            },
                          ),
                        ],

                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("email".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                          const SizedBox(height: 5,),
                          CustomTextFormField(
                            hintText: "emailIs".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                            width: kWidth * 0.47,
                            borderRadiusAll: const BorderRadius.all(
                                Radius.circular(12)),
                            controller: emailController,
                            fillColor: AppColors.appBackgroundColor,
                            borderColor: AppColors.appWhiteGreyColor,

                            validator: (string) {
                              if (string == null || string.isEmpty) {
                                return "enterName".tr;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("phone".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackShadeTwo),),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              Container(
                                height: 65,
                                width: kWidth * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.appWhiteGreyColor,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 3,),
                                    Container(
                                      width: 24,
                                      decoration:const BoxDecoration(
                                          image: DecorationImage(image: AssetImage(AppImages.flagImage))
                                      ),
                                    ),
                                    Text("countryCode".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                                    const Icon(Icons.keyboard_arrow_down,color: AppColors.greyShadeFive,),
                                    const SizedBox(width: 2,),
                                  ],
                                ),
                              ),
                              CustomTextFormField(
                                hintText: "phoneNumber".tr,
                                width: kWidth * 0.27,
                                hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                                borderRadiusAll: const BorderRadius.all(
                                    Radius.circular(12)),
                                controller: surNameController,
                                fillColor: AppColors.appBackgroundColor,
                                borderColor: AppColors.appWhiteGreyColor,
                                validator: (string) {
                                  if (string == null || string.isEmpty) {
                                    return "enterName".tr;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),

                        ],

                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text("remark".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                  const SizedBox(height: 5,),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.appBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: AppColors.appWhiteGreyColor
                          )
                      ),
                      child: CustomTextFormField(
                        hintText: "remarkParagraph".tr,
                        hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                        width: kWidth * 0.95,
                        borderRadiusAll: const BorderRadius.all(
                            Radius.circular(12)),
                        controller: nameController,
                        fillColor: AppColors.appBackgroundColor,
                        borderColor: AppColors.appWhiteGreyColor,

                        validator: (string) {
                          if (string == null || string.isEmpty) {
                            return "enterName".tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("billingAddress".tr,style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),

                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("companyName".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                          const SizedBox(height: 5,),
                          CustomTextFormField(
                            hintText: "pickUpMyCarGmbh".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                            width: kWidth * 0.47,
                            borderRadiusAll: const BorderRadius.all(
                                Radius.circular(12)),
                            controller: nameController,
                            fillColor: AppColors.appBackgroundColor,
                            borderColor: AppColors.appWhiteGreyColor,

                            validator: (string) {
                              if (string == null || string.isEmpty) {
                                return "enterName".tr;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("supplement".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                          const SizedBox(height: 5,),
                          CustomTextFormField(
                            hintText: "staldenBachStrasse".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                            width: kWidth * 0.47,
                            borderRadiusAll: const BorderRadius.all(
                                Radius.circular(12)),
                            controller: surNameController,
                            fillColor: AppColors.appBackgroundColor,
                            borderColor: AppColors.appWhiteGreyColor,
                            validator: (string) {
                              if (string == null || string.isEmpty) {
                                return "enterName".tr;
                              }
                              return null;
                            },
                          ),
                        ],

                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("streetNumber".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                          const SizedBox(height: 5,),
                          CustomTextFormField(
                            hintText: "streetNumberIs".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                            width: kWidth * 0.47,
                            borderRadiusAll: const BorderRadius.all(
                                Radius.circular(12)),
                            controller: nameController,
                            fillColor: AppColors.appBackgroundColor,
                            borderColor: AppColors.appWhiteGreyColor,

                            validator: (string) {
                              if (string == null || string.isEmpty) {
                                return "enterName".tr;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("place".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                          const SizedBox(height: 5,),
                          CustomTextFormField(
                            hintText: "staldenBachStrasse".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),

                            width: kWidth * 0.47,
                            borderRadiusAll: const BorderRadius.all(
                                Radius.circular(12)),
                            controller: surNameController,
                            fillColor: AppColors.appBackgroundColor,
                            borderColor: AppColors.appWhiteGreyColor,
                            validator: (string) {
                              if (string == null || string.isEmpty) {
                                return "enterName".tr;
                              }
                              return null;
                            },
                          ),
                        ],

                      ),
                    ],
                  ),
                  Text("addressText".tr,style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomTextFormField(
                        hintText: "addresssStaldenbachstrasse".tr,
                        hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                        width: kWidth * 0.95,
                        borderRadiusAll: const BorderRadius.all(
                            Radius.circular(12)),
                        controller: nameController,
                        fillColor: AppColors.appBackgroundColor,
                        borderColor: AppColors.appWhiteGreyColor,
                        suffixIcon:   Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.greyShadeOne
                            ),
                            child: Center(
                              child: Container(
                                height: 22,
                                width: 22,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage(AppImages.shapeTargetIcon)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        validator: (string) {
                          if (string == null || string.isEmpty) {
                            return "enterName".tr;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("canton".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                          const SizedBox(height: 5,),
                          CustomTextFormField(
                            hintText: "pfäffikonSZ".tr,
                            hintStyle:  sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                            width: kWidth * 0.47,
                            borderRadiusAll: const BorderRadius.all(
                                Radius.circular(12)),
                            controller: nameController,
                            fillColor: AppColors.appBackgroundColor,
                            borderColor: AppColors.appWhiteGreyColor,

                            validator: (string) {
                              if (string == null || string.isEmpty) {
                                return "enterName".tr;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("postalCode".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                          const SizedBox(height: 5,),
                          CustomTextFormField(
                            hintText: "postalCodeIs".tr,
                            hintStyle:  sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                            width: kWidth * 0.47,
                            borderRadiusAll: const BorderRadius.all(
                                Radius.circular(12)),
                            controller: surNameController,
                            fillColor: AppColors.appBackgroundColor,
                            borderColor: AppColors.appWhiteGreyColor,
                            validator: (string) {
                              if (string == null || string.isEmpty) {
                                return "enterName".tr;
                              }
                              return null;
                            },
                          ),
                        ],

                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),
                  Text("land".tr,style: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),),
                  const SizedBox(height: 5,),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.appBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: AppColors.appWhiteGreyColor
                          )
                      ),
                      child: CustomDropDownFormField(
                        hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                        textInputAction:
                        TextInputAction.next,
                        width: kWidth * 0.95,
                        hintText: "switzerland".tr,
                        borderRadiusAll:
                        const BorderRadius.all(
                            Radius.circular(30)),

                        fillColor:
                        AppColors.appBackgroundColor,
                        items: ['Male', 'Female']
                            .map((option) =>
                            DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            ))
                            .toList(),
                        onChanged: (value) {},
                        borderColor: AppColors.transparent,
                        validator: (string) {
                          if (string == null) {
                            return "genderIsRequired".tr;
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {

                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text("dispatcherDetail".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 16,color: AppColors.blackColor),),
                  const SizedBox(height: 20,),
                  Text("dispatcherName".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                  const SizedBox(height: 5,),
                  CustomTextFormField(
                    hintText: "dispatcherNameIs".tr,
                    hintStyle:  sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                    width: kWidth * 0.95,
                    borderRadiusAll: const BorderRadius.all(
                        Radius.circular(12)),
                    controller: nameController,
                    fillColor: AppColors.appBackgroundColor,
                    borderColor: AppColors.appWhiteGreyColor,

                    validator: (string) {
                      if (string == null || string.isEmpty) {
                        return "enterName".tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("dispatcherPhone".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackShadeTwo),),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              Container(
                                height: 65,
                                width: kWidth * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.appWhiteGreyColor,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 3,),
                                    Container(
                                      width: 24,
                                      decoration:const BoxDecoration(
                                          image: DecorationImage(image: AssetImage(AppImages.flagImage))
                                      ),
                                    ),
                                    Text("countryCode".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                                    const Icon(Icons.keyboard_arrow_down,color: AppColors.greyShadeFive,),
                                    const SizedBox(width: 2,),
                                  ],
                                ),
                              ),
                              CustomTextFormField(
                                hintText: "phoneNumber".tr,
                                width: kWidth * 0.27,
                                hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                                borderRadiusAll: const BorderRadius.all(
                                    Radius.circular(12)),
                                controller: surNameController,
                                fillColor: AppColors.appBackgroundColor,
                                borderColor: AppColors.appWhiteGreyColor,
                                validator: (string) {
                                  if (string == null || string.isEmpty) {
                                    return "enterName".tr;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),

                        ],

                      ),
                      const Spacer(),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("orderNumber".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                          const SizedBox(height: 5,),
                          CustomTextFormField(
                            hintText: "oneToNine".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                            width: kWidth * 0.47,
                            borderRadiusAll: const BorderRadius.all(
                                Radius.circular(12)),
                            controller: emailController,
                            fillColor: AppColors.appBackgroundColor,
                            borderColor: AppColors.appWhiteGreyColor,

                            validator: (string) {
                              if (string == null || string.isEmpty) {
                                return "enterName".tr;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text("customerDetail".tr,style: sfProSemiBoldTextstyle.copyWith(fontSize: 16,color: AppColors.blackColor),),
                  const SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("customerName".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                          const SizedBox(height: 5,),
                          CustomTextFormField(
                            hintText: "dispatcherNameIs".tr,
                            hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                            width: kWidth * 0.47,
                            borderRadiusAll: const BorderRadius.all(
                                Radius.circular(12)),
                            controller: emailController,
                            fillColor: AppColors.appBackgroundColor,
                            borderColor: AppColors.appWhiteGreyColor,

                            validator: (string) {
                              if (string == null || string.isEmpty) {
                                return "enterName".tr;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const Spacer(),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("phone".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackShadeTwo),),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              Container(
                                height: 65,
                                width: kWidth * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.appWhiteGreyColor,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 3,),
                                    Container(
                                      width: 24,
                                      decoration:const BoxDecoration(
                                          image: DecorationImage(image: AssetImage(AppImages.flagImage))
                                      ),
                                    ),
                                    Text("countryCode".tr,style: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.blackColor),),
                                    const Icon(Icons.keyboard_arrow_down,color: AppColors.greyShadeFive,),
                                    const SizedBox(width: 2,),
                                  ],
                                ),
                              ),
                              CustomTextFormField(
                                hintText: "phoneNumber".tr,
                                width: kWidth * 0.27,
                                hintStyle: sfProMediumTextstyle.copyWith(fontSize: 14,color: AppColors.blackColor),
                                borderRadiusAll: const BorderRadius.all(
                                    Radius.circular(12)),
                                controller: surNameController,
                                fillColor: AppColors.appBackgroundColor,
                                borderColor: AppColors.appWhiteGreyColor,
                                validator: (string) {
                                  if (string == null || string.isEmpty) {
                                    return "enterName".tr;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),

                        ],

                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                       Get.toNamed(Routes.ORDER_SUMMARY_VIEW);
                      },
                      height: 50,
                      width: kWidth * 0.95,
                      borderRadius: BorderRadius.circular(12),
                      bgColor: AppColors.primaryColor,
                      childWidget: Center(
                          child: Text("bookingOverView".tr,
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
      ),
    );
  }
}

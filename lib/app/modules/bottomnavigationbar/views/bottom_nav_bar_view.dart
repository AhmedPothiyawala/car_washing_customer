import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';
import 'package:go_burble_new/app/data/app_images.dart';
import 'package:go_burble_new/app/modules/bottomnavigationbar/controllers/bottom_nav_bar_controllers.dart';

import '../../../data/text_styles.dart';
import 'package:flutter/services.dart';

import '../../home/views/home_view.dart';

class BottomNavBarView extends StatefulWidget {
   BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  List _navbaricon=[AppImages.homeIcon,AppImages.ridesIcon,AppImages.favIcon,AppImages.accountIcon];

   List _navbarlable=["home".tr,"rides".tr,"fav".tr,"myAccount".tr];
  List _pages=[HomeView(),HomeView(),HomeView(),HomeView()];

   final bottomNavBarController = Get.find<BottomNavBarControllers>();
  @override
  void initState() {


    // if (widget.isNotLogged == null) {
    //   authController.normalLogout();
    // }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(
     () {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
               backgroundColor: AppColors.appBackgroundColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: bottomNavBarController.isPageIndex.value,
              selectedLabelStyle: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.primaryColor),
              unselectedLabelStyle: sfProMediumTextstyle.copyWith(fontSize: 12,color: AppColors.bottomAppBarIconColor),
              selectedItemColor:AppColors.primaryColor ,
              unselectedItemColor:AppColors.bottomAppBarIconColor ,
             onTap: bottomNavBarController.selectedindex,
              items: List.generate(_navbaricon.length,(val){
            return BottomNavigationBarItem(



                icon: SvgPicture.asset(_navbaricon[val],colorFilter: const ColorFilter.mode(AppColors.bottomAppBarIconColor, BlendMode.srcIn),),
             activeIcon: SvgPicture.asset(_navbaricon[val],colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),),
              label: _navbarlable[val]
            );
          })),
          body: _pages[bottomNavBarController.isPageIndex.value],
        );
      }
    );
  }
}

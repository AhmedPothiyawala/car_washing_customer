import 'package:get/get.dart';
import 'package:go_burble_new/app/modules/bottomnavigationbar/controllers/bottom_nav_bar_controllers.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarControllers(), permanent: true);
  }
}

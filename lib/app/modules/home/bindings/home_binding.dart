import 'package:get/get.dart';
import 'package:go_burble_new/app/modules/home/controllers/home_controller.dart';



class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
  }
}


import 'package:get/get.dart';

class BottomNavBarControllers extends GetxController {
  final RxInt _isPageIndex = 0.obs;

  RxInt get isPageIndex => _isPageIndex;

  final RxBool _isPickMeUp = false.obs;

  RxBool get isPickMeUp => _isPickMeUp;

  void selectedindex(int val) {
    _isPageIndex(val);
  }
}

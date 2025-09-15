
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxBool _isPickMeUp = false.obs;

  RxBool get isPickMeUp => _isPickMeUp;
}

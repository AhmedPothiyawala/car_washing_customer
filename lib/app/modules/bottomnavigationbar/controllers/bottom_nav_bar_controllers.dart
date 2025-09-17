import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomNavBarControllers extends GetxController {
  final RxInt _isPageIndex = 0.obs;

  RxInt get isPageIndex => _isPageIndex;

  final RxBool _isPickMeUp = false.obs;

  final RxString _isselectedDate = "".obs;
  final RxString _isselectedTime = "".obs;
  RxBool get isPickMeUp => _isPickMeUp;
  RxString get isselectedDate => _isselectedDate;
  RxString get isselectedTime => _isselectedTime;
  void selectedindex(int val) {
    _isPageIndex(val);
  }

  Future<void> selectdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      _isselectedDate(
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}");
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickedTime != null) {
      _isselectedTime("${pickedTime.hour}:${pickedTime.minute}");
    }
  }
}

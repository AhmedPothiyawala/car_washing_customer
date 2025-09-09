import 'dart:io';
import 'package:go_burble_new/app/data/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class updateDialog {
  void showCupertinoUpdateDialog(
      BuildContext context, String text, bool isShow) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: CupertinoAlertDialog(
            title: const Text('Update App?'),
            content: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  text,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Release Notes:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('Minor updates and improvements.'),
              ],
            ),
            actions: isShow == false
                ? [
                    CupertinoDialogAction(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('LATER'),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        Platform.isAndroid
                            ? launchApplication(Uri.parse(
                                'https://play.google.com/store/apps/details?id=com.burble.life'))
                            : launchApplication(Uri.parse(
                                'https://apps.apple.com/us/app/go-burble/id6473879013'));
                      },
                      child: const Text('UPDATE NOW'),
                    ),
                  ]
                : [
                    CupertinoDialogAction(
                      onPressed: () {
                        Platform.isAndroid
                            ? launchApplication(Uri.parse(
                                'https://play.google.com/store/apps/details?id=com.burble.life'))
                            : launchApplication(Uri.parse(
                                'https://apps.apple.com/us/app/go-burble/id6473879013'));
                      },
                      child: const Text('UPDATE NOW'),
                    ),
                  ],
          ),
        );
      },
    );
  }
}

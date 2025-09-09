import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_burble_new/app/data/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../data/global_constant.dart';
import '../../data/storage_key.dart';
import '../../services/storage_services/storage_services.dart';
import '../authentication/controllers/auth_controller.dart';

class Custome_Webview extends StatefulWidget {
  final String url;
  bool paymentURL = false;
  Custome_Webview({super.key, required this.url, required this.paymentURL});

  @override
  State<Custome_Webview> createState() => _Custome_WebviewState();
}

class _Custome_WebviewState extends State<Custome_Webview> {
  late WebViewController webViewController;
  double progress = 0;
  final authController = Get.find<AuthController>();
  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..currentUrl()
      ..setNavigationDelegate(
        NavigationDelegate(
          onUrlChange: (url) {
            if (widget.paymentURL == true &&
                url.url.toString() ==
                    "https://burble.life/dailyburblequotes/thanks") {
              final storageService = Get.find<StorageService>();
              authController.userData.value.userData!.membershipActive = true;
              authController.update();
              storageService.writeString(
                  key: StorageKey.userData,
                  value: jsonEncode(authController.userData.value));
              // Get.off(() => Thankyou());
            }
          },
          onProgress: (progress) {
            setState(() {
              this.progress = progress / 100;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.appBackgroundColor,
          centerTitle: true,
          leadingWidth: 50,
          leading: widget.url == 'https://goburble.com/blog'
              ? const SizedBox.shrink()
              : IconButton(
                  color: AppColors.headingColor,
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    Get.back();
                  },
                ),
          iconTheme: const IconThemeData(
            color: AppColors.whiteColor,
            size: 33,
          ),
          titleSpacing: 0.00,
          title: const Text(
            GlobalConstant.appNameDevSmall,
            style: TextStyle(
              color: AppColors.headingColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.00,
          // actions: [
          //   // widget.paymentURL
          //   //     ? Container()
          //   //     : IconButton(
          //   //         icon: Icon(Icons.refresh),
          //   //         onPressed: () => webViewController.reload(),
          //   //       ),
          // ],
        ),
        body: Column(
          children: [
            progress < 1.0
                ? LinearProgressIndicator(
                    value: progress,
                    color: AppColors.headingColor,
                    backgroundColor: AppColors.appBackgroundColor,
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: WebViewWidget(controller: webViewController),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

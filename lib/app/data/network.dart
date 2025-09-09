import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../widgets/custom_snackbar.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  final RxList<ConnectivityResult> _connectivityResultList = RxList.empty();
  RxList<ConnectivityResult> get connectivityResultList =>
      _connectivityResultList;
  final RxBool _isConnected = false.obs;
  RxBool get isConnected => _isConnected;
  final StreamController<List<ConnectivityResult>>
      _connectivityResultStreamController = StreamController();

  @override
  void onInit() {
    super.onInit();
    updateConnectivityStatus();
  }

  @override
  void onClose() {
    _connectivityResultStreamController.close();
    super.onClose();
  }

  void updateConnectivityStatus() {
    _connectivity.onConnectivityChanged.listen((result) {
      connectivityResultList.value = result;
      if (result.contains(ConnectivityResult.none)) {
        _connectivityResultStreamController.sink.add([ConnectivityResult.none]);
        isConnected.value = false;
        showOfflineSnackbar();
      } else {
        connectivityResultList.value = result;
        _connectivityResultStreamController.sink.add(result);
        isConnected.value = true;
        _hideOfflineSnackbar();
      }
    });
  }

  void showOfflineSnackbar() {
    CustomSnackBar.errorSnackBar(
      message: "${"connectionStatus".tr} : ${"youAreOffline".tr}",
      isDismissible: true,
      duration: const Duration(days: 1),
    );
  }

  void _hideOfflineSnackbar() {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
  }
}

import 'dart:async';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetWorkController extends GetxController {
  var connectionStatus = 0.obs;
  late StreamSubscription<InternetConnectionStatus> _listenr;
  @override
  void onInit() {
    super.onInit();
    _listenr = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          connectionStatus.value = 1;
          break;
        case InternetConnectionStatus.disconnected:
          connectionStatus.value = 0;
          break;
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    _listenr.cancel();
  }
}

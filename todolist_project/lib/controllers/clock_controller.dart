import 'dart:async';

import 'package:get/get.dart';

class ClockController extends GetxController{
  var currentTime=DateTime.now().obs;
  Timer?_timer;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      currentTime.value = DateTime.now();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

import 'dart:async';

import 'package:get/get.dart';
import 'package:newscope/routes/app_routes.dart';

class SplashController extends GetxController {
  final RxInt countdown = 3.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value == 1) {
        timer.cancel();
        Get.offNamed(AppRoutes.intro);
        return;
      }

      countdown.value--;
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

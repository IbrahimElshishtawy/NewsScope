import 'dart:async';

import 'package:get/get.dart';
import 'package:newscope/routes/app_routes.dart';

class SplashController extends GetxController {
  final RxBool animateIn = false.obs;
  Timer? _navigationTimer;
  bool _hasNavigated = false;

  String get channelName => 'NewsScope';

  String get stationLabel => 'القناة الإخبارية';

  String get subtitle => 'نشرة المساء';

  @override
  void onInit() {
    super.onInit();
    Future<void>.delayed(const Duration(milliseconds: 140), () {
      if (!isClosed) {
        animateIn.value = true;
      }
    });
    _navigationTimer = Timer(const Duration(milliseconds: 2800), _openHome);
  }

  void skip() {
    _navigationTimer?.cancel();
    _openHome();
  }

  void _openHome() {
    if (_hasNavigated || isClosed) {
      return;
    }
    _hasNavigated = true;
    Get.offNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    _navigationTimer?.cancel();
    super.onClose();
  }
}

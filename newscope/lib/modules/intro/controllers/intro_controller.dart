import 'dart:async';

import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/routes/app_routes.dart';

class IntroController extends GetxController {
  IntroController({required NewsContentRepository repository})
    : _repository = repository;

  final NewsContentRepository _repository;
  final RxBool showContent = false.obs;
  final RxInt countdown = 5.obs;
  Timer? _timer;
  bool _hasNavigated = false;

  List<String> get tickerItems => _repository.getHomeTickerItems();

  List<String> get openingNotes => const [
    'تمهيد بصري رسمي مع حضور واضح للهوية العربية للنشرة.',
    'انتقال منظم من المقدمة إلى العناوين الرئيسية دون كسر الإيقاع.',
    'طبقات ضوئية زرقاء وحمراء تمنح الواجهة طابع بث تلفزيوني حديث.',
  ];

  @override
  void onInit() {
    super.onInit();
    Future<void>.delayed(const Duration(milliseconds: 150), () {
      if (!isClosed) {
        showContent.value = true;
      }
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value == 1) {
        timer.cancel();
        openHeadlines();
        return;
      }
      countdown.value--;
    });
  }

  void openHeadlines() {
    if (_hasNavigated || isClosed) {
      return;
    }
    _hasNavigated = true;
    Get.offNamed(AppRoutes.headlines);
  }

  void openDashboard() {
    _timer?.cancel();
    Get.offNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

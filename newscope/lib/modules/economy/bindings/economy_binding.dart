import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/economy/controllers/economy_controller.dart';

class EconomyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EconomyController>(
      () => EconomyController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

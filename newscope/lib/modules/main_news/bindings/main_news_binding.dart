import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/main_news/controllers/main_news_controller.dart';

class MainNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNewsController>(
      () => MainNewsController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

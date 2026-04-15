import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/breaking_news/controllers/breaking_news_controller.dart';

class BreakingNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreakingNewsController>(
      () =>
          BreakingNewsController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

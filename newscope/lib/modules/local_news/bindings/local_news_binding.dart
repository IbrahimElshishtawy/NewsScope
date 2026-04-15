import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/local_news/controllers/local_news_controller.dart';

class LocalNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalNewsController>(
      () => LocalNewsController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

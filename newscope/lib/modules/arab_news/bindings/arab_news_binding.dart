import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/arab_news/controllers/arab_news_controller.dart';

class ArabNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArabNewsController>(
      () => ArabNewsController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/international_news/controllers/international_news_controller.dart';

class InternationalNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternationalNewsController>(
      () => InternationalNewsController(
        repository: Get.find<NewsContentRepository>(),
      ),
    );
  }
}

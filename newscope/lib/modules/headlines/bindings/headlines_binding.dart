import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/headlines/controllers/headlines_controller.dart';

class HeadlinesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HeadlinesController>(
      () => HeadlinesController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

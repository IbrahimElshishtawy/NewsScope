import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/quotes/controllers/quotes_controller.dart';

class QuotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuotesController>(
      () => QuotesController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

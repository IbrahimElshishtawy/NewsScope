import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/sports/controllers/sports_controller.dart';

class SportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SportsController>(
      () => SportsController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

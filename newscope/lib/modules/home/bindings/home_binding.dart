import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

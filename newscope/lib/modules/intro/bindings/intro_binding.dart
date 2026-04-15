import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/intro/controllers/intro_controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(
      () => IntroController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

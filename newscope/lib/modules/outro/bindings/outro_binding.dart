import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/outro/controllers/outro_controller.dart';

class OutroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OutroController>(
      () => OutroController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

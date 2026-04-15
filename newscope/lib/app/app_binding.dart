import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Registers the newsroom content once for the whole application.
    Get.put(NewsContentRepository(), permanent: true);
  }
}

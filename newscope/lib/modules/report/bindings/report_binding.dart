import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/report/controllers/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportController>(
      () => ReportController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

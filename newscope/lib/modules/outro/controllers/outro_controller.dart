import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/routes/app_routes.dart';

class OutroController extends GetxController {
  OutroController({required NewsContentRepository repository})
    : _repository = repository;

  final NewsContentRepository _repository;

  List<String> get tickerItems => _repository.getHomeTickerItems();

  List<String> get closingNotes => const [
    'The bulletin closes with a concise recap and a handoff to tomorrow\'s file.',
    'Classic presentation is preserved through restrained colors and formal typography.',
    'The dashboard remains the central navigation layer for the full programme.',
  ];

  void backToDashboard() {
    Get.offNamed(AppRoutes.home);
  }
}

import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/routes/app_routes.dart';

class IntroController extends GetxController {
  IntroController({required NewsContentRepository repository})
    : _repository = repository;

  final NewsContentRepository _repository;

  List<String> get tickerItems => _repository.getHomeTickerItems();

  List<String> get openingNotes => const [
    'A calm opening built around authority, clarity, and measured pacing.',
    'Domestic, regional, and international desks prepared in one control-room layout.',
    'Responsive UI structure ready for mobile, tablet, and desktop newsroom displays.',
  ];

  void openDashboard() {
    Get.offNamed(AppRoutes.home);
  }
}

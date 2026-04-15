import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/modules/weather/controllers/weather_controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherController>(
      () => WeatherController(repository: Get.find<NewsContentRepository>()),
    );
  }
}

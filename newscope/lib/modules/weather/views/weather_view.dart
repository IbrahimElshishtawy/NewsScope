import 'package:get/get.dart';
import 'package:newscope/modules/weather/controllers/weather_controller.dart';
import 'package:newscope/shared/widgets/broadcast_section_page.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({super.key});

  @override
  Widget build(context) {
    return BroadcastSectionPage(section: controller.section);
  }
}

import 'package:get/get.dart';
import 'package:newscope/modules/main_news/controllers/main_news_controller.dart';
import 'package:newscope/shared/widgets/broadcast_section_page.dart';

class MainNewsView extends GetView<MainNewsController> {
  const MainNewsView({super.key});

  @override
  Widget build(context) {
    return BroadcastSectionPage(section: controller.section);
  }
}

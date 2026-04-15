import 'package:get/get.dart';
import 'package:newscope/modules/local_news/controllers/local_news_controller.dart';
import 'package:newscope/shared/widgets/broadcast_section_page.dart';

class LocalNewsView extends GetView<LocalNewsController> {
  const LocalNewsView({super.key});

  @override
  Widget build(context) {
    return BroadcastSectionPage(section: controller.section);
  }
}

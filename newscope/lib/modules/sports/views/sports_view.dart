import 'package:get/get.dart';
import 'package:newscope/modules/sports/controllers/sports_controller.dart';
import 'package:newscope/shared/widgets/broadcast_section_page.dart';

class SportsView extends GetView<SportsController> {
  const SportsView({super.key});

  @override
  Widget build(context) {
    return BroadcastSectionPage(section: controller.section);
  }
}

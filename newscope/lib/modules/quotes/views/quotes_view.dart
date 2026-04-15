import 'package:get/get.dart';
import 'package:newscope/modules/quotes/controllers/quotes_controller.dart';
import 'package:newscope/shared/widgets/broadcast_section_page.dart';

class QuotesView extends GetView<QuotesController> {
  const QuotesView({super.key});

  @override
  Widget build(context) {
    return BroadcastSectionPage(section: controller.section);
  }
}

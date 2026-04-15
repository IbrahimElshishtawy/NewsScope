import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/arab_news/controllers/arab_news_controller.dart';
import 'package:newscope/shared/widgets/broadcast_section_page.dart';

class ArabNewsView extends GetView<ArabNewsController> {
  const ArabNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BroadcastSectionPage(section: controller.section);
  }
}

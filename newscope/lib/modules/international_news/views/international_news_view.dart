import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/international_news/controllers/international_news_controller.dart';
import 'package:newscope/shared/widgets/broadcast_section_page.dart';

class InternationalNewsView extends GetView<InternationalNewsController> {
  const InternationalNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BroadcastSectionPage(section: controller.section);
  }
}

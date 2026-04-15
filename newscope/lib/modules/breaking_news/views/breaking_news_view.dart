import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/breaking_news/controllers/breaking_news_controller.dart';
import 'package:newscope/shared/widgets/broadcast_section_page.dart';

class BreakingNewsView extends GetView<BreakingNewsController> {
  const BreakingNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BroadcastSectionPage(section: controller.section);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/headlines/controllers/headlines_controller.dart';
import 'package:newscope/shared/widgets/broadcast_section_page.dart';

class HeadlinesView extends GetView<HeadlinesController> {
  const HeadlinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BroadcastSectionPage(section: controller.section);
  }
}

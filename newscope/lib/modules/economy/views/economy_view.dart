import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/economy/controllers/economy_controller.dart';
import 'package:newscope/shared/widgets/broadcast_section_page.dart';

class EconomyView extends GetView<EconomyController> {
  const EconomyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BroadcastSectionPage(section: controller.section);
  }
}

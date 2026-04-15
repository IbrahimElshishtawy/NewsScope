import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/report/controllers/report_controller.dart';
import 'package:newscope/shared/widgets/broadcast_section_page.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BroadcastSectionPage(section: controller.section);
  }
}

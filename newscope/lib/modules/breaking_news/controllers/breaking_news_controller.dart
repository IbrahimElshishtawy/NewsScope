import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';

class BreakingNewsController extends BroadcastSectionController {
  BreakingNewsController({required super.repository})
    : super(sectionKey: SectionKeys.breakingNews);
}

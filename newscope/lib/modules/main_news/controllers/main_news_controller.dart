import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';

class MainNewsController extends BroadcastSectionController {
  MainNewsController({required super.repository})
    : super(sectionKey: SectionKeys.mainNews);
}

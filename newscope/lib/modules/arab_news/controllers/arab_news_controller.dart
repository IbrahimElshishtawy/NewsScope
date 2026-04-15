import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';

class ArabNewsController extends BroadcastSectionController {
  ArabNewsController({required super.repository})
    : super(sectionKey: SectionKeys.arabNews);
}

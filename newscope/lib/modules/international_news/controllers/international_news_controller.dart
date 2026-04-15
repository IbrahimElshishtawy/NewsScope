import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';

class InternationalNewsController extends BroadcastSectionController {
  InternationalNewsController({required super.repository})
    : super(sectionKey: SectionKeys.internationalNews);
}

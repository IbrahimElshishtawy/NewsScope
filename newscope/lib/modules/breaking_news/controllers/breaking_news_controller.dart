import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';

class BreakingNewsController extends BroadcastSectionController {
  BreakingNewsController({required NewsContentRepository repository})
    : super(repository: repository, sectionKey: SectionKeys.breakingNews);
}

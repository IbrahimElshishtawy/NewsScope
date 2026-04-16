import 'package:newscope/app/data/models/main_news_model.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';

class MainNewsController extends BroadcastSectionController {
  MainNewsController({required NewsContentRepository repository})
    : _repository = repository,
      super(repository: repository, sectionKey: SectionKeys.mainNews);

  final NewsContentRepository _repository;

  MainNewsModel get mainNews => _repository.getMainNewsItem();
}

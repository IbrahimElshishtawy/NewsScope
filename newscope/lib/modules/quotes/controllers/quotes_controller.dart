import 'package:newscope/app/data/models/quote_model.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';

class QuotesController extends BroadcastSectionController {
  QuotesController({required NewsContentRepository repository})
    : _repository = repository,
      super(repository: repository, sectionKey: SectionKeys.quotes);

  final NewsContentRepository _repository;

  List<QuoteModel> get quotes => _repository.getQuotes();
}

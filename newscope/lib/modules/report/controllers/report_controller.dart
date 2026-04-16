import 'package:newscope/app/data/models/report_model.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';

class ReportController extends BroadcastSectionController {
  ReportController({required NewsContentRepository repository})
    : _repository = repository,
      super(repository: repository, sectionKey: SectionKeys.report);

  final NewsContentRepository _repository;

  List<ReportModel> get reports => _repository.getReports();
}

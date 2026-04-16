import 'package:newscope/app/data/models/economy_model.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';

class EconomyController extends BroadcastSectionController {
  EconomyController({required NewsContentRepository repository})
    : _repository = repository,
      super(repository: repository, sectionKey: SectionKeys.economy);

  final NewsContentRepository _repository;

  List<EconomyModel> get economyItems => _repository.getEconomyItems();

  List<EconomyModel> get currencyRates => economyItems
      .where((item) => item.type == 'currency')
      .toList(growable: false);

  EconomyModel get goldPrice =>
      economyItems.firstWhere((item) => item.type == 'gold');

  EconomyModel get oilPrice =>
      economyItems.firstWhere((item) => item.type == 'oil');

  EconomyModel get financialAnalysis =>
      economyItems.firstWhere((item) => item.type == 'analysis');
}

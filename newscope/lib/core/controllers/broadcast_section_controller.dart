import 'package:get/get.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';

abstract class BroadcastSectionController extends GetxController {
  BroadcastSectionController({
    required NewsContentRepository repository,
    required String sectionKey,
  }) : _repository = repository,
       _sectionKey = sectionKey;

  final NewsContentRepository _repository;
  final String _sectionKey;

  late final BroadcastSection section = _repository.getSection(_sectionKey);

  List<String> get tickerItems => section.tickerItems;
}

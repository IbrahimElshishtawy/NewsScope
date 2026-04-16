import 'package:get/get.dart';
import 'package:newscope/data/models/dashboard_destination.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';

class HomeController extends GetxController {
  HomeController({required NewsContentRepository repository})
    : _repository = repository;

  final NewsContentRepository _repository;

  List<DashboardDestination> get destinations =>
      _repository.getDashboardDestinations();

  List<ProgramMetric> get metrics => _repository.getHomeMetrics();

  ProgramQuote get editorialQuote => _repository.getHomeEditorialQuote();

  List<String> get tickerItems => _repository.getHomeTickerItems();

  List<String> get statusItems => _repository.getStatusItems();

  void openRoute(String route) {
    Get.toNamed(route);
  }
}

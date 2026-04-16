import 'package:flutter/material.dart';
import 'package:newscope/app/data/models/sports_model.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';

class SportsController extends BroadcastSectionController {
  SportsController({required NewsContentRepository repository})
    : _repository = repository,
      super(repository: repository, sectionKey: SectionKeys.sports);

  final NewsContentRepository _repository;

  String get title => 'الرياضة';

  List<ProgramMetric> get scoreBoxes => section.highlights;

  List<SportsModel> get sportsItems => _repository.getSportsItems();

  List<
    ({
      String competition,
      String homeTeam,
      String awayTeam,
      String score,
      String status,
      IconData icon,
    })
  >
  get matches => sportsItems
      .map(
        (match) => (
          competition: match.competition,
          homeTeam: match.homeTeam,
          awayTeam: match.awayTeam,
          score: match.result,
          status: match.status,
          icon: _iconForCompetition(match.competition),
        ),
      )
      .toList(growable: false);

  IconData _iconForCompetition(String competition) {
    if (competition.contains('كرة اليد')) {
      return Icons.sports_handball_rounded;
    }
    if (competition.contains('السلة')) {
      return Icons.sports_basketball_rounded;
    }
    if (competition.contains('ودية')) {
      return Icons.flag_outlined;
    }

    return Icons.sports_soccer_rounded;
  }
}

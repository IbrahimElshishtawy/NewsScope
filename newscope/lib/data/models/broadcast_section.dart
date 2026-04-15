import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

class BroadcastSection {
  const BroadcastSection({
    required this.key,
    required this.title,
    required this.strapline,
    required this.bulletinLabel,
    required this.leadStory,
    required this.sideStories,
    required this.highlights,
    required this.quote,
    required this.agenda,
    required this.tickerItems,
  });

  final String key;
  final String title;
  final String strapline;
  final String bulletinLabel;
  final ProgramStory leadStory;
  final List<ProgramStory> sideStories;
  final List<ProgramMetric> highlights;
  final ProgramQuote quote;
  final List<String> agenda;
  final List<String> tickerItems;
}

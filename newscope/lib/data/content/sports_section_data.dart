import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

const sportsSectionData = BroadcastSection(
  key: SectionKeys.sports,
  title: 'Sports',
  strapline: 'Results, previews, training camps, and federation decisions.',
  bulletinLabel: 'Sports Desk',
  leadStory: ProgramStory(
    title:
        'Title race tightens as the top two clubs prepare for decisive weekend fixtures',
    summary:
        'Analysts say squad rotation, defensive depth, and set-piece execution could define the table.',
    category: 'League',
    timeLabel: '22:00',
    reporter: 'Amr Hisham',
    location: 'Cairo Stadium',
    focus: 'Title Race',
  ),
  sideStories: [
    ProgramStory(
      title:
          'National team camp expands its recovery programme ahead of qualifiers',
      summary:
          'The medical unit is trialling individualized workloads to manage a compressed domestic calendar.',
      category: 'National Team',
      timeLabel: '22:08',
      reporter: 'Sherif Fouad',
      location: 'Borg El Arab',
      focus: 'Camp Update',
    ),
    ProgramStory(
      title:
          'Federation publishes a revised calendar for cup rounds and youth tournaments',
      summary:
          'Clubs had requested clearer spacing between senior and youth fixtures to ease travel pressures.',
      category: 'Federation',
      timeLabel: '22:14',
      reporter: 'Rasha Adel',
      location: 'Cairo',
      focus: 'Calendar',
    ),
  ],
  highlights: [
    ProgramMetric(
      label: 'League Gap',
      value: '2 pts',
      caption: 'between first and second',
    ),
    ProgramMetric(
      label: 'Qualifiers',
      value: '3',
      caption: 'ahead on the national schedule',
    ),
    ProgramMetric(
      label: 'Youth Events',
      value: '9',
      caption: 'repositioned in the calendar',
    ),
  ],
  quote: ProgramQuote(
    speaker: 'Hesham Khalil',
    role: 'Sports Presenter',
    quote:
        'Sports television still works best when the pace is lively but neat.',
  ),
  agenda: [
    'Lead with the title race and the tactical picture for the weekend.',
    'Move to the national team camp and sports-science adjustments.',
    'Finish with federation scheduling and club reaction.',
  ],
  tickerItems: [
    'Title race narrows before decisive weekend fixtures',
    'National team recovery programme expanded ahead of qualifiers',
    'Federation revises cup and youth-tournament calendar',
  ],
);

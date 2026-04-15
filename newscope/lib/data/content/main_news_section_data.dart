import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

const mainNewsSectionData = BroadcastSection(
  key: SectionKeys.mainNews,
  title: 'Main News',
  strapline:
      'The flagship bulletin covers state affairs and institutional oversight.',
  bulletinLabel: 'Prime Bulletin',
  leadStory: ProgramStory(
    title:
        'Parliament opens an oversight session focused on transport delivery timetables',
    summary:
        'Committee chairs are pressing agencies for updated completion charts on rail, port, and urban-transit projects.',
    category: 'Parliament',
    timeLabel: '19:00',
    reporter: 'Youssef Adel',
    location: 'New Administrative Capital',
    focus: 'Oversight',
  ),
  sideStories: [
    ProgramStory(
      title: 'Public works forum outlines tender rules for logistics hubs',
      summary:
          'Developers were briefed on local-content thresholds, maintenance guarantees, and freight benchmarks.',
      category: 'Infrastructure',
      timeLabel: '19:12',
      reporter: 'Nour Hassan',
      location: 'Suez',
      focus: 'Tender Rules',
    ),
    ProgramStory(
      title: 'Watchdog unit publishes findings on delayed municipal contracts',
      summary:
          'The review cites procurement bottlenecks and calls for tighter milestone disclosure from city authorities.',
      category: 'Governance',
      timeLabel: '19:18',
      reporter: 'Khaled Saad',
      location: 'Mansoura',
      focus: 'Accountability',
    ),
  ],
  highlights: [
    ProgramMetric(
      label: 'Oversight Files',
      value: '27',
      caption: 'scheduled for discussion',
    ),
    ProgramMetric(
      label: 'Port Projects',
      value: '6',
      caption: 'tracked in the main package',
    ),
    ProgramMetric(
      label: 'Studio Analysts',
      value: '2',
      caption: 'joining the flagship segment',
    ),
  ],
  quote: ProgramQuote(
    speaker: 'Rania Mostafa',
    role: 'Programme Anchor',
    quote: 'Main News should feel measured and authoritative.',
  ),
  agenda: [
    'Lead with the transport oversight hearing and key committee remarks.',
    'Introduce freight-hub graphics and the investment pipeline panel.',
    'End with governance findings and what they mean for local delivery.',
  ],
  tickerItems: [
    'Transport agencies pressed for updated delivery timetables',
    'Second-phase logistics hubs move toward tender publication',
    'Municipal contract delays highlighted in quarterly report',
  ],
);

import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

const quotesSectionData = BroadcastSection(
  key: SectionKeys.quotes,
  title: 'Quotes',
  strapline:
      'The most consequential remarks from ministers, diplomats, and civic voices.',
  bulletinLabel: 'Voices Of The Day',
  leadStory: ProgramStory(
    title:
        'Foreign ministers frame regional de-escalation as a test of practical diplomacy',
    summary:
        'Statements from the latest talks stress humanitarian access, market stability, and verifiable timelines.',
    category: 'Diplomacy',
    timeLabel: '20:45',
    reporter: 'Sara Kamel',
    location: 'Amman',
    focus: 'Regional Talks',
  ),
  sideStories: [
    ProgramStory(
      title:
          'Finance minister says price discipline depends on supply coordination',
      summary:
          'The remarks place delivery chains at the center of inflation management rather than a single policy instrument.',
      category: 'Economy',
      timeLabel: '20:52',
      reporter: 'Mahmoud Salem',
      location: 'Cairo',
      focus: 'Price Stability',
    ),
    ProgramStory(
      title: 'Civic coalition calls for clearer neighborhood progress reports',
      summary:
          'Advocates say residents respond best when authorities translate national announcements into block-level targets.',
      category: 'Civil Society',
      timeLabel: '20:58',
      reporter: 'Doaa Hegazy',
      location: 'Tanta',
      focus: 'Public Communication',
    ),
  ],
  highlights: [
    ProgramMetric(
      label: 'Soundbites',
      value: '11',
      caption: 'selected for air tonight',
    ),
    ProgramMetric(
      label: 'Diplomatic Feeds',
      value: '4',
      caption: 'tracked by the foreign desk',
    ),
    ProgramMetric(
      label: 'Explainer Panels',
      value: '2',
      caption: 'prepared for quote context',
    ),
  ],
  quote: ProgramQuote(
    speaker: 'Hatem Badr',
    role: 'Foreign Affairs Editor',
    quote: 'Quotes matter most when we pair them with consequence.',
  ),
  agenda: [
    'Lead with the diplomatic remarks and their practical implications.',
    'Contrast official economic language with supply-chain evidence.',
    'End on civic voices asking for clearer local accountability.',
  ],
  tickerItems: [
    'Regional talks stress timelines and humanitarian access',
    'Finance ministry links price discipline to delivery coordination',
    'Civic groups ask for clearer reporting on neighborhood milestones',
  ],
);

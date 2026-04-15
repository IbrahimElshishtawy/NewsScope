import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

const localNewsSectionData = BroadcastSection(
  key: SectionKeys.localNews,
  title: 'Local News',
  strapline: 'Governorate and city stories with direct effects on daily life.',
  bulletinLabel: 'Governorate Desk',
  leadStory: ProgramStory(
    title:
        'Municipal teams begin phased traffic redesign around the northern ring corridor',
    summary:
        'New junction timing, lane guidance, and freight restrictions are intended to reduce commuter delays.',
    category: 'City Affairs',
    timeLabel: '17:40',
    reporter: 'Reem Ashraf',
    location: 'Alexandria',
    focus: 'Traffic Plan',
  ),
  sideStories: [
    ProgramStory(
      title:
          'District hospital adds intensive-care wing after equipment testing',
      summary:
          'The new capacity is designed to support both emergency transfers and scheduled specialist care.',
      category: 'Public Services',
      timeLabel: '17:48',
      reporter: 'Tamer Atef',
      location: 'Asyut',
      focus: 'Hospital Expansion',
    ),
    ProgramStory(
      title:
          'Old-market restoration plan links shopfront rules to tourism targets',
      summary:
          'Traders are being offered phased compliance windows as planners try to preserve character without slowing business.',
      category: 'Culture',
      timeLabel: '17:54',
      reporter: 'Mona Yassin',
      location: 'Luxor',
      focus: 'Urban Heritage',
    ),
  ],
  highlights: [
    ProgramMetric(
      label: 'City Live Hits',
      value: '6',
      caption: 'scheduled across the bulletin',
    ),
    ProgramMetric(
      label: 'Hospital Beds',
      value: '+24',
      caption: 'added in the new wing',
    ),
    ProgramMetric(
      label: 'Traffic Nodes',
      value: '14',
      caption: 'retimed in the current phase',
    ),
  ],
  quote: ProgramQuote(
    speaker: 'Alaa Mohsen',
    role: 'Local Affairs Producer',
    quote:
        'Local News should always answer what viewers feel tomorrow morning.',
  ),
  agenda: [
    'Start with the ring-corridor traffic redesign and commuter maps.',
    'Move to the hospital expansion and staffing readiness update.',
    'Close with the heritage-market restoration and merchant reactions.',
  ],
  tickerItems: [
    'Alexandria rolls out phased traffic redesign on ring corridor',
    'Asyut district hospital opens additional intensive-care capacity',
    'Luxor restoration rules paired with tourism and trade targets',
  ],
);

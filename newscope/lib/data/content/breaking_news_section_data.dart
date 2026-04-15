import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

const breakingNewsSectionData = BroadcastSection(
  key: SectionKeys.breakingNews,
  title: 'Breaking News',
  strapline:
      'Urgent updates delivered with verification, restraint, and clear priorities.',
  bulletinLabel: 'Breaking Desk',
  leadStory: ProgramStory(
    title:
        'Emergency coordination room activated after a major transport disruption on the coastal corridor',
    summary:
        'Authorities say contingency bus lanes, tow operations, and hospital triage links were activated while engineers assessed the site.',
    category: 'Urgent Update',
    timeLabel: 'Now',
    reporter: 'Mostafa Hany',
    location: 'North Coast',
    focus: 'Live Incident',
  ),
  sideStories: [
    ProgramStory(
      title: 'Civil protection teams establish alternative freight routing',
      summary:
          'Officials are trying to preserve cargo flow for fuel, food, and medical supplies while the disruption is contained.',
      category: 'Operations',
      timeLabel: 'Live',
      reporter: 'Esraa Adel',
      location: 'El Alamein',
      focus: 'Rerouting',
    ),
    ProgramStory(
      title:
          'Market watchers note immediate pressure on tourism and logistics counters',
      summary:
          'Traders say the move appears concentrated in transport-linked names while broader sentiment remains orderly.',
      category: 'Markets',
      timeLabel: 'Live',
      reporter: 'Hani Farid',
      location: 'Cairo Exchange',
      focus: 'Reaction',
    ),
  ],
  highlights: [
    ProgramMetric(
      label: 'Live Feeds',
      value: '5',
      caption: 'active across desks',
    ),
    ProgramMetric(
      label: 'Verified Updates',
      value: '12',
      caption: 'cleared for ticker use',
    ),
    ProgramMetric(
      label: 'Agencies',
      value: '4',
      caption: 'represented in the coordination room',
    ),
  ],
  quote: ProgramQuote(
    speaker: 'Nesma Raouf',
    role: 'Breaking News Producer',
    quote: 'Speed is only useful when the audience can trust each line.',
  ),
  agenda: [
    'Confirm what is known about the disruption and emergency response.',
    'Add freight-routing and hospital readiness information as it clears.',
    'Monitor market and tourism reaction without overstating moves.',
  ],
  tickerItems: [
    'Emergency coordination room activated on the coastal corridor',
    'Alternative freight routing opened for essential cargo movement',
    'Transport-linked market counters come under immediate pressure',
  ],
);

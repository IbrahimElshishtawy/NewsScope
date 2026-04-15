import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

const reportSectionData = BroadcastSection(
  key: SectionKeys.report,
  title: 'Special Report',
  strapline:
      'Long-form reporting built for depth, field notes, and documentary framing.',
  bulletinLabel: 'Field Report',
  leadStory: ProgramStory(
    title:
        'Inside the Nile logistics corridor: how river, road, and rail are being linked',
    summary:
        'Our correspondents trace how cargo planning is shifting toward multimodal routes with dry ports and river terminals.',
    category: 'Investigation',
    timeLabel: '20:10',
    reporter: 'Layla Hatem',
    location: 'Upper Egypt',
    focus: 'Logistics Corridor',
  ),
  sideStories: [
    ProgramStory(
      title: 'Energy planners map the next phase of industrial substations',
      summary:
          'Officials say transmission resilience is being priced in earlier so factories can scale without emergency additions.',
      category: 'Energy',
      timeLabel: '20:22',
      reporter: 'Ahmed Refaat',
      location: 'Beni Suef',
      focus: 'Grid Planning',
    ),
    ProgramStory(
      title: 'Port managers test customs data handoffs before import peaks',
      summary:
          'A trial exchange between customs, terminal operators, and warehouses is intended to cut truck idle time.',
      category: 'Trade',
      timeLabel: '20:28',
      reporter: 'Dina Fikry',
      location: 'Damietta',
      focus: 'Port Workflow',
    ),
  ],
  highlights: [
    ProgramMetric(
      label: 'Field Stops',
      value: '5',
      caption: 'covered in the report package',
    ),
    ProgramMetric(
      label: 'Camera Crews',
      value: '3',
      caption: 'working across the corridor',
    ),
    ProgramMetric(
      label: 'Data Panels',
      value: '8',
      caption: 'prepared for explainer graphics',
    ),
  ],
  quote: ProgramQuote(
    speaker: 'Bassel Tarek',
    role: 'Senior Correspondent',
    quote: 'A classic report works when the viewer can sense the geography.',
  ),
  agenda: [
    'Set up the corridor map and the purpose of the long-form package.',
    'Move through river terminals, rail links, and inland freight depots.',
    'Close with trade-volume expectations and infrastructure risks.',
  ],
  tickerItems: [
    'Nile logistics corridor report traces freight links across three modes',
    'Industrial substations planned alongside new freight zones',
    'Customs data exchange tested before summer import peak',
  ],
);

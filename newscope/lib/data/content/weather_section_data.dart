import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

const weatherSectionData = BroadcastSection(
  key: SectionKeys.weather,
  title: 'Weather',
  strapline:
      'A formal briefing on temperatures, winds, visibility, and operations.',
  bulletinLabel: 'Weather Centre',
  leadStory: ProgramStory(
    title:
        'Forecasters warn of active winds and reduced visibility across western approaches',
    summary:
        'Transport authorities have been advised to monitor dust episodes, maritime visibility, and road safety bulletins overnight.',
    category: 'Forecast',
    timeLabel: '22:20',
    reporter: 'Nadine Zakaria',
    location: 'National Meteorological Centre',
    focus: 'Visibility Alert',
  ),
  sideStories: [
    ProgramStory(
      title:
          'Red Sea ports prepare staggered movement windows as wind speeds increase',
      summary:
          'Harbour managers say operations will remain flexible, with departures adjusted to preserve navigation safety.',
      category: 'Marine',
      timeLabel: '22:28',
      reporter: 'Ayman Soliman',
      location: 'Hurghada',
      focus: 'Port Conditions',
    ),
    ProgramStory(
      title:
          'Agricultural planners revise irrigation guidance for hotter districts',
      summary:
          'The update is meant to reduce water stress and help growers plan around stronger evaporation rates.',
      category: 'Agriculture',
      timeLabel: '22:34',
      reporter: 'Ghada Saber',
      location: 'Minya',
      focus: 'Field Guidance',
    ),
  ],
  highlights: [
    ProgramMetric(
      label: 'Cairo High',
      value: '29°C',
      caption: 'clear and warm by afternoon',
    ),
    ProgramMetric(
      label: 'Coastal Wind',
      value: '34 km/h',
      caption: 'gusts on exposed roads',
    ),
    ProgramMetric(
      label: 'Marine Alert',
      value: 'Yellow',
      caption: 'port movement under watch',
    ),
  ],
  quote: ProgramQuote(
    speaker: 'Yara Fawzi',
    role: 'Weather Presenter',
    quote: 'A good weather bulletin is operational and practical.',
  ),
  agenda: [
    'Open with wind and visibility warnings for western corridors.',
    'Move to port operations and maritime movement windows.',
    'Close on irrigation guidance and higher inland temperatures.',
  ],
  tickerItems: [
    'Active winds expected across western approaches overnight',
    'Red Sea ports prepare staggered movement windows',
    'Irrigation guidance revised for hotter inland districts',
  ],
);

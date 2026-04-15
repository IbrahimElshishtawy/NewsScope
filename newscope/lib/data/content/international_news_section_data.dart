import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

const internationalNewsSectionData = BroadcastSection(
  key: SectionKeys.internationalNews,
  title: 'International News',
  strapline:
      'The global file, with markets, diplomacy, and institutional decisions.',
  bulletinLabel: 'World Desk',
  leadStory: ProgramStory(
    title:
        'Leaders debate new rules for critical infrastructure data at a security summit',
    summary:
        'Proposals under discussion would tighten disclosure standards for cyber incidents while shielding live vulnerabilities.',
    category: 'Global Affairs',
    timeLabel: '21:30',
    reporter: 'Lina Abdelrahman',
    location: 'Brussels',
    focus: 'Cyber Governance',
  ),
  sideStories: [
    ProgramStory(
      title: 'Central-bank signals keep bond traders cautious into next week',
      summary:
          'The main question is whether softer inflation data can offset still-sticky service prices in larger economies.',
      category: 'Markets',
      timeLabel: '21:38',
      reporter: 'Nadine Habib',
      location: 'London',
      focus: 'Rates Outlook',
    ),
    ProgramStory(
      title: 'UN climate panel calls for faster adaptation financing',
      summary:
          'The panel says delayed financing windows are leaving river-basin economies more exposed to seasonal shocks.',
      category: 'Climate',
      timeLabel: '21:44',
      reporter: 'Ramy Saleh',
      location: 'Geneva',
      focus: 'Adaptation Finance',
    ),
  ],
  highlights: [
    ProgramMetric(
      label: 'Global Capitals',
      value: '7',
      caption: 'covered in the rundown',
    ),
    ProgramMetric(
      label: 'Market Charts',
      value: '5',
      caption: 'prepared for analysts',
    ),
    ProgramMetric(
      label: 'Policy Papers',
      value: '3',
      caption: 'referenced in tonight\'s brief',
    ),
  ],
  quote: ProgramQuote(
    speaker: 'Maya Sherif',
    role: 'World News Anchor',
    quote:
        'International News needs calm framing; the viewer should never feel lost.',
  ),
  agenda: [
    'Lead with the security summit and debate over infrastructure data.',
    'Translate central-bank caution into plain language for households.',
    'Close with the climate-finance gap and river-basin exposure.',
  ],
  tickerItems: [
    'Security summit weighs new rules for infrastructure data',
    'Bond traders stay cautious as central-bank signals remain mixed',
    'UN panel pushes for faster adaptation finance',
  ],
);

import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

const arabNewsSectionData = BroadcastSection(
  key: SectionKeys.arabNews,
  title: 'Arab News',
  strapline:
      'Regional diplomacy, infrastructure, humanitarian access, and markets.',
  bulletinLabel: 'Regional Desk',
  leadStory: ProgramStory(
    title:
        'Arab summit envoys work on an energy-grid framework tied to emergency support',
    summary:
        'Delegations say the proposal would allow states to share reserve capacity more smoothly during demand spikes.',
    category: 'Regional Affairs',
    timeLabel: '21:05',
    reporter: 'Nada Rashad',
    location: 'Riyadh',
    focus: 'Energy Coordination',
  ),
  sideStories: [
    ProgramStory(
      title: 'Humanitarian corridor talks center on inspection speed',
      summary:
          'Negotiators are trying to balance security checks with faster clearance for medical teams and cargo.',
      category: 'Humanitarian',
      timeLabel: '21:12',
      reporter: 'Hassan Galal',
      location: 'Amman',
      focus: 'Aid Access',
    ),
    ProgramStory(
      title: 'Regional banks review settlement tools for local-currency trade',
      summary:
          'Officials say the idea is gaining interest as importers seek more predictable clearing costs.',
      category: 'Finance',
      timeLabel: '21:18',
      reporter: 'Heba Farouk',
      location: 'Abu Dhabi',
      focus: 'Settlement Systems',
    ),
  ],
  highlights: [
    ProgramMetric(
      label: 'Summit Tracks',
      value: '4',
      caption: 'being followed tonight',
    ),
    ProgramMetric(
      label: 'Aid Crossings',
      value: '3',
      caption: 'under active discussion',
    ),
    ProgramMetric(
      label: 'Banking Panels',
      value: '2',
      caption: 'covering settlement tools',
    ),
  ],
  quote: ProgramQuote(
    speaker: 'Karim Wahid',
    role: 'Regional Affairs Editor',
    quote: 'Viewers should see how diplomacy, energy, and aid are connected.',
  ),
  agenda: [
    'Open with the summit energy-grid framework and reserve-sharing logic.',
    'Move to corridor talks and barriers to faster aid routing.',
    'Close with banking shifts toward local-currency invoicing.',
  ],
  tickerItems: [
    'Arab envoys discuss shared reserve-capacity framework for the grid',
    'Humanitarian corridor talks focus on inspections and medical routing',
    'Regional banks study new settlement tools for local-currency trade',
  ],
);

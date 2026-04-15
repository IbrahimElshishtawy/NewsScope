import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

const headlinesSectionData = BroadcastSection(
  key: SectionKeys.headlines,
  title: 'Headlines',
  strapline: 'The first and most important national reads of the hour.',
  bulletinLabel: 'Top Of Hour Bulletin',
  leadStory: ProgramStory(
    title:
        'Cabinet completes a final review of the public-service spending package',
    summary:
        'Senior ministers are aligning project timetables, staffing ceilings, and debt buffers before tomorrow morning\'s fiscal briefing.',
    category: 'National Desk',
    timeLabel: '18:00',
    reporter: 'Mariam Fouad',
    location: 'Cairo',
    focus: 'Budget Review',
  ),
  sideStories: [
    ProgramStory(
      title: 'Election commission rehearses logistics in three governorates',
      summary:
          'Field teams are testing ballot transport, backup communications, and accessibility plans for remote districts.',
      category: 'Politics',
      timeLabel: '18:08',
      reporter: 'Omar Nabil',
      location: 'Giza',
      focus: 'Readiness',
    ),
    ProgramStory(
      title:
          'Health ministry expands strategic medicine reserves before summer demand',
      summary:
          'Emergency stockpiles now cover a broader list of antibiotics, insulin, and trauma supplies.',
      category: 'Health',
      timeLabel: '18:14',
      reporter: 'Hoda Samir',
      location: 'Alexandria',
      focus: 'Supply Chain',
    ),
  ],
  highlights: [
    ProgramMetric(
      label: 'Lead Window',
      value: '12 min',
      caption: 'planned for the opening block',
    ),
    ProgramMetric(
      label: 'Political Guests',
      value: '3',
      caption: 'confirmed for studio reactions',
    ),
    ProgramMetric(
      label: 'Field Crews',
      value: '9',
      caption: 'distributed across governorates',
    ),
  ],
  quote: ProgramQuote(
    speaker: 'Salma El-Din',
    role: 'Managing Editor',
    quote: 'The first bulletin must show pace without losing context.',
  ),
  agenda: [
    'Open with the cabinet finance package and its overnight negotiations.',
    'Move to election-readiness visuals from regional operations rooms.',
    'Close the block with the health reserve story and analyst takeaway.',
  ],
  tickerItems: [
    'Cabinet finance review enters final drafting phase',
    'Election logistics rehearsal expands to remote districts',
    'Medicine reserves extended ahead of peak seasonal demand',
  ],
);

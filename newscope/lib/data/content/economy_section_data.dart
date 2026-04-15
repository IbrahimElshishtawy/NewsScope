import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

const economySectionData = BroadcastSection(
  key: SectionKeys.economy,
  title: 'Economy',
  strapline:
      'Markets, household prices, industry, and fiscal direction in a sober frame.',
  bulletinLabel: 'Business Desk',
  leadStory: ProgramStory(
    title:
        'Wholesale-price data points to slower food inflation while transport costs stay uneven',
    summary:
        'Analysts say the headline trend is improving, but logistics bottlenecks still make regional price behavior harder to predict.',
    category: 'Prices',
    timeLabel: '18:30',
    reporter: 'Farah Aziz',
    location: 'Cairo',
    focus: 'Inflation',
  ),
  sideStories: [
    ProgramStory(
      title:
          'Central bank liquidity auction draws broad demand from mid-sized lenders',
      summary:
          'Treasury desks describe the session as orderly, though pricing showed continued caution.',
      category: 'Banking',
      timeLabel: '18:38',
      reporter: 'Waleed Fawzy',
      location: 'Cairo',
      focus: 'Liquidity',
    ),
    ProgramStory(
      title:
          'Export manufacturers report stronger inquiries for building materials',
      summary:
          'Trade groups say enquiries are rising in nearby markets as shipping schedules stabilize.',
      category: 'Industry',
      timeLabel: '18:45',
      reporter: 'Engy Sabry',
      location: '10th of Ramadan City',
      focus: 'Exports',
    ),
  ],
  highlights: [
    ProgramMetric(
      label: 'Price Basket',
      value: '42 items',
      caption: 'tracked in tonight\'s visual',
    ),
    ProgramMetric(
      label: 'Auction Demand',
      value: '1.8x',
      caption: 'cover ratio for the session',
    ),
    ProgramMetric(
      label: 'Export Calls',
      value: '+14%',
      caption: 'reported by trade groups',
    ),
  ],
  quote: ProgramQuote(
    speaker: 'Tarek Hamza',
    role: 'Economics Editor',
    quote:
        'The economy segment has to connect the macro chart to the market shelf.',
  ),
  agenda: [
    'Start with wholesale-price signals and their limits.',
    'Move to liquidity conditions and what lenders are pricing in.',
    'End on export sentiment and industrial order books.',
  ],
  tickerItems: [
    'Food inflation eases in wholesale data, transport costs stay mixed',
    'Liquidity auction sees broad demand from mid-sized lenders',
    'Export manufacturers report stronger inquiries in nearby markets',
  ],
);

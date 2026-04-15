import 'package:flutter/material.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/content/arab_news_section_data.dart';
import 'package:newscope/data/content/breaking_news_section_data.dart';
import 'package:newscope/data/content/economy_section_data.dart';
import 'package:newscope/data/content/headlines_section_data.dart';
import 'package:newscope/data/content/international_news_section_data.dart';
import 'package:newscope/data/content/local_news_section_data.dart';
import 'package:newscope/data/content/main_news_section_data.dart';
import 'package:newscope/data/content/quotes_section_data.dart';
import 'package:newscope/data/content/report_section_data.dart';
import 'package:newscope/data/content/sports_section_data.dart';
import 'package:newscope/data/content/weather_section_data.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/dashboard_destination.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/routes/app_routes.dart';

class NewsContentRepository {
  final Map<String, BroadcastSection> _sections = {
    SectionKeys.headlines: headlinesSectionData,
    SectionKeys.mainNews: mainNewsSectionData,
    SectionKeys.report: reportSectionData,
    SectionKeys.quotes: quotesSectionData,
    SectionKeys.localNews: localNewsSectionData,
    SectionKeys.arabNews: arabNewsSectionData,
    SectionKeys.internationalNews: internationalNewsSectionData,
    SectionKeys.economy: economySectionData,
    SectionKeys.breakingNews: breakingNewsSectionData,
    SectionKeys.sports: sportsSectionData,
    SectionKeys.weather: weatherSectionData,
  };

  List<DashboardDestination> getDashboardDestinations() {
    return const [
      DashboardDestination(
        title: 'Programme Intro',
        route: AppRoutes.intro,
        summary:
            'Opening titles, editorial framing, and tonight\'s programme note.',
        scheduleLabel: 'Opening',
        icon: Icons.video_collection_outlined,
      ),
      DashboardDestination(
        title: 'Headlines',
        route: AppRoutes.headlines,
        summary:
            'National, political, and public-service priorities for the top of the hour.',
        scheduleLabel: '18:00',
        icon: Icons.article_outlined,
      ),
      DashboardDestination(
        title: 'Main News',
        route: AppRoutes.mainNews,
        summary:
            'Flagship bulletin covering state affairs, oversight, and infrastructure.',
        scheduleLabel: '19:00',
        icon: Icons.cast_for_education_outlined,
      ),
      DashboardDestination(
        title: 'Special Report',
        route: AppRoutes.report,
        summary:
            'Long-form field package with maps, explainer panels, and analysis.',
        scheduleLabel: '20:10',
        icon: Icons.map_outlined,
      ),
      DashboardDestination(
        title: 'Quotes',
        route: AppRoutes.quotes,
        summary:
            'Key remarks from diplomats, ministers, civil society, and markets.',
        scheduleLabel: '20:45',
        icon: Icons.format_quote_outlined,
      ),
      DashboardDestination(
        title: 'Local News',
        route: AppRoutes.localNews,
        summary:
            'Governorate stories covering roads, hospitals, and urban heritage.',
        scheduleLabel: '17:40',
        icon: Icons.location_city_outlined,
      ),
      DashboardDestination(
        title: 'Arab News',
        route: AppRoutes.arabNews,
        summary:
            'Regional diplomacy, energy coordination, and humanitarian corridors.',
        scheduleLabel: '21:05',
        icon: Icons.public_outlined,
      ),
      DashboardDestination(
        title: 'International',
        route: AppRoutes.internationalNews,
        summary: 'World summit coverage, markets, and climate financing.',
        scheduleLabel: '21:30',
        icon: Icons.language_outlined,
      ),
      DashboardDestination(
        title: 'Economy',
        route: AppRoutes.economy,
        summary:
            'Household prices, liquidity conditions, exports, and industrial demand.',
        scheduleLabel: '18:30',
        icon: Icons.trending_up_outlined,
      ),
      DashboardDestination(
        title: 'Breaking News',
        route: AppRoutes.breakingNews,
        summary:
            'Urgent verified updates with live operations and market reaction.',
        scheduleLabel: 'Live',
        icon: Icons.crisis_alert_outlined,
      ),
      DashboardDestination(
        title: 'Sports',
        route: AppRoutes.sports,
        summary: 'League race, training camps, federation notes, and fixtures.',
        scheduleLabel: '22:00',
        icon: Icons.sports_soccer_outlined,
      ),
      DashboardDestination(
        title: 'Weather',
        route: AppRoutes.weather,
        summary:
            'Formal weather centre briefing for commuters, ports, and farms.',
        scheduleLabel: '22:20',
        icon: Icons.cloud_outlined,
      ),
      DashboardDestination(
        title: 'Programme Outro',
        route: AppRoutes.outro,
        summary:
            'Closing remarks, tomorrow\'s outlook, and the sign-off panel.',
        scheduleLabel: 'Close',
        icon: Icons.flag_outlined,
      ),
    ];
  }

  List<ProgramStory> getHomeFeaturedStories() {
    return [
      _sections[SectionKeys.headlines]!.leadStory,
      _sections[SectionKeys.breakingNews]!.leadStory,
      _sections[SectionKeys.economy]!.leadStory,
    ];
  }

  List<ProgramMetric> getHomeMetrics() {
    return const [
      ProgramMetric(
        label: 'Planned Segments',
        value: '13',
        caption: 'linked from the dashboard below',
      ),
      ProgramMetric(
        label: 'Live Locations',
        value: '11',
        caption: 'ready across local and regional desks',
      ),
      ProgramMetric(
        label: 'Editorial Window',
        value: '67 min',
        caption: 'for the prime bulletin and special report',
      ),
    ];
  }

  ProgramQuote getHomeEditorialQuote() {
    return const ProgramQuote(
      speaker: 'Editorial Board',
      role: 'Nightly Programme Note',
      quote:
          'Tonight\'s layout is designed as a classic rolling bulletin: sober headlines, strong field reporting, and disciplined transitions between domestic, regional, and international desks.',
    );
  }

  List<String> getHomeTickerItems() {
    return const [
      'NewsScope control room ready for the evening bulletin',
      'Headlines, economy, breaking news, sports, and weather fully linked',
      'Formal classic layout optimized for mobile, tablet, and desktop screens',
    ];
  }

  BroadcastSection getSection(String key) => _sections[key]!;
}

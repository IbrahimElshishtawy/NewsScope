import 'package:flutter/material.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';
import 'package:newscope/data/models/program_metric.dart';

class SportsController extends BroadcastSectionController {
  SportsController({required super.repository})
    : super(sectionKey: SectionKeys.sports);

  String get title => 'الرياضة';

  List<ProgramMetric> get scoreBoxes => section.highlights;

  List<
    ({
      String competition,
      String homeTeam,
      String awayTeam,
      String score,
      String status,
      IconData icon,
    })
  >
  get matches => const [
    (
      competition: 'الدوري الممتاز',
      homeTeam: 'الأهلي',
      awayTeam: 'بيراميدز',
      score: '2 - 1',
      status: 'النهاية',
      icon: Icons.sports_soccer_rounded,
    ),
    (
      competition: 'كأس العاصمة',
      homeTeam: 'الزمالك',
      awayTeam: 'فيوتشر',
      score: '1 - 1',
      status: 'الشوط الثاني',
      icon: Icons.emoji_events_outlined,
    ),
    (
      competition: 'تصفيات قارية',
      homeTeam: 'مصر',
      awayTeam: 'تونس',
      score: '3 - 0',
      status: 'ملخص',
      icon: Icons.public_outlined,
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/data/models/dashboard_destination.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/routes/app_routes.dart';

class HomeController extends GetxController {
  HomeController({required NewsContentRepository repository})
    : _repository = repository;

  final NewsContentRepository _repository;

  List<DashboardDestination> get destinations => const [
    DashboardDestination(
      title: 'المقدمة',
      route: AppRoutes.intro,
      summary: 'تهيئة افتتاحية بطابع استوديو الأخبار مع انتقال منظم للنشرة.',
      scheduleLabel: 'ON AIR',
      icon: Icons.sensors_outlined,
    ),
    DashboardDestination(
      title: 'العناوين',
      route: AppRoutes.headlines,
      summary: 'شاشة أولويات النشرة والعناوين الرئيسة في بداية البث.',
      scheduleLabel: '18:00',
      icon: Icons.view_headline_rounded,
    ),
    DashboardDestination(
      title: 'الخبر الرئيسي',
      route: AppRoutes.mainNews,
      summary: 'التغطية الأساسية للملف الأهم في النشرة مع مساحة تحليلية.',
      scheduleLabel: '18:10',
      icon: Icons.campaign_outlined,
    ),
    DashboardDestination(
      title: 'التقرير',
      route: AppRoutes.report,
      summary: 'حزمة ميدانية أو تقرير موسع مصمم لعرض تلفزيوني كلاسيكي.',
      scheduleLabel: '18:22',
      icon: Icons.description_outlined,
    ),
    DashboardDestination(
      title: 'الاقتباسات',
      route: AppRoutes.quotes,
      summary: 'أهم التصريحات والرسائل المحورية من الضيوف أو المصادر.',
      scheduleLabel: '18:30',
      icon: Icons.format_quote_outlined,
    ),
    DashboardDestination(
      title: 'الأخبار المحلية',
      route: AppRoutes.localNews,
      summary: 'متابعة المحافظات والخدمات والشؤون اليومية داخل البلاد.',
      scheduleLabel: '18:40',
      icon: Icons.location_city_outlined,
    ),
    DashboardDestination(
      title: 'الأخبار العربية',
      route: AppRoutes.arabNews,
      summary: 'موجز إقليمي بلهجة تحريرية رسمية متسقة مع بقية النشرة.',
      scheduleLabel: '18:52',
      icon: Icons.public_outlined,
    ),
    DashboardDestination(
      title: 'الأخبار الدولية',
      route: AppRoutes.internationalNews,
      summary: 'نوافذ العالم والسياسة الدولية والأزمات العابرة للحدود.',
      scheduleLabel: '19:02',
      icon: Icons.language_outlined,
    ),
    DashboardDestination(
      title: 'الاقتصاد',
      route: AppRoutes.economy,
      summary: 'شاشة الأسواق والأسعار والمؤشرات بطابع غرفة تحكم مالية.',
      scheduleLabel: '19:14',
      icon: Icons.account_balance_outlined,
    ),
    DashboardDestination(
      title: 'الأخبار العاجلة',
      route: AppRoutes.breakingNews,
      summary: 'تنقل سريع للأحداث الطارئة والتنبيهات المباشرة الموثقة.',
      scheduleLabel: 'LIVE',
      icon: Icons.notification_important_outlined,
    ),
    DashboardDestination(
      title: 'الرياضة',
      route: AppRoutes.sports,
      summary: 'نتائج ومتابعات الملاعب بأسلوب متسق وحيوية أعلى قليلًا.',
      scheduleLabel: '19:28',
      icon: Icons.sports_soccer_outlined,
    ),
    DashboardDestination(
      title: 'الطقس',
      route: AppRoutes.weather,
      summary: 'خرائط ودرجات حرارة وتنبيهات ملائمة لفقرة الأحوال الجوية.',
      scheduleLabel: '19:36',
      icon: Icons.wb_cloudy_outlined,
    ),
    DashboardDestination(
      title: 'الختام',
      route: AppRoutes.outro,
      summary: 'شاشة شكر وختام هادئ مع عودة منظمة إلى الصفحة الرئيسية.',
      scheduleLabel: 'CLOSE',
      icon: Icons.flag_circle_outlined,
    ),
  ];

  List<ProgramMetric> get metrics => const [
    ProgramMetric(
      label: 'المسارات الجاهزة',
      value: '13',
      caption: 'جميع صفحات البرنامج متاحة من هذه اللوحة',
    ),
    ProgramMetric(
      label: 'وضع البث',
      value: 'جاهز',
      caption: 'التبديل بين الفقرات عبر Get.toNamed',
    ),
    ProgramMetric(
      label: 'نمط الواجهة',
      value: 'TV',
      caption: 'تصميم رسمي بطابع غرفة تحكم إخبارية',
    ),
  ];

  ProgramQuote get editorialQuote => _repository.getHomeEditorialQuote();

  List<String> get tickerItems => const [
    'لوحة التحكم الرئيسية متصلة بجميع صفحات البرنامج عبر GetX',
    'تصميم رسمي بالأزرق الداكن والأحمر والأبيض مناسب لتطبيق نشرات الأخبار',
    'يمكن الانتقال مباشرة إلى المقدمة والعناوين والرياضة والطقس والختام',
  ];

  List<String> get statusItems => const [
    'الاستوديو الرئيسي',
    'وحدة العناوين',
    'غرفة الأخبار الاقتصادية',
    'مركز الطقس',
  ];

  void openRoute(String route) {
    Get.toNamed(route);
  }
}

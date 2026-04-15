import 'package:get/get.dart';
import 'package:newscope/modules/arab_news/bindings/arab_news_binding.dart';
import 'package:newscope/modules/arab_news/views/arab_news_view.dart';
import 'package:newscope/modules/breaking_news/bindings/breaking_news_binding.dart';
import 'package:newscope/modules/breaking_news/views/breaking_news_view.dart';
import 'package:newscope/modules/economy/bindings/economy_binding.dart';
import 'package:newscope/modules/economy/views/economy_view.dart';
import 'package:newscope/modules/headlines/bindings/headlines_binding.dart';
import 'package:newscope/modules/headlines/views/headlines_view.dart';
import 'package:newscope/modules/home/bindings/home_binding.dart';
import 'package:newscope/modules/home/views/home_view.dart';
import 'package:newscope/modules/intro/bindings/intro_binding.dart';
import 'package:newscope/modules/intro/views/intro_view.dart';
import 'package:newscope/modules/international_news/bindings/international_news_binding.dart';
import 'package:newscope/modules/international_news/views/international_news_view.dart';
import 'package:newscope/modules/local_news/bindings/local_news_binding.dart';
import 'package:newscope/modules/local_news/views/local_news_view.dart';
import 'package:newscope/modules/main_news/bindings/main_news_binding.dart';
import 'package:newscope/modules/main_news/views/main_news_view.dart';
import 'package:newscope/modules/outro/bindings/outro_binding.dart';
import 'package:newscope/modules/outro/views/outro_view.dart';
import 'package:newscope/modules/quotes/bindings/quotes_binding.dart';
import 'package:newscope/modules/quotes/views/quotes_view.dart';
import 'package:newscope/modules/report/bindings/report_binding.dart';
import 'package:newscope/modules/report/views/report_view.dart';
import 'package:newscope/modules/splash/bindings/splash_binding.dart';
import 'package:newscope/modules/splash/views/splash_view.dart';
import 'package:newscope/modules/sports/bindings/sports_binding.dart';
import 'package:newscope/modules/sports/views/sports_view.dart';
import 'package:newscope/modules/weather/bindings/weather_binding.dart';
import 'package:newscope/modules/weather/views/weather_view.dart';
import 'package:newscope/routes/app_routes.dart';

class AppPages {
  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.intro,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.headlines,
      page: () => const HeadlinesView(),
      binding: HeadlinesBinding(),
    ),
    GetPage(
      name: AppRoutes.mainNews,
      page: () => const MainNewsView(),
      binding: MainNewsBinding(),
    ),
    GetPage(
      name: AppRoutes.report,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: AppRoutes.quotes,
      page: () => const QuotesView(),
      binding: QuotesBinding(),
    ),
    GetPage(
      name: AppRoutes.localNews,
      page: () => const LocalNewsView(),
      binding: LocalNewsBinding(),
    ),
    GetPage(
      name: AppRoutes.arabNews,
      page: () => const ArabNewsView(),
      binding: ArabNewsBinding(),
    ),
    GetPage(
      name: AppRoutes.internationalNews,
      page: () => const InternationalNewsView(),
      binding: InternationalNewsBinding(),
    ),
    GetPage(
      name: AppRoutes.economy,
      page: () => const EconomyView(),
      binding: EconomyBinding(),
    ),
    GetPage(
      name: AppRoutes.breakingNews,
      page: () => const BreakingNewsView(),
      binding: BreakingNewsBinding(),
    ),
    GetPage(
      name: AppRoutes.sports,
      page: () => const SportsView(),
      binding: SportsBinding(),
    ),
    GetPage(
      name: AppRoutes.weather,
      page: () => const WeatherView(),
      binding: WeatherBinding(),
    ),
    GetPage(
      name: AppRoutes.outro,
      page: () => const OutroView(),
      binding: OutroBinding(),
    ),
  ];
}

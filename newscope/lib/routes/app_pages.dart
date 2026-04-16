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

abstract final class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = <GetPage<dynamic>>[
    _route(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    _route(
      name: AppRoutes.intro,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    _route(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    _route(
      name: AppRoutes.headlines,
      page: () => const HeadlinesView(),
      binding: HeadlinesBinding(),
    ),
    _route(
      name: AppRoutes.mainNews,
      page: () => const MainNewsView(),
      binding: MainNewsBinding(),
    ),
    _route(
      name: AppRoutes.report,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    _route(
      name: AppRoutes.quotes,
      page: () => const QuotesView(),
      binding: QuotesBinding(),
    ),
    _route(
      name: AppRoutes.localNews,
      page: () => const LocalNewsView(),
      binding: LocalNewsBinding(),
    ),
    _route(
      name: AppRoutes.arabNews,
      page: () => const ArabNewsView(),
      binding: ArabNewsBinding(),
    ),
    _route(
      name: AppRoutes.internationalNews,
      page: () => const InternationalNewsView(),
      binding: InternationalNewsBinding(),
    ),
    _route(
      name: AppRoutes.economy,
      page: () => const EconomyView(),
      binding: EconomyBinding(),
    ),
    _route(
      name: AppRoutes.breakingNews,
      page: () => const BreakingNewsView(),
      binding: BreakingNewsBinding(),
    ),
    _route(
      name: AppRoutes.sports,
      page: () => const SportsView(),
      binding: SportsBinding(),
    ),
    _route(
      name: AppRoutes.weather,
      page: () => const WeatherView(),
      binding: WeatherBinding(),
    ),
    _route(
      name: AppRoutes.outro,
      page: () => const OutroView(),
      binding: OutroBinding(),
    ),
  ];

  static GetPage<dynamic> _route({
    required String name,
    required GetPageBuilder page,
    required Bindings binding,
  }) {
    return GetPage<dynamic>(
      name: name,
      page: page,
      binding: binding,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 220),
    );
  }
}

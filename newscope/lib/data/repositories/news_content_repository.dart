import 'package:flutter/material.dart';
import 'package:newscope/app/data/mock/mock_arab_news.dart';
import 'package:newscope/app/data/mock/mock_breaking_news.dart';
import 'package:newscope/app/data/mock/mock_economy.dart';
import 'package:newscope/app/data/mock/mock_headlines.dart';
import 'package:newscope/app/data/mock/mock_international_news.dart';
import 'package:newscope/app/data/mock/mock_local_news.dart';
import 'package:newscope/app/data/mock/mock_main_news.dart';
import 'package:newscope/app/data/mock/mock_navigation.dart';
import 'package:newscope/app/data/mock/mock_quotes.dart';
import 'package:newscope/app/data/mock/mock_reports.dart';
import 'package:newscope/app/data/mock/mock_sports.dart';
import 'package:newscope/app/data/mock/mock_weather.dart';
import 'package:newscope/app/data/models/arab_news_model.dart';
import 'package:newscope/app/data/models/breaking_news_model.dart';
import 'package:newscope/app/data/models/economy_model.dart';
import 'package:newscope/app/data/models/headline_model.dart';
import 'package:newscope/app/data/models/international_news_model.dart';
import 'package:newscope/app/data/models/local_news_model.dart';
import 'package:newscope/app/data/models/main_news_model.dart';
import 'package:newscope/app/data/models/nav_item_model.dart';
import 'package:newscope/app/data/models/quote_model.dart';
import 'package:newscope/app/data/models/report_model.dart';
import 'package:newscope/app/data/models/sports_model.dart';
import 'package:newscope/app/data/models/weather_model.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/data/models/broadcast_section.dart';
import 'package:newscope/data/models/dashboard_destination.dart';
import 'package:newscope/data/models/program_metric.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/data/models/program_story.dart';

class NewsContentRepository {
  late final Map<String, BroadcastSection> _sections = {
    SectionKeys.headlines: _buildHeadlinesSection(),
    SectionKeys.mainNews: _buildMainNewsSection(),
    SectionKeys.report: _buildReportSection(),
    SectionKeys.quotes: _buildQuotesSection(),
    SectionKeys.localNews: _buildLocalNewsSection(),
    SectionKeys.arabNews: _buildArabNewsSection(),
    SectionKeys.internationalNews: _buildInternationalNewsSection(),
    SectionKeys.economy: _buildEconomySection(),
    SectionKeys.breakingNews: _buildBreakingNewsSection(),
    SectionKeys.sports: _buildSportsSection(),
    SectionKeys.weather: _buildWeatherSection(),
  };

  List<HeadlineModel> getHeadlines() => List.unmodifiable(mockHeadlines);

  MainNewsModel getMainNewsItem() => mockMainNewsItem;

  List<ReportModel> getReports() => List.unmodifiable(mockReports);

  List<QuoteModel> getQuotes() => List.unmodifiable(mockQuotes);

  List<LocalNewsModel> getLocalNews() => List.unmodifiable(mockLocalNews);

  List<ArabNewsModel> getArabNews() => List.unmodifiable(mockArabNews);

  List<InternationalNewsModel> getInternationalNews() =>
      List.unmodifiable(mockInternationalNews);

  List<EconomyModel> getEconomyItems() => List.unmodifiable(mockEconomyItems);

  List<BreakingNewsModel> getBreakingNews() =>
      List.unmodifiable(mockBreakingNews);

  List<SportsModel> getSportsItems() => List.unmodifiable(mockSportsItems);

  List<WeatherModel> getWeatherItems() => List.unmodifiable(mockWeatherItems);

  List<NavItemModel> getNavigationItems() =>
      List.unmodifiable(mockNavigationItems);

  List<DashboardDestination> getDashboardDestinations() {
    return getNavigationItems()
        .where((item) => item.routeName != '/')
        .map(
          (item) => DashboardDestination(
            title: item.title,
            route: item.routeName,
            summary: item.summary,
            scheduleLabel: item.scheduleLabel,
            icon: _iconFor(item.iconName),
          ),
        )
        .toList(growable: false);
  }

  List<ProgramStory> getHomeFeaturedStories() {
    return [
      _headlineToStory(getHeadlines().first),
      _mainNewsToStory(getMainNewsItem()),
      _economyToStory(getEconomyItems().first),
    ];
  }

  List<ProgramMetric> getHomeMetrics() {
    return [
      ProgramMetric(
        label: 'إجمالي المسارات',
        value: '${getNavigationItems().length}',
        caption: 'صفحات جاهزة للربط عبر GetX داخل التطبيق.',
      ),
      ProgramMetric(
        label: 'الشريط العاجل',
        value: '${getBreakingNews().length}',
        caption: 'تحديثات قصيرة مهيأة للبث المباشر في أسفل الشاشة.',
      ),
      ProgramMetric(
        label: 'مدن الطقس',
        value: '${getWeatherItems().length}',
        caption: 'تغطية جوية تشمل المدن الرئيسية والتنبيهات المتاحة.',
      ),
    ];
  }

  ProgramQuote getHomeEditorialQuote() {
    return const ProgramQuote(
      speaker: 'هيئة التحرير',
      role: 'مذكرة النشرة الرئيسية',
      quote:
          'نشرة الليلة مبنية على إيقاع كلاسيكي واضح: عناوين دقيقة، خبر رئيسي متماسك، تقارير ميدانية، وشريط عاجل سريع الإيقاع دون إخلال بالرصانة التحريرية.',
    );
  }

  List<String> getHomeTickerItems() {
    return getBreakingNews()
        .take(4)
        .map((item) => item.text)
        .toList(growable: false);
  }

  List<String> getStatusItems() {
    return const [
      'الاستوديو الرئيسي',
      'مكتب الأخبار المحلية',
      'شاشة الاقتصاد',
      'مركز الأرصاد',
    ];
  }

  BroadcastSection getSection(String key) => _sections[key]!;

  BroadcastSection _buildHeadlinesSection() {
    final stories = getHeadlines().map(_headlineToStory).toList(growable: false);

    return BroadcastSection(
      key: SectionKeys.headlines,
      title: 'العناوين الرئيسية',
      strapline: 'ستة عناوين افتتاحية ترسم خريطة النشرة لهذا المساء.',
      bulletinLabel: 'موجز الافتتاح',
      leadStory: stories.first,
      sideStories: stories.skip(1).toList(growable: false),
      highlights: const [
        ProgramMetric(
          label: 'عدد العناوين',
          value: '6',
          caption: 'موزعة بين السياسة والخدمات والاقتصاد.',
        ),
        ProgramMetric(
          label: 'نافذة الافتتاح',
          value: '12 دقيقة',
          caption: 'مدة مقدرة للموجز الرئيسي قبل الدخول في التفاصيل.',
        ),
        ProgramMetric(
          label: 'مكاتب المتابعة',
          value: '4',
          caption: 'المحلي والبرلمان والاقتصاد والخدمات.',
        ),
      ],
      quote: const ProgramQuote(
        speaker: 'ليلى الشريف',
        role: 'مقدمة النشرة',
        quote:
            'العنوان الجيد لا يكتفي بالإعلان عن الخبر، بل يضع المشاهد منذ اللحظة الأولى في قلب الأولويات.',
      ),
      agenda: const [
        'البدء بقرارات الحكومة الخاصة بضبط الأسواق وتعزيز المخزون الاستراتيجي.',
        'الانتقال إلى جاهزية الانتخابات والخدمات الصحية ومشروعات النقل.',
        'إغلاق الموجز بمتابعة البرلمان لأولويات الإنفاق العام.',
      ],
      tickerItems: getHeadlines()
          .map((item) => item.title)
          .toList(growable: false),
    );
  }

  BroadcastSection _buildMainNewsSection() {
    final mainNews = getMainNewsItem();
    final supportingStories = mainNews.bulletPoints
        .asMap()
        .entries
        .map(
          (entry) => ProgramStory(
            title: entry.value,
            summary:
                'متابعة تفصيلية ضمن الملف الرئيسي توضح أثر هذا المحور على حركة التجارة وكفاءة الخدمات اللوجستية.',
            category: 'محور متابعة',
            timeLabel: '19:0${entry.key + 2}',
            reporter: mainNews.reporter,
            location: mainNews.location,
            focus: 'تفصيل تنفيذي',
          ),
        )
        .toList(growable: false);

    return BroadcastSection(
      key: SectionKeys.mainNews,
      title: 'الخبر الرئيسي',
      strapline: 'ملف رئيسي يتابع الجداول التنفيذية والأثر الاقتصادي المباشر.',
      bulletinLabel: 'النشرة الرئيسية',
      leadStory: _mainNewsToStory(mainNews),
      sideStories: supportingStories,
      highlights: const [
        ProgramMetric(
          label: 'محاور التنفيذ',
          value: '4',
          caption: 'عناصر متابعة مباشرة ضمن عرض الخبر الرئيسي.',
        ),
        ProgramMetric(
          label: 'مدة التغطية',
          value: '18 دقيقة',
          caption: 'تشمل تقديمًا وتحليلًا ومداخلات داعمة.',
        ),
        ProgramMetric(
          label: 'جهات متابعة',
          value: '6',
          caption: 'وزارات وهيئات معنية بالتشغيل والخدمات اللوجستية.',
        ),
      ],
      quote: const ProgramQuote(
        speaker: 'رانيا مصطفى',
        role: 'المذيعة الرئيسية',
        quote:
            'الخبر الرئيسي يجب أن يقدم الصورة الكبيرة بوضوح، ثم يهبط إلى التفاصيل التي تهم المشاهد في حياته اليومية.',
      ),
      agenda: mainNews.bulletPoints,
      tickerItems: mainNews.bulletPoints,
    );
  }

  BroadcastSection _buildReportSection() {
    final reports = getReports();
    final stories = reports.map(_reportToStory).toList(growable: false);
    final leadReport = reports.first;

    return BroadcastSection(
      key: SectionKeys.report,
      title: 'التقرير الخاص',
      strapline: 'ثلاثة تقارير ميدانية تعمق الصورة خلف العناوين.',
      bulletinLabel: 'تقرير ميداني',
      leadStory: stories.first,
      sideStories: stories.skip(1).toList(growable: false),
      highlights: leadReport.highlights
          .map(
            (item) => ProgramMetric(
              label: 'معلومة رئيسية',
              value: 'جاهز',
              caption: item,
            ),
          )
          .toList(growable: false),
      quote: const ProgramQuote(
        speaker: 'قسم التحقيقات',
        role: 'غرفة التقارير الخاصة',
        quote:
            'التقرير الميداني الجيد يضيف للمشهد ما لا تقوله الأرقام وحدها: الصورة، والمسار، وتفاصيل التنفيذ.',
      ),
      agenda: leadReport.highlights,
      tickerItems: reports
          .map((report) => report.title)
          .toList(growable: false),
    );
  }

  BroadcastSection _buildQuotesSection() {
    final quotes = getQuotes();
    final quoteStories = quotes.map(_quoteToStory).toList(growable: false);

    return BroadcastSection(
      key: SectionKeys.quotes,
      title: 'الاقتباسات',
      strapline: 'تصريحات رسمية واقتصادية وإقليمية ورياضية بصياغة تحريرية واضحة.',
      bulletinLabel: 'أقوال وتصريحات',
      leadStory: quoteStories.first,
      sideStories: quoteStories.skip(1).toList(growable: false),
      highlights: quotes
          .take(3)
          .map(
            (item) => ProgramMetric(
              label: item.topic,
              value: item.publishTime,
              caption: item.source,
            ),
          )
          .toList(growable: false),
      quote: _quoteToProgramQuote(quotes.first),
      agenda: quotes
          .map((item) => '${item.topic}: ${item.source}')
          .toList(growable: false),
      tickerItems: quotes
          .map((item) => item.quoteText)
          .toList(growable: false),
    );
  }

  BroadcastSection _buildLocalNewsSection() {
    final stories = getLocalNews().map(_localNewsToStory).toList(growable: false);

    return BroadcastSection(
      key: SectionKeys.localNews,
      title: 'الأخبار المحلية',
      strapline: 'متابعة المحافظات في الخدمات والمرافق والتنمية اليومية.',
      bulletinLabel: 'مكتب المحافظات',
      leadStory: stories.first,
      sideStories: stories.skip(1).toList(growable: false),
      highlights: const [
        ProgramMetric(
          label: 'عدد المحافظات',
          value: '6',
          caption: 'تغطية تمتد من القاهرة إلى بورسعيد وأسوان.',
        ),
        ProgramMetric(
          label: 'ملفات الخدمات',
          value: '4',
          caption: 'الصحة والطرق والتموين والتنمية الحضرية.',
        ),
        ProgramMetric(
          label: 'التحديث المحلي',
          value: 'مستمر',
          caption: 'محتوى جاهز للعرض في بطاقات وقوائم داخلية.',
        ),
      ],
      quote: const ProgramQuote(
        speaker: 'مكتب الأخبار المحلية',
        role: 'خط التغطية',
        quote:
            'الخبر المحلي الناجح يقيس أثر القرار أو المشروع على حياة الناس بلغة مباشرة ودقيقة.',
      ),
      agenda: const [
        'البدء بالخدمات الصحية في القاهرة والطرق في الجيزة.',
        'الانتقال إلى استعدادات الصيف في الإسكندرية والتنمية الحضرية في المنصورة.',
        'إغلاق الفقرة بخدمات المرافق والتموين في أسوان وبورسعيد.',
      ],
      tickerItems: getLocalNews()
          .map((item) => item.title)
          .toList(growable: false),
    );
  }

  BroadcastSection _buildArabNewsSection() {
    final stories = getArabNews().map(_arabNewsToStory).toList(growable: false);

    return BroadcastSection(
      key: SectionKeys.arabNews,
      title: 'الأخبار العربية',
      strapline: 'ملفات إقليمية من العواصم العربية بلهجة تحريرية رسمية.',
      bulletinLabel: 'النافذة العربية',
      leadStory: stories.first,
      sideStories: stories.skip(1).toList(growable: false),
      highlights: const [
        ProgramMetric(
          label: 'عواصم المتابعة',
          value: '6',
          caption: 'من الرياض وبغداد إلى الدوحة والرباط.',
        ),
        ProgramMetric(
          label: 'ملفات الفقرة',
          value: 'طاقة وخدمات',
          caption: 'تنسيق عربي، تجارة، وتحول رقمي.',
        ),
        ProgramMetric(
          label: 'الإيقاع التحريري',
          value: 'متوازن',
          caption: 'ربط التطورات الإقليمية بسياقها الاقتصادي والخدمي.',
        ),
      ],
      quote: const ProgramQuote(
        speaker: 'مكتب الشؤون العربية',
        role: 'رؤية تحريرية',
        quote:
            'المتابعة الإقليمية الرصينة تبدأ من الخبر، لكنها لا تكتمل من دون قراءة ما وراءه من توازنات ومصالح.',
      ),
      agenda: const [
        'بدء الفقرة باجتماع الرياض حول الأمن الغذائي.',
        'متابعة الملفات الخدمية والاقتصادية في بغداد وأبوظبي وعمّان.',
        'اختتام النافذة العربية بالطاقة والتحول الرقمي في الدوحة والرباط.',
      ],
      tickerItems: getArabNews()
          .map((item) => item.title)
          .toList(growable: false),
    );
  }

  BroadcastSection _buildInternationalNewsSection() {
    final stories = getInternationalNews()
        .map(_internationalNewsToStory)
        .toList(growable: false);

    return BroadcastSection(
      key: SectionKeys.internationalNews,
      title: 'الأخبار الدولية',
      strapline: 'جولة عالمية بين السياسة الدولية والأسواق والطاقة والملفات الإنسانية.',
      bulletinLabel: 'حول العالم',
      leadStory: stories.first,
      sideStories: stories.skip(1).toList(growable: false),
      highlights: const [
        ProgramMetric(
          label: 'نوافذ دولية',
          value: '6',
          caption: 'أوروبا وأمريكا وآسيا وأفريقيا والمنظمات الدولية.',
        ),
        ProgramMetric(
          label: 'ملف الاقتصاد',
          value: 'حاضر',
          caption: 'الطاقة والصناعة وثقة الشركات ضمن أبرز المحاور.',
        ),
        ProgramMetric(
          label: 'التغطية التحريرية',
          value: 'متعددة',
          caption: 'قمم دولية وبيانات صناعية وتحركات إنسانية.',
        ),
      ],
      quote: const ProgramQuote(
        speaker: 'مكتب الأخبار الدولية',
        role: 'مذكرة المتابعة',
        quote:
            'العالم يتحرك في مسارات متوازية: قرارات سياسية، أرقام اقتصادية، واستجابات إنسانية لا تقل أهمية عن كليهما.',
      ),
      agenda: const [
        'افتتاح الجولة بقمة بروكسل وأمن الطاقة الأوروبي.',
        'المرور على واشنطن وبكين وجنيف بوصفها محطات رئيسية في نشرة الليلة.',
        'إغلاق الفقرة مع نيروبي وطوكيو ومؤشرات النقل والتصنيع.',
      ],
      tickerItems: getInternationalNews()
          .map((item) => item.title)
          .toList(growable: false),
    );
  }

  BroadcastSection _buildEconomySection() {
    final economyItems = getEconomyItems();
    final stories = economyItems.map(_economyToStory).toList(growable: false);

    return BroadcastSection(
      key: SectionKeys.economy,
      title: 'الاقتصاد',
      strapline: 'بطاقات أسواق وأسعار ومؤشرات في صياغة موجزة وقابلة للعرض.',
      bulletinLabel: 'شاشة الأسواق',
      leadStory: stories.first,
      sideStories: stories.skip(1).toList(growable: false),
      highlights: [
        ProgramMetric(
          label: economyItems[1].title,
          value: economyItems[1].value,
          caption: economyItems[1].analysis,
        ),
        ProgramMetric(
          label: economyItems[3].title,
          value: economyItems[3].value,
          caption: economyItems[3].analysis,
        ),
        ProgramMetric(
          label: economyItems[4].title,
          value: economyItems[4].value,
          caption: economyItems[4].analysis,
        ),
      ],
      quote: const ProgramQuote(
        speaker: 'محرر الشؤون الاقتصادية',
        role: 'قراءة السوق',
        quote:
            'الفقرة الاقتصادية الناجحة تربط بين الشاشة الرقمية وبين أثر الأرقام على السوق والمستهلك في آن واحد.',
      ),
      agenda: const [
        'استعراض المؤشر الرئيسي للبورصة وحركة الأسهم القيادية.',
        'عرض أسعار العملات الرئيسة والذهب والطاقة في بطاقات منفصلة.',
        'ختم الفقرة بقراءة قصيرة لمؤشر مديري المشتريات واتجاه النشاط الخاص.',
      ],
      tickerItems: economyItems
          .map((item) => '${item.title}: ${item.value}')
          .toList(growable: false),
    );
  }

  BroadcastSection _buildBreakingNewsSection() {
    final breakingStories = getBreakingNews()
        .map(_breakingNewsToStory)
        .toList(growable: false);

    return BroadcastSection(
      key: SectionKeys.breakingNews,
      title: 'الأخبار العاجلة',
      strapline: 'شريط عاجل من تحديثات قصيرة موثقة وقابلة للعرض الفوري.',
      bulletinLabel: 'عاجل الآن',
      leadStory: breakingStories.first,
      sideStories: breakingStories.skip(1).toList(growable: false),
      highlights: const [
        ProgramMetric(
          label: 'تحديثات الليلة',
          value: '8',
          caption: 'بنصوص قصيرة مناسبة لشريط الأخبار.',
        ),
        ProgramMetric(
          label: 'مصادر التحديث',
          value: 'متعددة',
          caption: 'حكومية وخدمية واقتصادية ورياضية.',
        ),
        ProgramMetric(
          label: 'سرعة النشر',
          value: 'فوري',
          caption: 'محتوى مهيأ للعرض مع التحقق من المصدر.',
        ),
      ],
      quote: const ProgramQuote(
        speaker: 'مكتب الأخبار العاجلة',
        role: 'ضابط الإيقاع',
        quote:
            'السرعة مهمة، لكن قيمة الشريط العاجل تبدأ من الدقة ثم تأتي بعدها الأولوية والترتيب.',
      ),
      agenda: getBreakingNews()
          .take(5)
          .map((item) => item.text)
          .toList(growable: false),
      tickerItems: getBreakingNews()
          .map((item) => item.text)
          .toList(growable: false),
    );
  }

  BroadcastSection _buildSportsSection() {
    final sportsItems = getSportsItems();
    final stories = sportsItems.map(_sportsToStory).toList(growable: false);

    return BroadcastSection(
      key: SectionKeys.sports,
      title: 'الرياضة',
      strapline: 'نتائج ومؤشرات وترتيب مختصر للمنافسات المحلية والقارية.',
      bulletinLabel: 'الملف الرياضي',
      leadStory: stories.first,
      sideStories: stories.skip(1).toList(growable: false),
      highlights: [
        ProgramMetric(
          label: 'صدارة الدوري',
          value: 'الأهلي',
          caption: 'الأهلي يتقدم مؤقتًا بعد فوزه في مواجهة القمة.',
        ),
        ProgramMetric(
          label: 'أقوى نتيجة',
          value: '3 - 0',
          caption: 'فوز منتخب مصر الأولمبي على تونس في البطولة الودية.',
        ),
        ProgramMetric(
          label: 'أبرز منافسة',
          value: 'كرة اليد',
          caption: 'فوز مهم للمنتخب المصري في البطولة القارية.',
        ),
      ],
      quote: const ProgramQuote(
        speaker: 'قسم الرياضة',
        role: 'ملخص التحرير الرياضي',
        quote:
            'النتيجة هي البداية فقط؛ أما القيمة التحريرية الحقيقية فتظهر في شرح تأثيرها على الترتيب والمشهد العام.',
      ),
      agenda: sportsItems
          .take(4)
          .map((item) => item.scoreSummary)
          .toList(growable: false),
      tickerItems: sportsItems
          .map((item) => '${item.matchTitle} | ${item.result}')
          .toList(growable: false),
    );
  }

  BroadcastSection _buildWeatherSection() {
    final weatherItems = getWeatherItems();
    final weatherStories = weatherItems
        .map(_weatherToStory)
        .toList(growable: false);
    final weatherWarning = weatherItems.firstWhere(
      (item) => item.warning != null,
      orElse: () => weatherItems.first,
    );

    return BroadcastSection(
      key: SectionKeys.weather,
      title: 'الطقس',
      strapline: 'بيانات درجات الحرارة والظواهر الجوية في المدن الرئيسية.',
      bulletinLabel: 'مركز الأرصاد',
      leadStory: _weatherToStory(weatherWarning),
      sideStories: weatherStories,
      highlights: weatherItems
          .take(3)
          .map(
            (item) => ProgramMetric(
              label: item.city,
              value: '${item.temperature}°',
              caption: '${item.condition} | ${item.high}° / ${item.low}°',
            ),
          )
          .toList(growable: false),
      quote: const ProgramQuote(
        speaker: 'مركز التنبؤات',
        role: 'النشرة الجوية',
        quote:
            'الطقس في نشرة الأخبار ليس مجرد درجات حرارة، بل معلومة تشغيلية مرتبطة بالطرق والموانئ وحركة المواطنين.',
      ),
      agenda: const [
        'البدء بالتنبيه الجوي على الساحل الشمالي الغربي.',
        'استعراض درجات الحرارة في القاهرة والإسكندرية والمدن الساحلية.',
        'إغلاق الفقرة بالمناطق الحارة والتنبيهات الخاصة بالطرق المفتوحة.',
      ],
      tickerItems: weatherItems
          .map((item) => '${item.city}: ${item.temperature}° ${item.condition}')
          .toList(growable: false),
    );
  }

  ProgramStory _headlineToStory(HeadlineModel model) {
    return ProgramStory(
      title: model.title,
      summary: model.summary,
      category: model.category,
      timeLabel: model.publishTime,
      reporter: model.reporter,
      location: model.location,
      focus: model.focusTag,
    );
  }

  ProgramStory _mainNewsToStory(MainNewsModel model) {
    return ProgramStory(
      title: model.title,
      summary: model.summary,
      category: model.category,
      timeLabel: model.publishTime,
      reporter: model.reporter,
      location: model.location,
      focus: model.focusTag,
    );
  }

  ProgramStory _reportToStory(ReportModel model) {
    return ProgramStory(
      title: model.title,
      summary: model.description,
      category: model.category,
      timeLabel: model.publishTime,
      reporter: model.reporter,
      location: model.location,
      focus: 'تقرير ميداني',
    );
  }

  ProgramStory _quoteToStory(QuoteModel model) {
    return ProgramStory(
      title: model.quoteText,
      summary: '${model.role} | ${model.source}',
      category: 'تصريح',
      timeLabel: model.publishTime,
      reporter: model.speakerName,
      location: model.source,
      focus: model.topic,
    );
  }

  ProgramQuote _quoteToProgramQuote(QuoteModel model) {
    return ProgramQuote(
      speaker: model.speakerName,
      role: model.role,
      quote: model.quoteText,
    );
  }

  ProgramStory _localNewsToStory(LocalNewsModel model) {
    return ProgramStory(
      title: model.title,
      summary: model.shortSummary,
      category: model.category,
      timeLabel: model.publishTime,
      reporter: model.reporter,
      location: model.location,
      focus: 'محافظات',
    );
  }

  ProgramStory _arabNewsToStory(ArabNewsModel model) {
    return ProgramStory(
      title: model.title,
      summary: model.shortSummary,
      category: model.category,
      timeLabel: model.publishTime,
      reporter: model.reporter,
      location: model.location,
      focus: 'إقليم',
    );
  }

  ProgramStory _internationalNewsToStory(InternationalNewsModel model) {
    return ProgramStory(
      title: model.title,
      summary: model.shortSummary,
      category: model.category,
      timeLabel: model.publishTime,
      reporter: model.reporter,
      location: model.location,
      focus: 'دولي',
    );
  }

  ProgramStory _economyToStory(EconomyModel model) {
    return ProgramStory(
      title: model.title,
      summary: model.analysis,
      category: model.market,
      timeLabel: model.publishTime,
      reporter: 'شاشة الأسواق',
      location: model.value,
      focus: model.change,
    );
  }

  ProgramStory _breakingNewsToStory(BreakingNewsModel model) {
    return ProgramStory(
      title: model.text,
      summary: '${model.source} | ${model.urgency}',
      category: 'تحديث عاجل',
      timeLabel: model.publishTime,
      reporter: model.source,
      location: model.location,
      focus: model.urgency,
    );
  }

  ProgramStory _sportsToStory(SportsModel model) {
    return ProgramStory(
      title: model.matchTitle,
      summary: model.scoreSummary,
      category: model.competition,
      timeLabel: model.time,
      reporter: 'قسم الرياضة',
      location: model.result,
      focus: model.status,
    );
  }

  ProgramStory _weatherToStory(WeatherModel model) {
    final warning = model.warning ?? 'لا توجد تنبيهات خاصة على هذه المدينة.';

    return ProgramStory(
      title: 'طقس ${model.city}',
      summary: '$warning الحالة العامة: ${model.condition}.',
      category: 'الأرصاد',
      timeLabel: 'تحديث مسائي',
      reporter: 'مركز الأرصاد',
      location: model.city,
      focus: '${model.temperature}°',
    );
  }

  IconData _iconFor(String iconName) {
    switch (iconName) {
      case 'splash':
        return Icons.flash_on_outlined;
      case 'intro':
        return Icons.slideshow_outlined;
      case 'home':
        return Icons.dashboard_outlined;
      case 'headlines':
        return Icons.view_headline_rounded;
      case 'main_news':
        return Icons.campaign_outlined;
      case 'report':
        return Icons.description_outlined;
      case 'quotes':
        return Icons.format_quote_outlined;
      case 'local_news':
        return Icons.location_city_outlined;
      case 'arab_news':
        return Icons.public_outlined;
      case 'international_news':
        return Icons.language_outlined;
      case 'economy':
        return Icons.account_balance_outlined;
      case 'breaking_news':
        return Icons.notification_important_outlined;
      case 'sports':
        return Icons.sports_soccer_outlined;
      case 'weather':
        return Icons.wb_cloudy_outlined;
      case 'outro':
        return Icons.flag_circle_outlined;
      default:
        return Icons.radio_button_checked_outlined;
    }
  }
}

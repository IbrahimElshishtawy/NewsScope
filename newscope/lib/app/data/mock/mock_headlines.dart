import 'package:newscope/app/data/models/headline_model.dart';

const mockHeadlines = <HeadlineModel>[
  HeadlineModel(
    title: 'مجلس الوزراء يعتمد حزمة قرارات جديدة لضبط الأسواق وتعزيز المخزون الاستراتيجي للسلع الأساسية',
    summary:
        'القرارات تتضمن توسيع منافذ التوزيع، وتشديد آليات الرقابة الميدانية، ورفع معدلات الإمداد في المحافظات ذات الكثافة السكانية العالية.',
    category: 'العناوين الرئيسية',
    publishTime: '18:00',
    location: 'القاهرة',
    reporter: 'سلمى فؤاد',
    focusTag: 'قرارات حكومية',
    imageUrl: 'assets/placeholders/headlines/headline_01.jpg',
  ),
  HeadlineModel(
    title: 'الهيئة الوطنية للانتخابات تؤكد جاهزية غرف المتابعة ومقار الاقتراع قبل الاستحقاقات المقبلة',
    summary:
        'الهيئة أوضحت اكتمال المراجعات الفنية في المحافظات، مع تحديث منظومة الربط الإلكتروني وخطط الدعم اللوجستي للجان الفرعية.',
    category: 'شؤون سياسية',
    publishTime: '18:04',
    location: 'الجيزة',
    reporter: 'محمود الشاذلي',
    focusTag: 'استعدادات ميدانية',
    imageUrl: 'assets/placeholders/headlines/headline_02.jpg',
  ),
  HeadlineModel(
    title: 'وزارة الصحة ترفع درجة الاستعداد في المستشفيات الجامعية وتوسع خدمات الطوارئ خلال عطلة نهاية الأسبوع',
    summary:
        'الخطة تشمل دعم فرق الاستقبال، ومراجعة أرصدة الأدوية الحيوية، وتعزيز التنسيق مع سيارات الإسعاف وغرف العمليات المركزية.',
    category: 'صحة',
    publishTime: '18:07',
    location: 'الإسكندرية',
    reporter: 'هدى سمير',
    focusTag: 'خدمات طبية',
    imageUrl: 'assets/placeholders/headlines/headline_03.jpg',
  ),
  HeadlineModel(
    title: 'وزارة النقل تبدأ التشغيل التجريبي لمحطة تبادلية جديدة على الدائري الإقليمي ضمن خطة تخفيف الكثافات',
    summary:
        'المشروع يستهدف تقليل زمن الانتقال بين المحاور الرئيسية وربط المناطق الصناعية بالموانئ الجافة وفق جدول تشغيل مرحلي.',
    category: 'نقل ومرافق',
    publishTime: '18:11',
    location: 'القليوبية',
    reporter: 'أحمد ياسين',
    focusTag: 'بنية تحتية',
    imageUrl: 'assets/placeholders/headlines/headline_04.jpg',
  ),
  HeadlineModel(
    title: 'وزارة التموين توسع معارض السلع الأساسية في المحافظات وتعلن زيادة المعروض من الزيوت والسكر والأرز',
    summary:
        'التوسع الجديد يستهدف المناطق الأعلى طلبًا، مع متابعة يومية للأسعار وضخ كميات إضافية قبل مواسم الاستهلاك المرتفع.',
    category: 'خدمات',
    publishTime: '18:15',
    location: 'المنصورة',
    reporter: 'نهى عبد السلام',
    focusTag: 'ضبط الأسواق',
    imageUrl: 'assets/placeholders/headlines/headline_05.jpg',
  ),
  HeadlineModel(
    title: 'مجلس النواب يناقش تقرير لجنة الخطة والموازنة بشأن أولويات الإنفاق العام في مشروع الموازنة الجديدة',
    summary:
        'النقاشات تركز على مخصصات التعليم والصحة وبرامج الحماية الاجتماعية، مع مطالبات بمتابعة أكثر دقة لمعدلات التنفيذ.',
    category: 'برلمان',
    publishTime: '18:18',
    location: 'العاصمة الإدارية الجديدة',
    reporter: 'يوسف عادل',
    focusTag: 'مؤشرات مالية',
    imageUrl: 'assets/placeholders/headlines/headline_06.jpg',
  ),
];

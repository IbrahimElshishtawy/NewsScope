import 'package:newscope/app/data/models/quote_model.dart';

const mockQuotes = <QuoteModel>[
  QuoteModel(
    speakerName: 'المستشار محمد الحمصاني',
    role: 'المتحدث الرسمي باسم مجلس الوزراء',
    quoteText:
        'الحكومة مستمرة في متابعة توافر السلع الأساسية وضبط الأسواق وفق آليات تنفيذية واضحة ومعلنة للرأي العام.',
    source: 'المؤتمر الصحفي الأسبوعي لمجلس الوزراء',
    imageUrl: 'assets/placeholders/quotes/quote_01.jpg',
    publishTime: '18:20',
    topic: 'السلع والأسواق',
  ),
  QuoteModel(
    speakerName: 'حسن عبد الله',
    role: 'محافظ البنك المركزي المصري',
    quoteText:
        'مؤشرات السيولة والتحسن التدريجي في بعض الأسعار تمنح السوق مساحة أكبر للاستقرار مع بقاء المتابعة الحذرة ضرورة مستمرة.',
    source: 'جلسة حوار مع قيادات القطاع المصرفي',
    imageUrl: 'assets/placeholders/quotes/quote_02.jpg',
    publishTime: '18:44',
    topic: 'المؤشرات الاقتصادية',
  ),
  QuoteModel(
    speakerName: 'أحمد أبو الغيط',
    role: 'الأمين العام لجامعة الدول العربية',
    quoteText:
        'التنسيق العربي في الملفات الإنسانية والتنموية لم يعد خيارًا سياسيًا فقط، بل أصبح ضرورة عملية تفرضها تطورات المنطقة.',
    source: 'الاجتماع الوزاري العربي في القاهرة',
    imageUrl: 'assets/placeholders/quotes/quote_03.jpg',
    publishTime: '19:05',
    topic: 'التطورات الإقليمية',
  ),
  QuoteModel(
    speakerName: 'إيهاب الكومي',
    role: 'عضو مجلس إدارة الاتحاد المصري لكرة القدم',
    quoteText:
        'الترتيبات التنظيمية للموسم الجديد تستهدف رفع الانضباط وضمان وضوح الجدول بما يخدم الأندية والجماهير على حد سواء.',
    source: 'تصريحات للاتحاد المصري لكرة القدم',
    imageUrl: 'assets/placeholders/quotes/quote_04.jpg',
    publishTime: '19:32',
    topic: 'الملف الرياضي',
  ),
];

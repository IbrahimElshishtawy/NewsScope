import 'package:newscope/app/data/models/economy_model.dart';

const mockEconomyItems = <EconomyModel>[
  EconomyModel(
    title: 'مؤشر EGX30',
    market: 'البورصة المصرية',
    value: '31,845 نقطة',
    change: '+0.8%',
    analysis:
        'الأسهم القيادية حافظت على اتجاه صاعد محدود بدعم من تحسن السيولة وترقب نتائج الأعمال الفصلية.',
    publishTime: '18:30',
    type: 'market',
  ),
  EconomyModel(
    title: 'سعر الدولار',
    market: 'الجنيه المصري',
    value: '48.32',
    change: 'مستقر',
    analysis:
        'التعاملات المصرفية أظهرت استقرارًا نسبيًا في سوق الصرف مع توازن بين الطلبات التجارية والتدفقات الدولارية.',
    publishTime: '18:32',
    type: 'currency',
  ),
  EconomyModel(
    title: 'سعر اليورو',
    market: 'الجنيه المصري',
    value: '51.41',
    change: '+0.2%',
    analysis:
        'العملة الأوروبية تحركت في نطاق محدود متأثرة بأداء الأسواق العالمية وتغيرات أسعار الفائدة الخارجية.',
    publishTime: '18:34',
    type: 'currency',
  ),
  EconomyModel(
    title: 'الذهب عيار 21',
    market: 'السوق المحلية',
    value: '4,185 جنيهًا',
    change: '+25 جنيهًا',
    analysis:
        'الأسعار المحلية سجلت ارتفاعًا طفيفًا مدعومًا بتحركات الأوقية عالميًا واستمرار الطلب التحوطي.',
    publishTime: '18:36',
    type: 'gold',
  ),
  EconomyModel(
    title: 'خام برنت',
    market: 'الأسواق العالمية',
    value: '84.7 دولارًا',
    change: '-0.4%',
    analysis:
        'النفط تحرك هبوطًا بشكل محدود مع ترقب الأسواق لبيانات المخزون وتوقعات الطلب الصناعي في آسيا.',
    publishTime: '18:38',
    type: 'oil',
  ),
  EconomyModel(
    title: 'مؤشر مديري المشتريات',
    market: 'القطاع الخاص غير النفطي',
    value: '50.9 نقطة',
    change: '+0.6 نقطة',
    analysis:
        'القراءة تشير إلى تحسن تدريجي في نشاط الأعمال الجديدة مع استقرار نسبي في تكاليف التشغيل.',
    publishTime: '18:40',
    type: 'analysis',
  ),
];

import 'package:newscope/app/data/models/weather_model.dart';

const mockWeatherItems = <WeatherModel>[
  WeatherModel(
    city: 'القاهرة',
    temperature: 29,
    condition: 'مشمس جزئيًا',
    high: 31,
    low: 20,
    iconCode: 'sunny',
  ),
  WeatherModel(
    city: 'الإسكندرية',
    temperature: 24,
    condition: 'نشاط رياح معتدل',
    high: 26,
    low: 18,
    iconCode: 'windy',
  ),
  WeatherModel(
    city: 'مطروح',
    temperature: 22,
    condition: 'أتربة خفيفة',
    high: 24,
    low: 17,
    iconCode: 'dust',
    warning: 'تنبيه ملاحي بسبب انخفاض الرؤية الأفقية على بعض الطرق الساحلية المفتوحة.',
  ),
  WeatherModel(
    city: 'أسوان',
    temperature: 35,
    condition: 'حار نهارًا',
    high: 37,
    low: 23,
    iconCode: 'hot',
  ),
  WeatherModel(
    city: 'شرم الشيخ',
    temperature: 30,
    condition: 'صحو',
    high: 32,
    low: 24,
    iconCode: 'clear',
  ),
  WeatherModel(
    city: 'المنصورة',
    temperature: 27,
    condition: 'غائم جزئيًا',
    high: 29,
    low: 19,
    iconCode: 'cloudy',
  ),
];

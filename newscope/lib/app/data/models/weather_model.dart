class WeatherModel {
  const WeatherModel({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.high,
    required this.low,
    required this.iconCode,
    this.warning,
  });

  final String city;
  final int temperature;
  final String condition;
  final int high;
  final int low;
  final String iconCode;
  final String? warning;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['city'] as String? ?? '',
      temperature: json['temperature'] as int? ?? 0,
      condition: json['condition'] as String? ?? '',
      high: json['high'] as int? ?? 0,
      low: json['low'] as int? ?? 0,
      iconCode: json['iconCode'] as String? ?? '',
      warning: json['warning'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'temperature': temperature,
      'condition': condition,
      'high': high,
      'low': low,
      'iconCode': iconCode,
      'warning': warning,
    };
  }

  WeatherModel copyWith({
    String? city,
    int? temperature,
    String? condition,
    int? high,
    int? low,
    String? iconCode,
    String? warning,
  }) {
    return WeatherModel(
      city: city ?? this.city,
      temperature: temperature ?? this.temperature,
      condition: condition ?? this.condition,
      high: high ?? this.high,
      low: low ?? this.low,
      iconCode: iconCode ?? this.iconCode,
      warning: warning ?? this.warning,
    );
  }
}

class EconomyModel {
  const EconomyModel({
    required this.title,
    required this.market,
    required this.value,
    required this.change,
    required this.analysis,
    required this.publishTime,
    required this.type,
  });

  final String title;
  final String market;
  final String value;
  final String change;
  final String analysis;
  final String publishTime;
  final String type;

  factory EconomyModel.fromJson(Map<String, dynamic> json) {
    return EconomyModel(
      title: json['title'] as String? ?? '',
      market: json['market'] as String? ?? '',
      value: json['value'] as String? ?? '',
      change: json['change'] as String? ?? '',
      analysis: json['analysis'] as String? ?? '',
      publishTime: json['publishTime'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'market': market,
      'value': value,
      'change': change,
      'analysis': analysis,
      'publishTime': publishTime,
      'type': type,
    };
  }

  EconomyModel copyWith({
    String? title,
    String? market,
    String? value,
    String? change,
    String? analysis,
    String? publishTime,
    String? type,
  }) {
    return EconomyModel(
      title: title ?? this.title,
      market: market ?? this.market,
      value: value ?? this.value,
      change: change ?? this.change,
      analysis: analysis ?? this.analysis,
      publishTime: publishTime ?? this.publishTime,
      type: type ?? this.type,
    );
  }
}

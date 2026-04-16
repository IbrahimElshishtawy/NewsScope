class BreakingNewsModel {
  const BreakingNewsModel({
    required this.text,
    required this.location,
    required this.publishTime,
    required this.source,
    required this.urgency,
  });

  final String text;
  final String location;
  final String publishTime;
  final String source;
  final String urgency;

  factory BreakingNewsModel.fromJson(Map<String, dynamic> json) {
    return BreakingNewsModel(
      text: json['text'] as String? ?? '',
      location: json['location'] as String? ?? '',
      publishTime: json['publishTime'] as String? ?? '',
      source: json['source'] as String? ?? '',
      urgency: json['urgency'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'location': location,
      'publishTime': publishTime,
      'source': source,
      'urgency': urgency,
    };
  }

  BreakingNewsModel copyWith({
    String? text,
    String? location,
    String? publishTime,
    String? source,
    String? urgency,
  }) {
    return BreakingNewsModel(
      text: text ?? this.text,
      location: location ?? this.location,
      publishTime: publishTime ?? this.publishTime,
      source: source ?? this.source,
      urgency: urgency ?? this.urgency,
    );
  }
}

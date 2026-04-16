class QuoteModel {
  const QuoteModel({
    required this.speakerName,
    required this.role,
    required this.quoteText,
    required this.source,
    required this.imageUrl,
    required this.publishTime,
    required this.topic,
  });

  final String speakerName;
  final String role;
  final String quoteText;
  final String source;
  final String imageUrl;
  final String publishTime;
  final String topic;

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      speakerName: json['speakerName'] as String? ?? '',
      role: json['role'] as String? ?? '',
      quoteText: json['quoteText'] as String? ?? '',
      source: json['source'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      publishTime: json['publishTime'] as String? ?? '',
      topic: json['topic'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'speakerName': speakerName,
      'role': role,
      'quoteText': quoteText,
      'source': source,
      'imageUrl': imageUrl,
      'publishTime': publishTime,
      'topic': topic,
    };
  }

  QuoteModel copyWith({
    String? speakerName,
    String? role,
    String? quoteText,
    String? source,
    String? imageUrl,
    String? publishTime,
    String? topic,
  }) {
    return QuoteModel(
      speakerName: speakerName ?? this.speakerName,
      role: role ?? this.role,
      quoteText: quoteText ?? this.quoteText,
      source: source ?? this.source,
      imageUrl: imageUrl ?? this.imageUrl,
      publishTime: publishTime ?? this.publishTime,
      topic: topic ?? this.topic,
    );
  }
}

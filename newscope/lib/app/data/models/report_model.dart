class ReportModel {
  const ReportModel({
    required this.title,
    required this.description,
    required this.highlights,
    required this.mediaUrl,
    required this.publishTime,
    required this.location,
    required this.reporter,
    required this.category,
  });

  final String title;
  final String description;
  final List<String> highlights;
  final String mediaUrl;
  final String publishTime;
  final String location;
  final String reporter;
  final String category;

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      highlights: List<String>.from(
        json['highlights'] as List<dynamic>? ?? const <dynamic>[],
      ),
      mediaUrl: json['mediaUrl'] as String? ?? '',
      publishTime: json['publishTime'] as String? ?? '',
      location: json['location'] as String? ?? '',
      reporter: json['reporter'] as String? ?? '',
      category: json['category'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'highlights': highlights,
      'mediaUrl': mediaUrl,
      'publishTime': publishTime,
      'location': location,
      'reporter': reporter,
      'category': category,
    };
  }

  ReportModel copyWith({
    String? title,
    String? description,
    List<String>? highlights,
    String? mediaUrl,
    String? publishTime,
    String? location,
    String? reporter,
    String? category,
  }) {
    return ReportModel(
      title: title ?? this.title,
      description: description ?? this.description,
      highlights: highlights ?? this.highlights,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      publishTime: publishTime ?? this.publishTime,
      location: location ?? this.location,
      reporter: reporter ?? this.reporter,
      category: category ?? this.category,
    );
  }
}

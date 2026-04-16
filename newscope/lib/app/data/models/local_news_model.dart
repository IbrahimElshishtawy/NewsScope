class LocalNewsModel {
  const LocalNewsModel({
    required this.title,
    required this.shortSummary,
    required this.location,
    required this.publishTime,
    required this.imageUrl,
    required this.category,
    required this.reporter,
  });

  final String title;
  final String shortSummary;
  final String location;
  final String publishTime;
  final String imageUrl;
  final String category;
  final String reporter;

  factory LocalNewsModel.fromJson(Map<String, dynamic> json) {
    return LocalNewsModel(
      title: json['title'] as String? ?? '',
      shortSummary: json['shortSummary'] as String? ?? '',
      location: json['location'] as String? ?? '',
      publishTime: json['publishTime'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      category: json['category'] as String? ?? '',
      reporter: json['reporter'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'shortSummary': shortSummary,
      'location': location,
      'publishTime': publishTime,
      'imageUrl': imageUrl,
      'category': category,
      'reporter': reporter,
    };
  }

  LocalNewsModel copyWith({
    String? title,
    String? shortSummary,
    String? location,
    String? publishTime,
    String? imageUrl,
    String? category,
    String? reporter,
  }) {
    return LocalNewsModel(
      title: title ?? this.title,
      shortSummary: shortSummary ?? this.shortSummary,
      location: location ?? this.location,
      publishTime: publishTime ?? this.publishTime,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      reporter: reporter ?? this.reporter,
    );
  }
}

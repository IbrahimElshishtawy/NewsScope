class MainNewsModel {
  const MainNewsModel({
    required this.title,
    required this.imageUrl,
    required this.summary,
    required this.bulletPoints,
    required this.category,
    required this.publishTime,
    required this.location,
    required this.reporter,
    required this.focusTag,
  });

  final String title;
  final String imageUrl;
  final String summary;
  final List<String> bulletPoints;
  final String category;
  final String publishTime;
  final String location;
  final String reporter;
  final String focusTag;

  factory MainNewsModel.fromJson(Map<String, dynamic> json) {
    return MainNewsModel(
      title: json['title'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      bulletPoints: List<String>.from(
        json['bulletPoints'] as List<dynamic>? ?? const <dynamic>[],
      ),
      category: json['category'] as String? ?? '',
      publishTime: json['publishTime'] as String? ?? '',
      location: json['location'] as String? ?? '',
      reporter: json['reporter'] as String? ?? '',
      focusTag: json['focusTag'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'summary': summary,
      'bulletPoints': bulletPoints,
      'category': category,
      'publishTime': publishTime,
      'location': location,
      'reporter': reporter,
      'focusTag': focusTag,
    };
  }

  MainNewsModel copyWith({
    String? title,
    String? imageUrl,
    String? summary,
    List<String>? bulletPoints,
    String? category,
    String? publishTime,
    String? location,
    String? reporter,
    String? focusTag,
  }) {
    return MainNewsModel(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      summary: summary ?? this.summary,
      bulletPoints: bulletPoints ?? this.bulletPoints,
      category: category ?? this.category,
      publishTime: publishTime ?? this.publishTime,
      location: location ?? this.location,
      reporter: reporter ?? this.reporter,
      focusTag: focusTag ?? this.focusTag,
    );
  }
}

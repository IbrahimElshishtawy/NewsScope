class HeadlineModel {
  const HeadlineModel({
    required this.title,
    required this.summary,
    required this.category,
    required this.publishTime,
    required this.location,
    required this.reporter,
    required this.focusTag,
    required this.imageUrl,
  });

  final String title;
  final String summary;
  final String category;
  final String publishTime;
  final String location;
  final String reporter;
  final String focusTag;
  final String imageUrl;

  factory HeadlineModel.fromJson(Map<String, dynamic> json) {
    return HeadlineModel(
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      category: json['category'] as String? ?? '',
      publishTime: json['publishTime'] as String? ?? '',
      location: json['location'] as String? ?? '',
      reporter: json['reporter'] as String? ?? '',
      focusTag: json['focusTag'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'summary': summary,
      'category': category,
      'publishTime': publishTime,
      'location': location,
      'reporter': reporter,
      'focusTag': focusTag,
      'imageUrl': imageUrl,
    };
  }

  HeadlineModel copyWith({
    String? title,
    String? summary,
    String? category,
    String? publishTime,
    String? location,
    String? reporter,
    String? focusTag,
    String? imageUrl,
  }) {
    return HeadlineModel(
      title: title ?? this.title,
      summary: summary ?? this.summary,
      category: category ?? this.category,
      publishTime: publishTime ?? this.publishTime,
      location: location ?? this.location,
      reporter: reporter ?? this.reporter,
      focusTag: focusTag ?? this.focusTag,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

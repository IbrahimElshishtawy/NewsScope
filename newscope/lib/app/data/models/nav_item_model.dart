class NavItemModel {
  const NavItemModel({
    required this.title,
    required this.routeName,
    required this.summary,
    required this.scheduleLabel,
    required this.iconName,
  });

  final String title;
  final String routeName;
  final String summary;
  final String scheduleLabel;
  final String iconName;

  factory NavItemModel.fromJson(Map<String, dynamic> json) {
    return NavItemModel(
      title: json['title'] as String? ?? '',
      routeName: json['routeName'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      scheduleLabel: json['scheduleLabel'] as String? ?? '',
      iconName: json['iconName'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'routeName': routeName,
      'summary': summary,
      'scheduleLabel': scheduleLabel,
      'iconName': iconName,
    };
  }

  NavItemModel copyWith({
    String? title,
    String? routeName,
    String? summary,
    String? scheduleLabel,
    String? iconName,
  }) {
    return NavItemModel(
      title: title ?? this.title,
      routeName: routeName ?? this.routeName,
      summary: summary ?? this.summary,
      scheduleLabel: scheduleLabel ?? this.scheduleLabel,
      iconName: iconName ?? this.iconName,
    );
  }
}

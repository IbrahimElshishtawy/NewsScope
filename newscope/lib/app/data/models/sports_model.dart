class SportsModel {
  const SportsModel({
    required this.matchTitle,
    required this.result,
    required this.competition,
    required this.time,
    required this.scoreSummary,
    required this.homeTeam,
    required this.awayTeam,
    required this.status,
    required this.imageUrl,
  });

  final String matchTitle;
  final String result;
  final String competition;
  final String time;
  final String scoreSummary;
  final String homeTeam;
  final String awayTeam;
  final String status;
  final String imageUrl;

  factory SportsModel.fromJson(Map<String, dynamic> json) {
    return SportsModel(
      matchTitle: json['matchTitle'] as String? ?? '',
      result: json['result'] as String? ?? '',
      competition: json['competition'] as String? ?? '',
      time: json['time'] as String? ?? '',
      scoreSummary: json['scoreSummary'] as String? ?? '',
      homeTeam: json['homeTeam'] as String? ?? '',
      awayTeam: json['awayTeam'] as String? ?? '',
      status: json['status'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'matchTitle': matchTitle,
      'result': result,
      'competition': competition,
      'time': time,
      'scoreSummary': scoreSummary,
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      'status': status,
      'imageUrl': imageUrl,
    };
  }

  SportsModel copyWith({
    String? matchTitle,
    String? result,
    String? competition,
    String? time,
    String? scoreSummary,
    String? homeTeam,
    String? awayTeam,
    String? status,
    String? imageUrl,
  }) {
    return SportsModel(
      matchTitle: matchTitle ?? this.matchTitle,
      result: result ?? this.result,
      competition: competition ?? this.competition,
      time: time ?? this.time,
      scoreSummary: scoreSummary ?? this.scoreSummary,
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

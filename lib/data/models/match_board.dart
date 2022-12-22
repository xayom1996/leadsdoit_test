import 'package:intl/intl.dart';

class MatchBoard {
  String leagueName;
  String homeTeam;
  String status;
  DateTime timestamp;
  String awayTeam;
  int? homeScore;
  int? awayScore;

  MatchBoard({
    required this.leagueName,
    required this.homeTeam,
    required this.status,
    required this.timestamp,
    required this.awayTeam,
    this.homeScore,
    this.awayScore,
  });

  factory MatchBoard.fromJson(Map<String, dynamic> json) => MatchBoard(
      leagueName: json['strLeague'],
      homeTeam: json['strHomeTeam'],
      status: json['strStatus'],
      timestamp: DateTime.parse(json['strTimestamp']),
      awayTeam: json['strAwayTeam'],
      homeScore: json['intHomeScore'] != null
          ? int.parse(json['intHomeScore'])
          : json['intHomeScore'],
      awayScore: json['intAwayScore'] != null
          ? int.parse(json['intAwayScore'])
          : json['intAwayScore'],
  );

  Map<String, dynamic> toJson() {
    return {
      'leagueName': leagueName,
      'homeTeam': homeTeam,
      'status': status,
      'timestamp': timestamp.toIso8601String(),
      'awayTeam': awayTeam,
      'homeScore': homeScore != null
          ? homeScore.toString()
          : homeScore,
      'awayScore': awayScore != null
          ? awayScore.toString()
          : awayScore,
    };
  }

  String getHomeScore() {
    return homeScore != null ? homeScore.toString() : '-';
  }

  String getAwayScore() {
    return awayScore != null ? awayScore.toString() : '-';
  }

  String getMonthDay() {
    if (timestamp.year == DateTime.now().year) {
      return DateFormat('dd.MM').format(timestamp);
    }
    return DateFormat('dd.MM.yyyy').format(timestamp);
  }
}

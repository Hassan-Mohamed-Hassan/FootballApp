class TableModel {
  TableModel({
    required this.position,
    required this.squadLogo,
    required this.name,
    required this.points,
    required this.played,
    required this.winned,
    required this.loosed,
    required this.tie,
    required this.goalDifference,
  });
  final String? position;
  final String? squadLogo;
  final String? name;
  final String? points;
  final String? played;
  final String? winned;
  final String? loosed;
  final String? tie;
  final String? goalDifference;

  factory TableModel.fromJson(Map<String, dynamic> json){
    return TableModel(
      position: json["Position"],
      squadLogo: json["SquadLogo"],
      name: json["Name"],
      points: json["Points"],
      played: json["Played"],
      winned: json["Winned"],
      loosed: json["Loosed"],
      tie: json["Tie"],
      goalDifference: json["Goal Difference"],
    );
  }

  Map<String, dynamic> toJson() => {
    "Position": position,
    "SquadLogo": squadLogo,
    "Name": name,
    "Points": points,
    "Played": played,
    "Winned": winned,
    "Loosed": loosed,
    "Tie": tie,
    "Goal Difference": goalDifference,
  };

}

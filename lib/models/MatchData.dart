class MatchData {
  Match match;
  FirstTeam firstTeam;
  FirstTeam secondTeam;
  List<TacticalPositions> tacticalPositions;
  List<TeamPlayers> firstTeamPlayers;
  List<TeamPlayers> secondTeamPlayers;

  MatchData(
      {this.match,
      this.firstTeam,
      this.secondTeam,
      this.tacticalPositions,
      this.firstTeamPlayers,
      this.secondTeamPlayers});

  MatchData.fromJson(Map<String, dynamic> json) {
    match = json['match'] != null ? new Match.fromJson(json['match']) : null;
    firstTeam = json['first_team'] != null
        ? new FirstTeam.fromJson(json['first_team'])
        : null;
    secondTeam = json['second_team'] != null
        ? new FirstTeam.fromJson(json['second_team'])
        : null;
    if (json['tactical_positions'] != null) {
      tacticalPositions = new List<TacticalPositions>();
      json['tactical_positions'].forEach((v) {
        tacticalPositions.add(new TacticalPositions.fromJson(v));
      });
    }
    if (json['first_team_players'] != null) {
      firstTeamPlayers = new List<TeamPlayers>();
      json['first_team_players'].forEach((v) {
        firstTeamPlayers.add(new TeamPlayers.fromJson(v));
      });
    }
    if (json['second_team_players'] != null) {
      secondTeamPlayers = new List<TeamPlayers>();
      json['second_team_players'].forEach((v) {
        secondTeamPlayers.add(new TeamPlayers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.match != null) {
      data['match'] = this.match.toJson();
    }
    if (this.firstTeam != null) {
      data['first_team'] = this.firstTeam.toJson();
    }
    if (this.secondTeam != null) {
      data['second_team'] = this.secondTeam.toJson();
    }
    if (this.tacticalPositions != null) {
      data['tactical_positions'] =
          this.tacticalPositions.map((v) => v.toJson()).toList();
    }
    if (this.firstTeamPlayers != null) {
      data['first_team_players'] =
          this.firstTeamPlayers.map((v) => v.toJson()).toList();
    }
    if (this.secondTeamPlayers != null) {
      data['second_team_players'] =
          this.secondTeamPlayers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Match {
  int id;
  int firstTeamId;
  int secondTeamId;
  String date;
  Null championshipId;
  String dataCollector;
  String createdAt;
  String updatedAt;

  Match(
      {this.id,
      this.firstTeamId,
      this.secondTeamId,
      this.date,
      this.championshipId,
      this.dataCollector,
      this.createdAt,
      this.updatedAt});

  Match.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstTeamId = json['first_team_id'];
    secondTeamId = json['second_team_id'];
    date = json['date'];
    championshipId = json['championship_id'];
    dataCollector = json['data_collector'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_team_id'] = this.firstTeamId;
    data['second_team_id'] = this.secondTeamId;
    data['date'] = this.date;
    data['championship_id'] = this.championshipId;
    data['data_collector'] = this.dataCollector;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FirstTeam {
  int id;
  String name;
  Null logo;
  String createdAt;
  String updatedAt;

  FirstTeam({this.id, this.name, this.logo, this.createdAt, this.updatedAt});

  FirstTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TacticalPositions {
  int id;
  Player player;
  String position;
  String createdAt;
  String updatedAt;

  TacticalPositions(
      {this.id, this.player, this.position, this.createdAt, this.updatedAt});

  TacticalPositions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.player != null) {
      data['player'] = this.player.toJson();
    }
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Player {
  int id;
  String name;
  String createdAt;
  String updatedAt;

  Player({this.id, this.name, this.createdAt, this.updatedAt});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TeamPlayers {
  int id;
  int playerId;
  Player player;
  String currentTeam;
  String number;
  String createdAt;
  String updatedAt;

  TeamPlayers(
      {this.id,
      this.playerId,
      this.player,
      this.currentTeam,
      this.number,
      this.createdAt,
      this.updatedAt});

  TeamPlayers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    currentTeam = json['current_team'];
    number = json['number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['player_id'] = this.playerId;
    if (this.player != null) {
      data['player'] = this.player.toJson();
    }
    data['current_team'] = this.currentTeam;
    data['number'] = this.number;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
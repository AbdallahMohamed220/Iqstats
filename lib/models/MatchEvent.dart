import './Event.dart';

class MatchEvent {
  int id;
  int matchId;
  int eventId;
  Event event;
  Player player1;
  Player player2;
  String half;
  String startedAtSec;
  String startedAtMin;
  String durationMin;
  String durationSec;
  String startLocationX;
  String startLocationY;
  String endLocationX;
  String endLocationY;
  String fieldLocationX;
  String fieldLocationY;
  String goalLocationX;
  String goalLocationY;
  String outcome;
  String extera1;
  String extera2;
  String extera3;
  String extera4;
  String extera5;
  String createdAt;
  String updatedAt;

  MatchEvent(
      {this.id,
      this.matchId,
      this.eventId,
      this.event,
      this.player1,
      this.player2,
      this.half,
      this.startedAtSec,
      this.startedAtMin,
      this.durationMin,
      this.durationSec,
      this.startLocationX,
      this.startLocationY,
      this.endLocationX,
      this.endLocationY,
      this.fieldLocationX,
      this.fieldLocationY,
      this.goalLocationX,
      this.goalLocationY,
      this.outcome,
      this.extera1,
      this.extera2,
      this.extera3,
      this.extera4,
      this.extera5,
      this.createdAt,
      this.updatedAt});

  MatchEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matchId = json['match_id'];
    eventId = json['event_id'];
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;
    player1 = json['player_1'] != null
        ? new Player.fromJson(json['player_1'])
        : null;
    player2 = json['player_2'] != null
        ? new Player.fromJson(json['player_2'])
        : null;
    half = json['half'];
    startedAtSec = json['started_at_sec'].toString();
    startedAtMin = json['started_at_min'].toString();
    durationMin = json['duration_min'].toString();
    durationSec = json['duration_sec'].toString();
    startLocationX = json['start_location_x'].toString();
    startLocationY = json['start_location_y'].toString();
    endLocationX = json['end_location_x'].toString();
    endLocationY = json['end_location_y'].toString();
    fieldLocationX = json['field_location_x'].toString();
    fieldLocationY = json['field_location_y'].toString();
    goalLocationX = json['goal_location_x'].toString();
    goalLocationY = json['goal_location_y'].toString();
    outcome = json['outcome'].toString();
    extera1 = json['extera_1'];
    extera2 = json['extera_2'];
    extera3 = json['extera_3'];
    extera4 = json['extera_4'];
    extera5 = json['extera_5'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['match_id'] = this.matchId;
    data['event_id'] = this.eventId;
    if (this.event != null) {
      data['event'] = this.event.toJson();
    }
    if (this.player1 != null) {
      data['player_1'] = this.player1.toJson();
    }
    data['player_2'] = this.player2;
    data['half'] = this.half;
    data['started_at_sec'] = this.startedAtSec;
    data['started_at_min'] = this.startedAtMin;
    data['duration_min'] = this.durationMin;
    data['duration_sec'] = this.durationSec;
    data['start_location_x'] = this.startLocationX;
    data['start_location_y'] = this.startLocationY;
    data['end_location_x'] = this.endLocationX;
    data['end_location_y'] = this.endLocationY;
    data['field_location_x'] = this.fieldLocationX;
    data['field_location_y'] = this.fieldLocationY;
    data['goal_location_x'] = this.goalLocationX;
    data['goal_location_y'] = this.goalLocationY;
    data['outcome'] = this.outcome;
    data['extera_1'] = this.extera1;
    data['extera_2'] = this.extera2;
    data['extera_3'] = this.extera3;
    data['extera_4'] = this.extera4;
    data['extera_5'] = this.extera5;
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
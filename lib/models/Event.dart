
class Event {
  String id;
  String eventId;
  String name;
  String createdAt;
  String updatedAt;

  Event({this.id, this.eventId, this.name, this.createdAt, this.updatedAt});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    eventId = json['event_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_id'] = this.eventId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
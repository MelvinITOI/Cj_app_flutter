import 'dart:convert';

List<Sessions> sessionsFromJson(String str) => List<Sessions>.from(json.decode(str).map((x) => Sessions.fromJson(x)));

String sessionsToJson(List<Sessions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sessions {
  Sessions({
    required this.id,
    required this.title,
    this.desc,
    required this.status,
    required this.uri,
    required this.createdAt,
    required this.createdBy,
    required this.members,
    required this.duration,
    required this.timeZone,
    required this.starts,
    this.ends,
    this.mesiboId,
    required this.messages,
    required this.recordings,
  });

  int id;
  String title;
  int? mesiboId;
  String starts;
  String? ends;
  String status;
  String uri;
  String createdAt;
  CreatedBy createdBy;
  Members members;
  String? desc;
  List<dynamic> messages;
  List<dynamic> recordings;
  int duration;
  String timeZone;

  factory Sessions.fromJson(Map<String, dynamic> json) => Sessions(
        id: json["id"],
        title: json["title"],
        mesiboId: json["mesiboId"],
        starts: json["starts"],
        ends: json["ends"],
        status: json["status"],
        uri: json["uri"],
        createdAt: json["created_at"],
        createdBy: CreatedBy.fromJson(json["created_by"]),
        members: Members.fromJson(json["members"]),
        desc: json["desc"],
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        recordings: List<dynamic>.from(json["recordings"].map((x) => x)),
        duration: json["duration"],
        timeZone: json["timeZone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "mesiboId": mesiboId,
        "starts": starts,
        "ends": ends,
        "status": status,
        "uri": uri,
        "created_at": createdAt,
        "created_by": createdBy.toJson(),
        "members": members.toJson(),
        "desc": desc,
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "recordings": List<dynamic>.from(recordings.map((x) => x)),
        "duration": duration,
        "timeZone": timeZone,
      };
}

class CreatedBy {
  CreatedBy({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class Members {
  Members({
    required this.name,
    required this.qbid,
    required this.id,
  });

  String name;
  String qbid;
  int id;

  factory Members.fromJson(Map<String, dynamic> json) => Members(
        name: json["name"],
        qbid: json["qbid"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "qbid": qbid,
        "id": id,
      };
}

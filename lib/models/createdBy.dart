class CreatedBy {
  CreatedBy({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

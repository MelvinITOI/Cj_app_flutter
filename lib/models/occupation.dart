class Occupation {
  int? occupationId;
  String? occupationName;
  String? occupationStatus;
  String? employerName;
  String? designation;
  bool? tillDate;
  int userId;
  String? startdate;
  String? endDate;
  String? createdDate;

  Occupation(
      {this.occupationId,
      this.occupationName,
      this.occupationStatus,
      this.employerName,
      this.designation,
      this.tillDate,
      required this.userId,
      this.startdate,
      this.endDate,
      this.createdDate});

  factory Occupation.fromJson(Map<String, dynamic> json) {
    return Occupation(
        occupationId: json['occupationId'],
        occupationName: json['occupationName'],
        occupationStatus: json['occupationStatus'],
        employerName: json['employerName'],
        designation: json['designation'],
        tillDate: json['tillDate'],
        userId: json['userId'],
        startdate: json['startdate'],
        endDate: json['endDate'],
        createdDate: json['createdDate']);
  }
}

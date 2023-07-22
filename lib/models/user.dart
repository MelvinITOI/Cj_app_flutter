import 'occupation.dart';

class User {
  int id;
  String firstName;
  String? lastName;
  String emailId;
  String? mobileNumber;
  int referedBy;
  String? source;
  String status;
  String? nationality;
  String? dateOfBirth;
  String gender;
  String qbid;
  String inviteCode;
  String createdDate;
  String registrationDate;
  bool isBasicDetail;
  bool isContactDetail;
  bool isEducationDetail;
  bool isExperienceDetail;
  bool isSkillDetail;
  bool isDeleteProfileImage;
  Occupation? occupation;

  User(
      {required this.id,
      required this.firstName,
      this.lastName,
      required this.emailId,
      this.mobileNumber,
      required this.referedBy,
      this.source,
      required this.status,
      this.nationality,
      this.dateOfBirth,
      required this.gender,
      required this.qbid,
      required this.inviteCode,
      required this.createdDate,
      required this.registrationDate,
      required this.isBasicDetail,
      required this.isContactDetail,
      required this.isEducationDetail,
      required this.isExperienceDetail,
      required this.isSkillDetail,
      required this.isDeleteProfileImage,
      this.occupation});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        id: json['id'] as int,
        firstName: json['firstName'],
        lastName: json['lastName'],
        emailId: json['emailId'],
        mobileNumber: json['mobileNumber'],
        referedBy: json['referedBy'],
        source: json['source'],
        status: json['status'],
        nationality: json['nationality'],
        dateOfBirth: json['dateOfBirth'],
        gender: json['gender'],
        qbid: json['qbid'],
        inviteCode: json['inviteCode'],
        createdDate: json['createdDate'],
        registrationDate: json['registrationDate'],
        isBasicDetail: json['isBasicDetail'],
        isContactDetail: json['isContactDetail'],
        isEducationDetail: json['isEducationDetail'],
        isExperienceDetail: json['isExperienceDetail'],
        isSkillDetail: json['isSkillDetail'],
        isDeleteProfileImage: json['isDeleteProfileImage'],
        occupation: ((json['occupation'] != null)
            ? Occupation.fromJson((json['occupation'] as List).first)
            : null));
  }
}

import 'dart:convert';

class Mentees {
  final String id;
  final String userId;
  final String fullName;
  final String phone;
  final String role;
  final String birthDate;
  final String addrees;
  final String profilePicture;
  final String createdAt;
  final String updatedAt;

  Mentees({
    this.id = '',
    this.userId = '',
    this.fullName = '',
    this.phone = '',
    this.role = '',
    this.birthDate = '',
    this.addrees = '',
    this.profilePicture = '',
    this.createdAt = '',
    this.updatedAt = '',
  });
}

class MenteesModel {
  MenteesModel({
    required this.id,
    this.userId = '',
    this.menteeId = '',
    this.email = '',
    required this.fullname,
    required this.phone,
    required this.birthDate,
    this.profilePicture = '',
    this.addrees = '',
  });

  final String id;
  final String userId;
  final String menteeId;
  final String email;
  final String fullname;
  final String phone;
  final String birthDate;
  final String profilePicture;
  final String addrees;

  factory MenteesModel.fromJson(Map<String, dynamic> json) => MenteesModel(
        id: json["id"],
        userId: json["userId"],
        menteeId: json["role"],
        email: json["email"],
        fullname: json["fullname"],
        phone: json["phone"],
        birthDate: json["birthDate"],
        profilePicture: json["profilePicture"],
        addrees: json["addrees"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "role": menteeId,
        "email": email,
        "fullname": fullname,
        "phone": phone,
        "birthDate": birthDate,
        "profilePicture": profilePicture,
        "addrees": addrees,
      };
}

MenteesModel menteesFromJson(String str) =>
    MenteesModel.fromJson(json.decode(str));

String menteesToJson(MenteesModel data) => json.encode(data.toJson());

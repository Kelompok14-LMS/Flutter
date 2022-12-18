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
  int? code;
  String? status;
  String? message;
  Data? data;

  MenteesModel({this.code, this.status, this.message, this.data});

  MenteesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? fullname;
  String? phone;
  String? role;
  String? birthDate;
  String? profilePicture;
  String? email;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.fullname,
      this.phone,
      this.role,
      this.birthDate,
      this.profilePicture,
      this.email,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fullname = json['fullname'];
    phone = json['phone'];
    role = json['role'];
    birthDate = json['birth_date'];
    profilePicture = json['profile_picture'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['role'] = role;
    data['birth_date'] = birthDate;
    data['profile_picture'] = profilePicture;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ReviewCardModel {
  int? code;
  String? status;
  String? message;
  List<Data>? data;

  ReviewCardModel({this.code, this.status, this.message, this.data});

  ReviewCardModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? menteeId;
  String? courseId;
  String? title;
  String? mentor;
  bool? reviewed;
  String? thumbnail;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.menteeId,
      this.courseId,
      this.title,
      this.mentor,
      this.reviewed,
      this.thumbnail,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    menteeId = json['mentee_id'];
    courseId = json['course_id'];
    title = json['title'];
    mentor = json['mentor'];
    reviewed = json['reviewed'];
    thumbnail = json['thumbnail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mentee_id'] = menteeId;
    data['course_id'] = courseId;
    data['title'] = title;
    data['mentor'] = mentor;
    data['reviewed'] = reviewed;
    data['thumbnail'] = thumbnail;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

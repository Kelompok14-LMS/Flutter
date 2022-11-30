// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourseModel {
  String? id;
  String? mentorId;
  String? categoryId;
  String? title;
  String? descriptions;
  String? thumbnail;
  String? createdAt;
  String? updateAt;
  CourseModel({
    this.id,
    this.mentorId,
    this.categoryId,
    this.title,
    this.descriptions,
    this.thumbnail,
    this.createdAt,
    this.updateAt,
  });

  CourseModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        mentorId = json['mentor_id'],
        categoryId = json['category_id'],
        title = json['title'],
        descriptions = json['descriptions'],
        thumbnail = json['thumbnail'],
        createdAt = json['created_at'],
        updateAt = json['update_at'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mentor_id': mentorId,
      'category_id': categoryId,
      'title': title,
      'descriptions': descriptions,
      'thumbnail': thumbnail,
      'created_at': createdAt,
      'update_at': updateAt,
    };
  }
}
